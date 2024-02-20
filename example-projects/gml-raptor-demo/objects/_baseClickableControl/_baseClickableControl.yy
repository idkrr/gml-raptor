{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "_baseClickableControl",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":11,"eventType":6,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":4,"eventType":6,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":5,"eventType":6,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":7,"eventType":6,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":8,"eventType":6,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":6,"eventType":6,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":9,"eventType":6,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":10,"eventType":6,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":1,"eventType":9,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"_baseControl","path":"objects/_baseControl/_baseControl.yy",},"propertyId":{"name":"text_color","path":"objects/_baseControl/_baseControl.yy",},"value":"APP_THEME_MAIN",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"_baseControl","path":"objects/_baseControl/_baseControl.yy",},"propertyId":{"name":"text_color_mouse_over","path":"objects/_baseControl/_baseControl.yy",},"value":"APP_THEME_ACCENT",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"_baseControl","path":"objects/_baseControl/_baseControl.yy",},"propertyId":{"name":"draw_color","path":"objects/_baseControl/_baseControl.yy",},"value":"APP_THEME_WHITE",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"_baseControl","path":"objects/_baseControl/_baseControl.yy",},"propertyId":{"name":"draw_color_mouse_over","path":"objects/_baseControl/_baseControl.yy",},"value":"APP_THEME_WHITE",},
  ],
  "parent": {
    "name": "UI",
    "path": "folders/_gml_raptor_/UI.yy",
  },
  "parentObjectId": {
    "name": "_baseControlWithTooltip",
    "path": "objects/_baseControlWithTooltip/_baseControlWithTooltip.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"on_left_click","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"undefined","varType":4,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"on_middle_click","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"undefined","varType":4,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"on_right_click","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"undefined","varType":4,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"on_double_click","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"undefined","varType":4,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"on_enter_sound","filters":[
        "GMSound",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"undefined","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"on_leave_sound","filters":[
        "GMSound",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"undefined","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"on_click_sound","filters":[
        "GMSound",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"undefined","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hotkey_left_click","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"","varType":2,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hotkey_right_click","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"","varType":2,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hotkey_middle_click","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"","varType":2,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hotkey_only_when_topmost","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"True","varType":3,},
  ],
  "solid": false,
  "spriteId": null,
  "spriteMaskId": null,
  "visible": true,
}