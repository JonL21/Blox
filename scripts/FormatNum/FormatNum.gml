/// @func FormatNum(number)
/// @desc Adds commas while formatting a number to string
/// @arg {Integer} number the number to format

var str = string_digits(argument0);
for (var i = string_length(str) - 2; i > 1; i -= 3) {
	str = string_insert(",", str, i);	
}
return str;