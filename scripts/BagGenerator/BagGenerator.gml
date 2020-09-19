/// @func BagGenerator()
/// @desc Generate two 7-Bags if empty list, or add one 7-bag if running out
function BagGenerator() {
	var pos; // What position in list to add blocks
	var numbags; // How many 7-bags to add
	if ds_list_size(bag) == 0 { pos = 0; numbags = 2};
	else { pos = 7; numbags = 1; }

	repeat numbags {
	    var unique = ds_list_create();
	    var left = 7;
		unique[| blox.I] = false;
		unique[| blox.J] = false;
		unique[| blox.O] = false;
		unique[| blox.S] = false;
		unique[| blox.Z] = false;
		unique[| blox.L] = false;
		unique[| blox.T] = false;
	    while left != 0 {
	        while true {
	            var rannum = choose(blox.I, blox.J, blox.O, blox.S, blox.Z, blox.L, blox.T);
	            if unique[| rannum] == false {
	                unique[| rannum] = true;
	                ds_list_insert(bag, pos, rannum);
	                left--;
	                break;
	            }
	        }            
	    }
		ds_list_destroy(unique);
	}
}
