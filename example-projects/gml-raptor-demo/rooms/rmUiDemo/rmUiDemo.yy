{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rmUiDemo",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"uiDemoRoomController","path":"rooms/rmUiDemo/rmUiDemo.yy",},
    {"name":"uiDemoMouseCursor","path":"rooms/rmUiDemo/rmUiDemo.yy",},
    {"name":"inst_6780F786","path":"rooms/rmUiDemo/rmUiDemo.yy",},
    {"name":"inst_41F202B3","path":"rooms/rmUiDemo/rmUiDemo.yy",},
    {"name":"inst_7A529505","path":"rooms/rmUiDemo/rmUiDemo.yy",},
    {"name":"inst_42B159E","path":"rooms/rmUiDemo/rmUiDemo.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Controllers","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"uiDemoRoomController","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"UiDemoRoomController","path":"objects/UiDemoRoomController/UiDemoRoomController.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":-32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"uiDemoMouseCursor","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"MouseCursor","path":"objects/MouseCursor/MouseCursor.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":32.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"MessageBox","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"popups","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"popup_instances","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
        {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"popup_effects","depth":400,"effectEnabled":true,"effectType":"_filter_vignette","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
            {"name":"g_VignetteEdges","type":0,"value":"0.2",},
            {"name":"g_VignetteEdges","type":0,"value":"1.2",},
            {"name":"g_VignetteSharpness","type":0,"value":"1",},
            {"name":"g_VignetteTexture","type":2,"value":"_filter_vignette_texture",},
          ],"userdefinedDepth":false,"visible":false,},
        {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"popup_greyscale","depth":500,"effectEnabled":true,"effectType":"_filter_colourise","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
            {"name":"g_Intensity","type":0,"value":"1",},
            {"name":"g_TintCol","type":1,"value":"#FFFFFFFF",},
          ],"userdefinedDepth":false,"visible":false,},
      ],"properties":[],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"ui","depth":600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"ui_instances","depth":700,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6780F786","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"TextButton","path":"objects/TextButton/TextButton.yy",},"properties":[
                {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"LGTextObject","path":"objects/LGTextObject/LGTextObject.yy",},"propertyId":{"name":"text","path":"objects/LGTextObject/LGTextObject.yy",},"value":"=main_menu/show_message",},
                {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"_baseClickableControl","path":"objects/_baseClickableControl/_baseClickableControl.yy",},"propertyId":{"name":"on_left_click","path":"objects/_baseClickableControl/_baseClickableControl.yy",},"value":"messageboxButton_click",},
              ],"rotation":0.0,"scaleX":10.0,"scaleY":2.0,"x":256.0,"y":912.0,},
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_41F202B3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"TextButton","path":"objects/TextButton/TextButton.yy",},"properties":[
                {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"LGTextObject","path":"objects/LGTextObject/LGTextObject.yy",},"propertyId":{"name":"text","path":"objects/LGTextObject/LGTextObject.yy",},"value":"=play/ui/race_exit_button",},
                {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"_baseClickableControl","path":"objects/_baseClickableControl/_baseClickableControl.yy",},"propertyId":{"name":"on_left_click","path":"objects/_baseClickableControl/_baseClickableControl.yy",},"value":"ui_demo_exit_click",},
                {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"_baseControl","path":"objects/_baseControl/_baseControl.yy",},"propertyId":{"name":"draw_on_gui","path":"objects/_baseControl/_baseControl.yy",},"value":"False",},
              ],"rotation":0.0,"scaleX":10.0,"scaleY":2.0,"x":1520.0,"y":912.0,},
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7A529505","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"TextButton","path":"objects/TextButton/TextButton.yy",},"properties":[
                {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"LGTextObject","path":"objects/LGTextObject/LGTextObject.yy",},"propertyId":{"name":"text","path":"objects/LGTextObject/LGTextObject.yy",},"value":"=ui_demo/show_sizeable",},
                {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"_baseClickableControl","path":"objects/_baseClickableControl/_baseClickableControl.yy",},"propertyId":{"name":"on_left_click","path":"objects/_baseClickableControl/_baseClickableControl.yy",},"value":"ui_demo_sizable_window_click",},
              ],"rotation":0.0,"scaleX":10.0,"scaleY":2.0,"x":608.0,"y":912.0,},
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_42B159E","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"TextButton","path":"objects/TextButton/TextButton.yy",},"properties":[
                {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"LGTextObject","path":"objects/LGTextObject/LGTextObject.yy",},"propertyId":{"name":"text","path":"objects/LGTextObject/LGTextObject.yy",},"value":"=ui_demo/control_tree",},
                {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"_baseClickableControl","path":"objects/_baseClickableControl/_baseClickableControl.yy",},"propertyId":{"name":"on_left_click","path":"objects/_baseClickableControl/_baseClickableControl.yy",},"value":"ui_demo_control_tree_click",},
              ],"rotation":0.0,"scaleX":10.0,"scaleY":2.0,"x":960.0,"y":912.0,},
          ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
        {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"ui_sprites","assets":[],"depth":800,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
      ],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"Effect_Snowfall","depth":900,"effectEnabled":true,"effectType":"_effect_windblown_particles","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"param_sprite","type":2,"value":"sprSnowflake",},
        {"name":"param_num_particles","type":0,"value":"60",},
        {"name":"param_particle_spawn_time","type":0,"value":"100",},
        {"name":"param_particle_spawn_all_at_start","type":0,"value":"1",},
        {"name":"param_warmup_frames","type":0,"value":"20",},
        {"name":"param_particle_mass_min","type":0,"value":"0.005",},
        {"name":"param_particle_mass_max","type":0,"value":"0.01",},
        {"name":"param_particle_start_sprite_scale","type":0,"value":"0.2",},
        {"name":"param_particle_end_sprite_scale","type":0,"value":"0.2",},
        {"name":"param_particle_col_1","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_alt_1","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_2","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_alt_2","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_2_pos","type":0,"value":"0.33",},
        {"name":"param_particle_col_enabled_2","type":0,"value":"0",},
        {"name":"param_particle_col_3","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_alt_3","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_3_pos","type":0,"value":"0.66",},
        {"name":"param_particle_col_enabled_3","type":0,"value":"0",},
        {"name":"param_particle_col_4","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_alt_4","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_initial_velocity_range_x_min","type":0,"value":"-100",},
        {"name":"param_particle_initial_velocity_range_x_max","type":0,"value":"100",},
        {"name":"param_particle_initial_velocity_range_y_min","type":0,"value":"-100",},
        {"name":"param_particle_initial_velocity_range_y_max","type":0,"value":"100",},
        {"name":"param_particle_initial_rotation_min","type":0,"value":"0",},
        {"name":"param_particle_initial_rotation_max","type":0,"value":"360",},
        {"name":"param_particle_rot_speed_min","type":0,"value":"-360",},
        {"name":"param_particle_rot_speed_max","type":0,"value":"360",},
        {"name":"param_particle_align_vel","type":0,"value":"1",},
        {"name":"param_particle_lifetime_min","type":0,"value":"100",},
        {"name":"param_particle_lifetime_max","type":0,"value":"100",},
        {"name":"param_particle_update_skip","type":0,"value":"1",},
        {"name":"param_particle_spawn_border_prop","type":0,"value":"0.25",},
        {"name":"param_particle_src_blend","type":0,"value":"5",},
        {"name":"param_particle_dest_blend","type":0,"value":"6",},
        {"name":"param_trails_only","type":0,"value":"0",},
        {"name":"param_trail_chance","type":0,"value":"40",},
        {"name":"param_trail_lifetime_min","type":0,"value":"0.5",},
        {"name":"param_trail_lifetime_max","type":0,"value":"1",},
        {"name":"param_trail_thickness_min","type":0,"value":"0.15",},
        {"name":"param_trail_thickness_max","type":0,"value":"0.15",},
        {"name":"param_trail_col_1","type":1,"value":"#19FFFFFF",},
        {"name":"param_trail_col_alt_1","type":1,"value":"#3FFFFFFF",},
        {"name":"param_trail_col_2","type":1,"value":"#19FFFFFF",},
        {"name":"param_trail_col_alt_2","type":1,"value":"#3FFFFFFF",},
        {"name":"param_trail_col_2_pos","type":0,"value":"0.5",},
        {"name":"param_trail_col_enabled_2","type":0,"value":"1",},
        {"name":"param_trail_col_3","type":1,"value":"#19FFFFFF",},
        {"name":"param_trail_col_alt_3","type":1,"value":"#3FFFFFFF",},
        {"name":"param_trail_col_3_pos","type":0,"value":"0.66",},
        {"name":"param_trail_col_enabled_3","type":0,"value":"0",},
        {"name":"param_trail_col_4","type":1,"value":"#00FFFFFF",},
        {"name":"param_trail_col_alt_4","type":1,"value":"#00FFFFFF",},
        {"name":"param_trail_min_segment_length","type":0,"value":"20",},
        {"name":"param_trail_src_blend","type":0,"value":"5",},
        {"name":"param_trail_dest_blend","type":0,"value":"6",},
        {"name":"param_num_blowers","type":0,"value":"3",},
        {"name":"param_blower_size_min","type":0,"value":"0.2",},
        {"name":"param_blower_size_max","type":0,"value":"0.6",},
        {"name":"param_blower_speed_min","type":0,"value":"0.2",},
        {"name":"param_blower_speed_max","type":0,"value":"0.5",},
        {"name":"param_blower_rot_speed_min","type":0,"value":"-180",},
        {"name":"param_blower_rot_speed_max","type":0,"value":"180",},
        {"name":"param_blower_force_min","type":0,"value":"5",},
        {"name":"param_blower_force_max","type":0,"value":"15",},
        {"name":"param_blower_camvec_scale","type":0,"value":"-1",},
        {"name":"param_force_grid_sizex","type":0,"value":"8",},
        {"name":"param_force_grid_sizey","type":0,"value":"8",},
        {"name":"param_wind_vector_x","type":0,"value":"-4",},
        {"name":"param_wind_vector_y","type":0,"value":"-1",},
        {"name":"param_dragcoeff","type":0,"value":"1",},
        {"name":"param_grav_accel","type":0,"value":"300",},
        {"name":"param_debug_grid","type":0,"value":"0",},
      ],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":0.0,"animationSpeedType":0,"colour":4294967295,"depth":1000,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"sprUiDemoBackground","path":"sprites/sprUiDemoBackground/sprUiDemoBackground.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "ui-demo",
    "path": "folders/Rooms/ui-demo.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 1080,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1920,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":940,"hspeed":-1,"hview":940,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":940,"hspeed":-1,"hview":940,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":940,"hspeed":-1,"hview":940,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":940,"hspeed":-1,"hview":940,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":940,"hspeed":-1,"hview":940,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":940,"hspeed":-1,"hview":940,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":940,"hspeed":-1,"hview":940,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": true,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}