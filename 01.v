import os

mut content := []string{}
path := '01input.txt'

// check if file exists
if os.is_file(path) == true {
	content << os.read_lines(path) or { panic('not read: ${path}') }
}
mut sum := 0
mut highest_val := 0
for i in content {
	if i == '' {
		if highest_val < sum {
			highest_val = sum
		}
		sum = 0
		continue
	}
	sum += i.int()
}
println(highest_val)
