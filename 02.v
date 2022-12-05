import os
// checks if the two inputed strings would tie

fn tie(char1 string, char2 string) bool {
	if char1 == 'A' && char2 == 'X' {
		return true
	} else if char1 == 'B' && char2 == 'Y' {
		return true
	} else if char1 == 'C' && char2 == 'Z' {
		return true
	}
	return false
}

// checks if one of the two strings has won
fn won(char1 string, char2 string) bool {
	if char1 == 'A' && char2 == 'Y' {
		return true
	} else if char1 == 'B' && char2 == 'Z' {
		return true
	} else if char1 == 'C' && char2 == 'X' {
		return true
	}
	return false
}

fn first(content []string) int {
	mut sum := 0
	for i, _ in content {
		// sum the inputs up according to the input
		// With content[i] I get a string, on which I can do another entry[]. This returns a u8.int, so I have to cast it to an ascii_str, to compare it.
		if tie(content[i][0].ascii_str(), content[i][2].ascii_str()) {
			if content[i][2].ascii_str() == 'Y' {
				sum += 2
			} else if content[i][2].ascii_str() == 'X' {
				sum += 1
			} else if content[i][2].ascii_str() == 'Z' {
				sum += 3
			}
			sum += 3
		} else if won(content[i][0].ascii_str(), content[i][2].ascii_str()) {
			if content[i][2].ascii_str() == 'Y' {
				sum += 2
			} else if content[i][2].ascii_str() == 'X' {
				sum += 1
			} else if content[i][2].ascii_str() == 'Z' {
				sum += 3
			}
			sum += 6
		} else {
			if content[i][2].ascii_str() == 'Y' {
				sum += 2
			} else if content[i][2].ascii_str() == 'X' {
				sum += 1
			} else if content[i][2].ascii_str() == 'Z' {
				sum += 3
			}
		}
	}
	return sum
}

fn second(content []string) int {
	mut sum := 0
	for i, _ in content {
		if content[i][2].ascii_str() == 'Z' {
			if content[i][0].ascii_str() == 'A' {
				sum += 2
			} else if content[i][0].ascii_str() == 'B' {
				sum += 3
			} else if content[i][0].ascii_str() == 'C' {
				sum += 1
			}
			sum += 6
		} else if content[i][2].ascii_str() == 'Y' {
			if content[i][0].ascii_str() == 'A' {
				sum += 1
			} else if content[i][0].ascii_str() == 'B' {
				sum += 2
			} else if content[i][0].ascii_str() == 'C' {
				sum += 3
			}
			sum += 3
		} else if content[i][2].ascii_str() == 'X' {
			if content[i][0].ascii_str() == 'A' {
				sum += 3
			} else if content[i][0].ascii_str() == 'B' {
				sum += 1
			} else if content[i][0].ascii_str() == 'C' {
				sum += 2
			}
		}
	}
	return sum
}

fn main() {
	mut content := []string{}
	path := '02input.txt'

	// check if file exists
	if os.is_file(path) == true {
		content << os.read_lines(path) or { panic('not read: ${path}') }
	}
	println(first(content))
	println(second(content))
}
