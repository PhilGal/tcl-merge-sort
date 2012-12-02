proc pow {number power} {
	if {$power == 0} {
		return  1
	} elseif {$power == 1} {
		return $number
	} else {
		if {$power < 0} {
			return "Positive powers only, please"
		} else {
			set res [square $number]
			for {set i 2} {$i < $power} {incr i} {
				set res [expr {$res * $number}]
			} 
			return $res
		}
	}
}

proc square {number} {
	return [expr {$number * $number}]
}

puts "Enter a number: " 
gets stdin number

puts "\nEnter a power: " 
gets stdin power

puts "\nResult of $number raised to the $power power is [pow $number $power]"

proc push_button {} {
	set ::res "Result: [pow [.entNum get] [.entPow get]]"
}

label .labNum -text "Enter a number:"
entry .entNum

label .labPow -text "Enter a power:"
entry .entPow

label .labRes -text "Result: " -textvariable res

button .but -text "Get the powered number!" -command "push_button"

pack .labNum
pack .entNum
pack .labPow
pack .entPow
pack .labRes
pack .but