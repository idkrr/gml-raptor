/// @description layout if necessary
event_inherited();

if (draw_on_gui && __CONTROL_NEEDS_LAYOUT && is_null(control_tree.parent_tree))
	control_tree.layout();
	