import os

fn split_arr(to_split string) ([]string, []string) {
	len_half := to_split.len / 2
	mut first := []string{len: len_half}
	mut second := []string{len: len_half}
	for i in 0 .. len_half {
		first[i] = to_split[i].ascii_str()
	}
	for i in len_half .. to_split.len {
		second[i - len_half] = to_split[i].ascii_str()
	}
	return first, second
}

fn first(content []string) int {
	numbers := {
		'a': 1
		'b': 2
		'c': 3
		'd': 4
		'e': 5
		'f': 6
		'g': 7
		'h': 8
		'i': 9
		'j': 10
		'k': 11
		'l': 12
		'm': 13
		'n': 14
		'o': 15
		'p': 16
		'q': 17
		'r': 18
		's': 19
		't': 20
		'u': 21
		'v': 22
		'w': 23
		'x': 24
		'y': 25
		'z': 26
		'A': 27
		'B': 28
		'C': 29
		'D': 30
		'E': 31
		'F': 32
		'G': 33
		'H': 34
		'I': 35
		'J': 36
		'K': 37
		'L': 38
		'M': 39
		'N': 40
		'O': 41
		'P': 42
		'Q': 43
		'R': 44
		'S': 45
		'T': 46
		'U': 47
		'V': 48
		'W': 49
		'X': 50
		'Y': 51
		'Z': 52
	}
	mut found := false
	mut sum := 0
	for i in 0 .. content.len {
		mut first, second := split_arr(content[i])
		for j in 0 .. first.len {
			for k in 0 .. second.len {
				if first[j] == second[k] {
					found = true
					break
				}
			}
			if found {
				found = false
				sum += numbers[first[j]]
				break
			}
		}
	}
	return sum
}

fn second(content []string) int {
	numbers := {
		'a': 1
		'b': 2
		'c': 3
		'd': 4
		'e': 5
		'f': 6
		'g': 7
		'h': 8
		'i': 9
		'j': 10
		'k': 11
		'l': 12
		'm': 13
		'n': 14
		'o': 15
		'p': 16
		'q': 17
		'r': 18
		's': 19
		't': 20
		'u': 21
		'v': 22
		'w': 23
		'x': 24
		'y': 25
		'z': 26
		'A': 27
		'B': 28
		'C': 29
		'D': 30
		'E': 31
		'F': 32
		'G': 33
		'H': 34
		'I': 35
		'J': 36
		'K': 37
		'L': 38
		'M': 39
		'N': 40
		'O': 41
		'P': 42
		'Q': 43
		'R': 44
		'S': 45
		'T': 46
		'U': 47
		'V': 48
		'W': 49
		'X': 50
		'Y': 51
		'Z': 52
	}
	mut found := false
	mut sum := 0
	for k := 0; k < content.len; k += 3 {
		for i in 0 .. content[k].len {
			for j in 0 .. content[k + 1].len {
				for l in 0 .. content[k + 2].len {
					if content[k][i].ascii_str() == content[k + 1][j].ascii_str()
						&& content[k + 1][j].ascii_str() == content[k + 2][l].ascii_str() {
						found = true
						break
					}
				}
				if found {
					break
				}
			}
			if found {
				found = false
				sum += numbers[content[k][i].ascii_str()]
				break
			}
		}
	}
	return sum
}

fn main() {
	mut content := []string{}
	path := '03input.txt'

	// check if file exists
	if os.is_file(path) == true {
		content << os.read_lines(path) or { panic('not read: ${path}') }
	}
	println(first(content))
	println(second(content))
}
