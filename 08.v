import os
import math

fn is_tree_visible(row int, column int, trees []string) bool{
    // edge tree
    if row == 0 || row == trees.len - 1 || column == 0 || column == trees[row].len - 1{
        return true
	}
    height := trees[row][column]
	mut bol := true
    // looking up
    for i in 0 .. row{
        if trees[i][column] >= height{
			bol = false
            break
		}
	}
    if bol{
        return true
	}
	bol = true
    // looking down
    for i in row + 1 .. trees.len{
        if trees[i][column] >= height{
            bol = false
			break
		}
	}
    if bol{
        return true
	}
	bol = true
    // looking left
    for i in 0 .. column{
        if trees[row][i] >= height{
            bol = false
			break
		}
	}
    if bol{
        return true
	}
	bol = true
    // looking right
    for i in column + 1 .. trees[row].len{
        if trees[row][i] >= height{
            bol  = false
			break
		}
	}
	if bol{
        return true
    }
	return false
}
fn calculate_scenic_score(row int, column int, trees []string) int{
	 // edge tree
    if row == 0 || row == trees.len - 1 || column == 0 || column == trees[row].len - 1{
        return 0
	}
    height := trees[row][column]
	mut up_count := 0
    // looking up
    for i := row-1; i > -1; i--{
		up_count++
        if trees[i][column] >= height{
            break
		}
	}
    mut down_count := 0
    // looking down
    for i in row + 1 .. trees.len{
		down_count++
        if trees[i][column] >= height{
			break
		}
	}

	mut left_count := 0
    // looking left
    for i := column-1; i > -1; i--{
		left_count++
        if trees[row][i] >= height{
			break
		}
	}
	mut right_count := 0
    // looking right
    for i in column + 1 .. trees[row].len{
		right_count++
        if trees[row][i] >= height{
			break
		}
	}
	return up_count * down_count * left_count * right_count
}
path := '08input.txt'
mut trees := []string{}
// check if file exists
if os.is_file(path) == true {
	trees << os.read_lines(path) or { panic('not read: ${path}') }
}

mut visible_tree_count := 0
for row_ in 0..trees.len{
    for column_ in 0 .. trees[row_].len{
        if is_tree_visible(row_, column_, trees){
            visible_tree_count++
		}
	}
}
println(visible_tree_count)

mut highest_scenic_score := 0
for row_ in 1 .. trees.len - 1{
    for column_ in 1 .. trees[row_].len - 1{
        score := calculate_scenic_score(row_, column_, trees)
        highest_scenic_score = math.max(score, highest_scenic_score)
	}
}
println(highest_scenic_score)
