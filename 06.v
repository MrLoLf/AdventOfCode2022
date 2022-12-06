import os

// checks if four runes (characters) are not the same and return the position
fn first(input []string) int {
	for str in input {
		for i in 3 .. str.len {
			before := str[i - 1]
			before1 := str[i - 2]
			before2 := str[i - 3]
			if str[i] != before && str[i] != before1 && str[i] != before2 && before != before1
				&& before != before2 && before1 != before2 {
				// I have to add 1 becuase we are counting an array from 0 and not from 1
				return i + 1
			}
		}
	}

	// when nothing is found
	return 0
}

fn second(input []string) int {
	for str in input {
		// array to save all strings in
		mut arr := []string{}
		for i := 0; i < str.len; i++ {
			mut bol := false

			// return i when I have found a list that only contains single line characters
			if arr.len == 14 {
				return i
			}
			for j in arr {
				// resetting everything so that it starts on the next letter and clearing the array
				if j == str[i].ascii_str() {
					bol = true
					i -= arr.len
					arr.clear()
					break
				}
			}

			// appen the string to the array
			if !bol {
				arr << str[i].ascii_str()
			}
		}
	}

	// when nothing is found
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
