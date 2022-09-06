#macro OUTLINE_SHADER_VERSION	"1.4"
#macro OUTLINE_SHADER_NAME		"outline-shader-drawer "
#macro OUTLINE_SHADER_COPYRIGHT	"(c)2022* indievidualgames, @Grisgram (github)"

var cpyrght = (current_year == 2022) ?
	string_replace(OUTLINE_SHADER_COPYRIGHT, "*", "") :
	string_replace(OUTLINE_SHADER_COPYRIGHT, "*", "-" + string(current_year));
show_debug_message(OUTLINE_SHADER_NAME + OUTLINE_SHADER_VERSION + " loaded. " + cpyrght);