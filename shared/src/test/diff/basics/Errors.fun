
let a = succ
/// a: int -> int

let b = a 1
/// b: int


// identifier not found

:e
println 1
println / c + 1
println / abc + 1
c + 1
abc + 1
1 + c
let d = c + 1
let d = 1 + abc + 1 + 1
d + 1
/// /!\ Type error: identifier not found: c
/// l.13: 	println / c + 1
///       	          ^
/// /!\ Type error: identifier not found: abc
/// l.14: 	println / abc + 1
///       	          ^^^
/// /!\ Type error: identifier not found: c
/// l.15: 	c + 1
///       	^
/// /!\ Type error: identifier not found: abc
/// l.16: 	abc + 1
///       	^^^
/// /!\ Type error: identifier not found: c
/// l.17: 	1 + c
///       	    ^
/// /!\ Type error: identifier not found: c
/// l.18: 	let d = c + 1
///       	        ^
/// /!\ Type error: identifier not found: abc
/// l.19: 	let d = 1 + abc + 1 + 1
///       	            ^^^
/// res: unit
/// res: unit
/// res: unit
/// res: int
/// res: int
/// res: int
/// d: int
/// d: int
/// res: int


// cannot constrain

:e
1 2 3
a b c
let oops = succ false
false + 1
1 + false
true + false
println / false + 1
/// /!\ Type error: cannot constrain int <: int -> 'a
/// l.56: 	1 2 3
///       	^^^
/// /!\ Type error: identifier not found: c
/// l.57: 	a b c
///       	    ^
/// /!\ Type error: cannot constrain int <: 'a -> 'b
/// l.57: 	a b c
///       	^^^^^
/// /!\ Type error: cannot constrain bool <: int
/// l.58: 	let oops = succ false
///       	           ^^^^^^^^^^
/// /!\ Type error: cannot constrain bool <: int
/// l.59: 	false + 1
///       	^^^^^^^
/// /!\ Type error: cannot constrain bool <: int
/// l.60: 	1 + false
///       	^^^^^^^^^
/// /!\ Type error: cannot constrain bool <: int
/// l.61: 	true + false
///       	^^^^^^
/// /!\ Type error: cannot constrain bool <: int
/// l.61: 	true + false
///       	^^^^^^^^^^^^
/// /!\ Type error: cannot constrain bool <: int
/// l.62: 	println / false + 1
///       	          ^^^^^^^
/// res: ⊥
/// res: ⊥
/// oops: int
/// res: int
/// res: int
/// res: int
/// res: unit

:e
succ succ
  1
(
  succ
) false
/// /!\ Type error: cannot constrain int -> int <: int
/// l.99: 	succ succ
///       	^^^^^^^^^
/// /!\ Type error: cannot constrain int <: int -> 'a
/// l.99: 	succ succ
///       	^^^^^^^^^
/// l.100: 	  1
///        	^^^
/// /!\ Type error: cannot constrain bool <: int
/// l.101: 	(
///        	^
/// l.102: 	  succ
///        	^^^^^^
/// l.103: 	) false
///        	^^^^^^^
/// res: ⊥
/// res: int

:e
println
  1
    2
println 1
  2
println
  1
  2
/// /!\ Type error: cannot constrain int <: int -> 'a
/// l.124: 	  1
///        	  ^
/// l.125: 	    2
///        	^^^^^
/// /!\ Type error: cannot constrain unit <: int -> 'a
/// l.126: 	println 1
///        	^^^^^^^^^
/// l.127: 	  2
///        	^^^
/// res: unit
/// res: ⊥
/// res: unit


// missing field, cannot constrain

:e
1.u
{}.u
{a: 1}.u
{a: 1}.a 1
1 + {a: true}.a
{a: true}.a + 1
succ {a: 1}
{a: 1} succ
/// /!\ Type error: cannot constrain int <: {u: 'a}
/// l.149: 	1.u
///        	 ^^
/// /!\ Type error: cannot constrain unit <: {u: 'a}
/// l.150: 	{}.u
///        	  ^^
/// /!\ Type error: missing field: u in {a: int}
/// l.151: 	{a: 1}.u
///        	      ^^
/// /!\ Type error: cannot constrain int <: int -> 'a
/// l.152: 	{a: 1}.a 1
///        	      ^^^^
/// /!\ Type error: cannot constrain bool <: int
/// l.153: 	1 + {a: true}.a
///        	^^^^^^^^^^^^^^^
/// /!\ Type error: cannot constrain bool <: int
/// l.154: 	{a: true}.a + 1
///        	         ^^^^
/// /!\ Type error: cannot constrain {a: int} <: int
/// l.155: 	succ {a: 1}
///        	^^^^^^^^^^^
/// /!\ Type error: cannot constrain {a: int} <: (int -> int) -> 'a
/// l.156: 	{a: 1} succ
///        	^^^^^^^^^^^
/// res: ⊥
/// res: ⊥
/// res: ⊥
/// res: ⊥
/// res: int
/// res: int
/// res: int
/// res: ⊥


// parse error

:pe
foo
ba)r
baz
/// /!\ Parse error: Expected end-of-input:2:3, found ")r\nbaz" at l.195:3: ba)r