
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
		dup r@ %
		if 
		else 
			r> r> 
			r> drop
			0 >r
			>r >r
		then
	loop
	drop
	r> 
	c_allot ;
	
( addr1, addr2 -- addr )
: strcat
	;