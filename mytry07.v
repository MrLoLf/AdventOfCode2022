import os


fn first(input []string) int{
	mut dirs := map[string]int{}
	mut contains := map[string][]string{}
	mut sum := 0
	mut arr := []string{}
	for i in 0 .. input.len{
		mut line := input[i].split(" ")
		if line[1] == "ls"{
			continue
		}
		if line[1] == "cd" && line[2] != ".."{
			dirs[arr.str()] = sum
			sum = 0
			if line[2] == ".."{
				arr.pop()
			}else{
				arr << line[2]
			}
			if line[2] !in dirs{
				dirs[arr.str()] = 0
			}
		}
		if line[0] != "dir"{
			sum += line[0].int()
		}else{
			arr << line[1]
			contains[arr.str()] << arr.str()
		}
	}
	dirs[arr.str()] = sum
	//println(dirs)
	for key, _ in dirs{
		if key in contains{
			for k in contains[key]{
				dirs[key] += dirs[k]
			}
		}
	}
	
	sum = 0
	for _, val in dirs{
		if val < 100000{
			sum += val
		}
	}
	println("\n\n${dirs}")
	//println(contains)
	return sum
}


fn main() {
	mut content := []string{}
	path := '07input.txt'

	// check if file exists
	if os.is_file(path) == true {
		content << os.read_lines(path) or { panic('not read: ${path}') }
	}
	println(first(content))
	// println(second(content))
}