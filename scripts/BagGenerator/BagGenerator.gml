// BagGenerator

// Generate two 7-Bags if empty list, or add on one if running out
var ind, repeats;
if ds_list_size(global.bag) == 0 { ind = 0; repeats = 2};
else { ind = 7; repeats = 1; }

repeat repeats {
    var unique;
    for (var i = 0; i < 7; i++) unique[i] = false;
    var left = 7;
    while left != 0 {
        randomize();
        while true {
            var rannum = irandom(6);
            if unique[rannum] == false {
                unique[rannum] = true;
                ds_list_insert(global.bag, ind, rannum);
                left--;
                break;
            }
        }            
    } 
}
