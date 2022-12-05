import os

mut content := []string{}
path := '01input.txt'

// check if file exists
if os.is_file(path) == true {
	content << os.read_lines(path) or { panic('not read: ${path}') }
}
mut sum := 0
mut highest_val := []int{len: 3, init: 0}
for i in content {
	// true when we have a new line so I need to add the sum to my highest val
	if i == '' {
		// setting the values correctly for the cases if one is higher than the other
		if highest_val[2] < sum {
			highest_val = [highest_val[1], highest_val[2], sum]
		} else if highest_val[1] < sum {
			highest_val[0] = highest_val[1]
			highest_val[1] = sum
		} else if highest_val[0] < sum {
			highest_val[0] = sum
		}
		sum = 0
		continue
	}
	sum += i.int()
}
// prints the highest value and the highest value of all 3 added together
println(highest_val[2])
println(highest_val[0] + highest_val[1] + highest_val[2])
