/// @func BagGenerator()
/// @desc Generate two 7-Bags if empty list, or add one 7-bag if running out

var pos; // What position in list to add blocks
var numbags; // How many 7-bags to add
if ds_list_size(global.bag) == 0 { pos = 0; numbags = 2};
else { pos = 7; numbags = 1; }

repeat numbags {
    var unique = array_create(7, false);
    var left = 7;
    while left != 0 {
        randomize();
        while true {
            var rannum = choose(blox.I, blox.J, blox.O, blox.S, blox.Z, blox.L, blox.T);
            if unique[rannum] == false {
                unique[rannum] = true;
                ds_list_insert(global.bag, pos, rannum);
                left--;
                break;
            }
        }            
    } 
}