import os

// returns an array containing the inputed piles and and int wehere the new line was found and the move begins
fn get_piles(input []string) ([][]string, int) {
	mut piles := [][]string{len: 9, init: []string{}}
	mut breaked := 0
	for i in 0 .. input.len {
		// when \n is found the move statements are comming next and the i can break out because if have found all piles
		if input[i] == '' {
			for j in 0 .. piles.len {
				piles[j] = piles[j].reverse()
			}
			breaked = i
			break
		}
		mut a := 0
		for k := 1; k < input[i].len; k += 4 {
			mut inp := input[i][k].ascii_str()
			if inp != ' ' && inp != '1' && inp != '2' && inp != '3' && inp != '4' && inp != '5'
				&& inp != '6' && inp != '7' && inp != '8' && inp != '9' {
				piles[a] << inp
			}
			a++
		}
	}
	return piles, breaked
}

fn first(input []string) string {
	mut piles, breaked := get_piles(input)
	for i in breaked + 1 .. input.len {
		mut amount := input[i][5..7].int()

		mut from := []string{}
		if amount > 9 {
			from = piles[input[i][13..15].int() - 1]
		} else {
			from = piles[input[i][12..14].int() - 1]
		}
		mut to := piles[input[i][input[i].len - 1].ascii_str().int() - 1]
		for _ in 0 .. amount {
			if from.len >= 1 {
				to << from.pop()
			}
		}
		if amount > 9 {
			piles[input[i][13..15].int() - 1].clear()
			piles[input[i][13..15].int() - 1].insert(0, from)
		} else {
			piles[input[i][12..14].int() - 1].clear()
			piles[input[i][12..14].int() - 1].insert(0, from)
		}
		piles[input[i][input[i].len - 1].ascii_str().int() - 1].clear()
		piles[input[i][input[i].len - 1].ascii_str().int() - 1].insert(0, to)
	}
	mut s := ''
	for i in piles {
		if i != [] {
			s += i.last()
		}
	}
	return s
}

fn second(input []string) string {
	mut piles, breaked := get_piles(input)
	for i in breaked + 1 .. input.len {
		mut amount := input[i][5..7].int()
		mut from := []string{}
		if amount > 9 {
			from = piles[input[i][13..15].int() - 1]
		} else {
			from = piles[input[i][12..14].int() - 1]
		}
		mut to := piles[input[i][input[i].len - 1].ascii_str().int() - 1]
		for j in from.len - amount .. from.len {
			if from.len >= 1 {
				to.insert(to.len, from[j])
			}
		}
		from.delete_many(from.len - amount, amount)
		if amount > 9 {
			piles[input[i][13..15].int() - 1].clear()
			piles[input[i][13..15].int() - 1].insert(0, from)
		} else {
			piles[input[i][12..14].int() - 1].clear()
			piles[input[i][12..14].int() - 1].insert(0, from)
		}
		piles[input[i][input[i].len - 1].ascii_str().int() - 1].clear()
		piles[input[i][input[i].len - 1].ascii_str().int() - 1].insert(0, to)
	}
	mut s := ''
	for i in piles {
		if i != [] {
			s += i.last()
		}
	}
	return s
}

fn main() {
	mut content := []string{}
	path := '05input.txt'

	// check if file exists
	if os.is_file(path) == true {
		content << os.read_lines(path) or { panic('not read: ${path}') }
	}
	println(first(content))
	println(second(content))
}
