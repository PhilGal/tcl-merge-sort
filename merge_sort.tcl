proc merge_sort { lst } {
	
	set length [llength $lst]

	if { $length <= 1 } {
		return $lst
	} else {

		set middle [expr {$length / 2}]

		set left [lrange $lst 0 [expr {$middle - 1}]]
		set right [lrange $lst $middle $length]

		set left [merge_sort $left]
		set right [merge_sort $right]

		return [merge $left $right]

	}
}

proc merge {left right} {

	set result ""

	while { [llength $left] > 0 || [llength $right] > 0 } {
		if { [llength $left] > 0 && [llength $right] > 0 } {
			if { [lindex $left 0] <= [lindex $right 0] } {
				lappend result [lindex $left 0]
				set left [lrange $left 1 end]
			} else {
				lappend result [lindex $right 0]
				set right [lrange $right 1 end]
			}
		} elseif { [llength $left] > 0 } {
			lappend result [lindex $left 0]
			set left [lrange $left 1 end]
		} elseif { [llength $right] > 0 } {
			lappend result [lindex $right 0]
			set right [lrange $right 1 end]
		}		
	}

	return $result
}

#generate a list with n random integers from 0 to 9

set n 100

set lst ""

for {set i 0} {$i < $n} {incr i} {
	lappend lst [expr {int(rand()*10)}]
}

puts "\nList: $lst\n"
set sorted_list [merge_sort $lst]
puts "Sorted list: $sorted_list\n"
