import os

fn first(input []string)int{
	for str in input{
		for i in 3..str.len{
			before := str[i-1]
			before1 := str[i-2]
			before2 := str[i-3]
			if str[i]!= before && str[i] != before1 && str[i] != before2 && before != before1 && before != before2 && before1 != before2{
				return i+1
			}
		}
	}
	return 0
}

fn second(input []string)int{
	return 0
}


fn main() {
	mut content := []string{}
	path := '06input.txt'

	// check if file exists
	if os.is_file(path) == true {
		content << os.read_lines(path) or { panic('not read: ${path}') }
	}
	println(first(content))
	println(second(content))
}