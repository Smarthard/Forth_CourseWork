
( value -- value {0, 1} )	
: is_even 
	2 % not ;	
	
( value -- addr )
: c_allot
	cell% allot dup rot swap ! ;
	
( value -- addr )
: is_prime
	dup 
	1 >r 
	2
	do
		dup 4 <
		if 
			r> r@ >r
			drop
		else
			dup r@ %
			if 
			else 
				r> r> 
				r> drop
				0 >r
				>r >r
			then
		then
	loop
	drop
	r> 
	c_allot ;

: inc
	1 + ;
	
: dec
	1 - ;
	
( buf, addr -- buf )
: strmv
	dup count 
	>r dec r>
	inc 0
	do 
		inc
		>r dup r@
		c@ swap r> r@ rot + swap >r c! r>
	loop
	heap-free ;
	
( addr1, addr2 -- addr )
: strcat
	swap dup count
	>r
	swap dup count 
	r@ + inc
	heap-alloc
	rot strmv
	dup r> + rot
	strmv
	drop ;
	
( value -- value )
: radical
	dup 1 swap
	2
	do
		r@ is_prime @
		if
			over		
			r@ %
			dup
			not
			if
				drop 
				r@
				*
			else
				drop
			then			
		then
	loop
	swap drop ;