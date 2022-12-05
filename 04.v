import os
// splits the string in half and returns both half's

fn split_str(to_split string) (string, string) {
	mut breaked := 0
	for i in 0 .. to_split.len {
		if to_split[i].ascii_str() == ',' {
			breaked = i
			break
		}
	}
	mut first := to_split[0..breaked]
	mut second := to_split[breaked + 1..to_split.len]
	return first, second
}

// get's the first and the second number of the string half
fn get_numbers(str string) (int, int) {
	mut breaked := 0
	for i in 0 .. str.len {
		if str[i].ascii_str() == '-' {
			breaked = i
			break
		}
	}
	mut first := str[0..breaked].int()
	mut second := str[breaked + 1..str.len].int()
	return first, second
}

fn first(input []string) int {
	mut pairs := 0
	for i in 0 .. input.len {
		mut first, second := split_str(input[i])
		mut first_num, second_num := get_numbers(first)
		mut third_num, fourth_num := get_numbers(second)
		// checks if one pair is fully in the other
		if first_num <= third_num && second_num >= fourth_num {
			pairs++
		} else if first_num >= third_num && second_num <= fourth_num {
			pairs++
		}
	}
	return pairs
}

fn second(input []string) int {
	mut pairs := 0
	for i in 0 .. input.len {
		mut first, second := split_str(input[i])
		mut first_num, second_num := get_numbers(first)
		mut third_num, fourth_num := get_numbers(second)
		// checks if one pair is part of the other pair
		if first_num >= third_num && fourth_num >= first_num {
			pairs++
		} else if third_num >= first_num && second_num >= third_num {
			pairs++
		} else if fourth_num >= first_num && fourth_num <= second_num {
			pairs++
		} else if second_num >= third_num && second_num <= fourth_num {
			pairs++
		}
	}
	return pairs
}

fn main() {
	mut content := []string{}
	path := '04input.txt'

	// check if file exists
	if os.is_file(path) == true {
		content << os.read_lines(path) or { panic('not read: ${path}') }
	}
	println(first(content))
	println(second(content))
}
