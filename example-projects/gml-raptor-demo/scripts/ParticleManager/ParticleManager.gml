/*
	Create a particle manager in a Controller Object (like a RoomController)
	Specify the layer name where particles shall be created (that's the layer, the particle system will use).
	
	NOTE: You MUST call the cleanup function in the CleanUp event of the controller to avoid memory leaks!
	
*/

#macro __POOL_EMITTERS		"__particle_emitter_pool"

/// @function					ParticleManager(particle_layer_name)
/// @description				Helps in organizing particles for a level
/// @param {string} particle_layer_name
/// @returns {struct} ParticleManager
function ParticleManager(particle_layer_name, system_index = 0) constructor {
	log(sprintf("ParticleManager created for layer '{0}'", particle_layer_name));
	system = part_system_create_layer(particle_layer_name, false);
	
	__emitter_object	= ParticleEmitter;
	__layer_name		= particle_layer_name;
	__system_index		= system_index;
	__particle_types	= {};
	__emitters			= {};
	__emitter_ranges	= {};
	
	__buffered_delta	= {};
	__buffered_target	= {};
	
	/// @function		__resolve_emitter_name(name_or_emitter)
	static __resolve_emitter_name = function(name_or_emitter) {
		return is_string(name_or_emitter) ? name_or_emitter : name_or_emitter.emitter_name;
	}
	
	/// @function		set_emitter_object(_emitter_object)
	/// @description	Set an object type to use when attaching emitters (default = ParticleEmitter)
	static set_emitter_object = function(_emitter_object) {
		__emitter_object = _emitter_object;
	}
	
	/// @function					particle_type_get(name)
	/// @description				register (or get existing) part type for leak-free destroying at end of level
	static particle_type_get = function(name) {
		var rv = variable_struct_exists(__particle_types, name) ? variable_struct_get(__particle_types, name) : part_type_create();
		variable_struct_set(__particle_types, name, rv);
		return rv;
	}

	/// @function					particle_type_exists(name)
	/// @returns {bool}	y/n
	static particle_type_exists = function(name) {
		return variable_struct_exists(__particle_types, name);
	}

	/// @function					particle_type_destroy(name)
	/// @description				immediately destroy a particle type
	static particle_type_destroy = function(name) {
		if (variable_struct_exists(__particle_types, name)) {
			part_type_destroy(variable_struct_get(__particle_types, name));
			variable_struct_remove(__particle_types, name);
		}
	}
	
	/// @function					emitter_get(name_or_emitter, default_particle_if_new = undefined)
	/// @description				register (or get existing) emitter for leak-free destroying at end of level
	static emitter_get = function(name_or_emitter, default_particle_if_new = undefined) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		
		var rv = variable_struct_exists(__emitters, name_or_emitter) ? 
			variable_struct_get(__emitters, name_or_emitter) : 
			new __emitter(part_emitter_create(system), default_particle_if_new);
			
		variable_struct_set(__emitters, name_or_emitter, rv);
		rv.emitter_name = name_or_emitter;
		return rv;
	}
	
	/// @function					emitter_clone(name_or_emitter, new_name = undefined)
	/// @description				clone an emitter (and its range) to a new name
	static emitter_clone = function(name_or_emitter, new_name = undefined) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		if (!variable_struct_exists(__emitter_ranges, name_or_emitter))
			return undefined;
		
		new_name = new_name ?? name_or_emitter + SUID;
		var origemi = emitter_get(name_or_emitter);
		var rv = emitter_get(new_name, origemi.default_particle);
		var orig = variable_struct_get(__emitter_ranges, name_or_emitter);
		var rng = new __emitter_range(new_name, 
			orig.minco.x, orig.maxco.x,
			orig.minco.y, orig.maxco.y,
			orig.eshape,
			orig.edist
		);
		
		variable_struct_set(__emitter_ranges, new_name, rng);
		return rv;
	}
	
	/// @function		attach_emitter(name_or_emitter, instance, layer_name_or_depth = undefined, particle_type_name = undefined, 
	///								   follow_this_instance = true, use_object_pools = true)
	/// @description	Attach a new ParticleEmitter instance on the specified layer to an instance
	///					with optional follow-setting.
	///					NOTE: If you need more than one emitter of this kind, look at attach_emitter_clone
	/// @returns {ParticleEmitter}	the created object instance on the layer for cleanup if you no longer need it
	static attach_emitter = function(name_or_emitter, instance, layer_name_or_depth = undefined, particle_type_name = undefined,
									 follow_this_instance = true, use_object_pools = true) {
		var ix  = __system_index;
		var xp	= instance.x;
		var yp	= instance.y;
		
		layer_name_or_depth = layer_name_or_depth ?? __layer_name;
		var rv	= use_object_pools ?
			pool_get_instance(__POOL_EMITTERS, __emitter_object, layer_name_or_depth) :
			instance_create(xp, yp, layer_name_or_depth, __emitter_object);

		with(rv) if (stream_on_create) stop(); // stop for now - you don't have a particle!

		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		var emi = emitter_get(name_or_emitter);
		emitter_move_range_to(name_or_emitter, xp, yp);
		particle_type_name = particle_type_name ?? emi.default_particle;

		with(rv) {
			x = xp;
			y = yp;
			partsys_index = ix;
			follow_instance = follow_this_instance ? instance : undefined;
			emitter_name = name_or_emitter;
			stream_particle_name = particle_type_name;
			burst_particle_name = particle_type_name;
			if (stream_on_create) stream(); // NOW you may stream!
		}	
		
		return rv;
	}
	
	/// @function		attach_emitter_clone(name_or_emitter, instance, layer_name_or_depth = undefined, particle_type_name = undefined,
	///										 follow_this_instance = true, use_object_pools = true)
	/// @description	Attach a clone of an existing emitter to a new ParticleEmitter instance 
	///					on the specified layer to an instance with optional follow-setting.
	/// @returns {ParticleEmitter}	the created object instance on the layer for cleanup if you no longer need it
	static attach_emitter_clone = function(name_or_emitter, instance, layer_name_or_depth = undefined, particle_type_name = undefined, 
										   follow_this_instance = true, use_object_pools = true) {
		return attach_emitter(emitter_clone(name_or_emitter), instance, layer_name_or_depth, particle_type_name, follow_this_instance, use_object_pools);
	}
	
	/// @function					emitter_exists(name)
	/// @returns {bool}	y/n
	static emitter_exists = function(name) {
		return variable_struct_exists(__emitters, name);
	}

	/// @function		emitter_set_range(name_or_emitter, xmin, xmax, ymin, ymax, shape, distribution)
	/// @description	Set the range of an emitter
	static emitter_set_range = function(name_or_emitter, xmin, xmax, ymin, ymax, shape, distribution) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		var emi = emitter_get(name_or_emitter); // creates the emitter if it does not exist
		var rng = variable_struct_get(__emitter_ranges, name_or_emitter) ?? new __emitter_range(name_or_emitter, xmin, xmax, ymin, ymax, shape, distribution);
		rng.minco.set(xmin, ymin);
		rng.maxco.set(xmax, ymax);
		rng.baseminco.set(xmin, ymin);
		rng.basemaxco.set(xmax, ymax);
		rng.eshape = shape;
		rng.edist = distribution;
		part_emitter_region(system, emi.emitter, xmin, xmax, ymin, ymax, shape, distribution);
		variable_struct_set(__emitter_ranges, name_or_emitter, rng);
	}

	/// @function		emitter_move_range_by(name_or_emitter, xdelta, ydelta)
	/// @description	Move the range of the emitter by the specified delta, keeping its size, shape and distribution.
	///					Use this, if an emitter shall follow another object on screen (like the mouse cursor)
	static emitter_move_range_by = function(name_or_emitter, xdelta, ydelta) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		var rng = variable_struct_get(__emitter_ranges, name_or_emitter);
		if (rng == undefined) {
			if (DEBUG_LOG_PARTICLES)
				log(sprintf("*WARNING* Buffering range_by for '{0}', until the range exists!", name_or_emitter));
			variable_struct_set(__buffered_delta, name_or_emitter, new Coord2(xdelta, ydelta));
			return;
		}
		__buffered_delta = undefined;
		rng.minco.add(xdelta, ydelta);
		rng.maxco.add(xdelta, ydelta);
		part_emitter_region(system, emitter_get(name_or_emitter).emitter, rng.minco.x, rng.maxco.x, rng.minco.y, rng.maxco.y, rng.eshape, rng.edist);
	}

	/// @function		emitter_move_range_to(name_or_emitter, newx, newy)
	/// @description	Move the range of the emitter a new position, keeping its shape and distribution.
	///					Use this, if an emitter shall follow another object on screen (like the mouse cursor)
	static emitter_move_range_to = function(name_or_emitter, newx, newy) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		var rng = variable_struct_get(__emitter_ranges, name_or_emitter);
		if (rng == undefined) {
			if (DEBUG_LOG_PARTICLES)
				log(sprintf("*WARNING* Buffering range_to for '{0}', until the range exists!", name));
			variable_struct_set(__buffered_target, name_or_emitter, new Coord2(newx, newy));
			return;
		}
		variable_struct_remove(__buffered_target, name_or_emitter);
		var diff = rng.maxco.clone2().minus(rng.minco);
		rng.minco.set(rng.baseminco.x + newx, rng.baseminco.y + newy);
		rng.maxco = rng.minco.clone2().plus(diff);
		part_emitter_region(system, emitter_get(name_or_emitter).emitter, rng.minco.x, rng.maxco.x, rng.minco.y, rng.maxco.y, rng.eshape, rng.edist);
	}

	/// @function		emitter_scale_to(name_or_emitter, instance)
	/// @description	scales the emitter range to a specified object instance
	static emitter_scale_to = function(name_or_emitter, instance) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		var rng = variable_struct_get(__emitter_ranges, name_or_emitter);
		if (rng != undefined)
			rng.scale_to(instance);
	}
	
	/// @function		emitter_get_range_min(name_or_emitter)
	/// @description	Gets the min coordinates of an emitter as Coord2 or Coord2(-1,-1) if not found
	static emitter_get_range_min = function(name_or_emitter) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		var rng = variable_struct_get(__emitter_ranges, name_or_emitter);
		return (rng != undefined ? rng.minco : new Coord2(-1, -1));
	}

	/// @function		emitter_get_range_max(name_or_emitter)
	/// @description	Gets the min coordinates of an emitter as Coord2 or Coord2(-1,-1) if not found
	static emitter_get_range_max = function(name_or_emitter) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		var rng = variable_struct_get(__emitter_ranges, name_or_emitter);
		return (rng != undefined ? rng.maxco : new Coord2(-1, -1));
	}

	/// @function					emitter_destroy(name_or_emitter)
	/// @description				immediately destroy an emitter
	static emitter_destroy = function(name_or_emitter) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		if (variable_struct_exists(__emitters, name_or_emitter)) {
			var emitter = variable_struct_get(__emitters, name_or_emitter).emitter;
			part_emitter_clear(system, emitter);
			part_emitter_destroy(system, emitter);
			variable_struct_remove(__emitters, name_or_emitter);
		}
		if (variable_struct_exists(__emitter_ranges, name_or_emitter)) {
			variable_struct_remove(__emitters, name_or_emitter);
		}
	}

	/// @function			cleanup()
	/// @description		you MUST call this in the cleanup event of your controller!
	static cleanup = function() {
		part_system_destroy(system);
		var names = variable_struct_get_names(__particle_types);
		var i = 0; repeat(array_length(names)) {
			if (variable_struct_exists(__particle_types, names[i]) && 
				variable_struct_get   (__particle_types, names[i]) != undefined) {
				part_type_destroy(variable_struct_get(__particle_types, names[i]));
				variable_struct_set(__particle_types, names[i], undefined);
			}
			i++;
		}
		__particle_types = {};
		
		names = variable_struct_get_names(__emitters);
		i = 0; repeat(array_length(names)) {
			if (variable_struct_exists(__emitters, names[i]) && 
				variable_struct_get   (__emitters, names[i]) != undefined) {
				var emitter = variable_struct_get(__emitters, names[i]).emitter;
				part_emitter_clear(system, emitter);
				part_emitter_destroy(system, emitter);
				variable_struct_set(__emitters, names[i], undefined);
			}
			i++;
		}
		__emitters = {};
		__emitter_ranges = {};
	}
	
	/// @function		__apply_buffering()
	static __apply_buffering = function(name) {
		var r = variable_struct_get(__buffered_target, name);
		if (r != undefined) {
			emitter_move_range_to(name, r.x, r.y);
			if (DEBUG_LOG_PARTICLES)
				log("range_to buffering apply " + (variable_struct_exists(__buffered_target, name) ? "FAILED" : "successful"));
		}
		r = variable_struct_get(__buffered_delta, name);
		if (r != undefined) {
			emitter_move_range_by(name, r.x, r.y);
			if (DEBUG_LOG_PARTICLES)
				log("range_by buffering apply " + (variable_struct_exists(__buffered_delta, name) ? "FAILED" : "successful"));
		}
	}
	
	/// @function			stream(name_or_emitter, particles_per_frame = 1, particle_name = undefined)
	/// @description		start streaming particles at a specified rate
	static stream = function(name_or_emitter, particles_per_frame = 1, particle_name = undefined) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		__apply_buffering(name_or_emitter);
		var emi = emitter_get(name_or_emitter);
		part_emitter_stream(system, 
			emi.emitter, 
			particle_type_get(particle_name ?? emi.default_particle), 
			particles_per_frame);
	}
	
	/// @function			stream_at(xpos, ypos, name_or_emitter, particles_per_frame = 1, particle_name = undefined)
	/// @description		start streaming particles at a specified rate and at a specified coordinate
	///						ATTENTION! This method will move the emitter range to the specified coordinates!
	static stream_at = function(xpos, ypos, name_or_emitter, particles_per_frame = 1, particle_name = undefined) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		__apply_buffering(name_or_emitter);
		emitter_move_range_to(name_or_emitter, xpos, ypos);
		stream(name_or_emitter, particles_per_frame, particle_name);
	}

	/// @function			stream_stop(name_or_emitter)
	/// @description		stop streaming particles.
	///						ATTENTION! You must setup part_emitter_region again if this
	///						emitter is going to be reused in the future!
	static stream_stop = function(name_or_emitter) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		var emi = emitter_get(name_or_emitter).emitter;
		part_emitter_clear(system, emi);
		var rng = variable_struct_get(__emitter_ranges, name_or_emitter);
		if (rng != undefined)
			part_emitter_region(system, emi, rng.minco.x, rng.maxco.x, rng.minco.y, rng.maxco.y, rng.eshape, rng.edist);
	}
	
	/// @function			burst(name_or_emitter, particle_count = 32, particle_name = undefined)
	/// @description		one time particle explosion burst
	static burst = function(name_or_emitter, particle_count = 32, particle_name = undefined) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		var emi = emitter_get(name_or_emitter);
		__apply_buffering(name_or_emitter);
		part_emitter_burst(system, 
			emi.emitter, 
			particle_type_get(particle_name ?? emi.default_particle), 
			particle_count);
	}

	/// @function			burst_at(xpos, ypos, name_or_emitter, particle_count, particle_name)
	/// @description		one time particle explosion burst at a specified coordinate
	///						ATTENTION! This method will move the emitter range to the specified coordinates!
	static burst_at = function(xpos, ypos, name_or_emitter, particle_count = 32, particle_name = undefined) {
		name_or_emitter = __resolve_emitter_name(name_or_emitter);
		__apply_buffering(name_or_emitter);
		emitter_move_range_to(name_or_emitter, xpos, ypos);
		burst(name_or_emitter, particle_count, particle_name);
	}

	/// @function			spawn_particles(xpos, ypos, particle_count, particle_name)
	/// @description		spawn particles at a specified position without an emitter
	static spawn_particles = function(xpos, ypos, particle_count, particle_name) {
		part_particles_create(system, xpos, ypos,
			particle_type_get(particle_name), particle_count);
	}
}

function __emitter(part_emitter, default_particle_name = "") constructor {
	emitter = part_emitter;
	emitter_name = "";
	default_particle = default_particle_name;
}

function __emitter_range(name, xmin, xmax, ymin, ymax, shape, distribution) constructor {
	ctor = {
		minco: new Coord2(xmin, ymin),
		maxco: new Coord2(xmax, ymax)
	};
	ename = name;
	center = new Coord2((xmax - xmin) / 2, (ymax - ymin) / 2);
	minco = new Coord2(xmin, ymin);
	maxco = new Coord2(xmax, ymax);
	baseminco = minco.clone2();
	basemaxco = maxco.clone2();
	eshape = shape;
	edist = distribution;
	
	/// @function		scale_to(instance)
	static scale_to = function(instance) {
		minco.set(ctor.minco.x * instance.image_xscale, ctor.minco.y * instance.image_yscale);
		maxco.set(ctor.maxco.x * instance.image_xscale, ctor.maxco.y * instance.image_yscale);
		center.set((maxco.x - minco.x) / 2, (maxco.y - minco.y) / 2);
		baseminco.set(minco.x, minco.y);
		basemaxco.set(maxco.x, maxco.y);
	}
}
