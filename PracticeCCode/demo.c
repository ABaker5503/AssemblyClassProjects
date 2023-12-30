int a, b;

a=1

toploop1:
if (a>10) goto endofloop1;
	b++;
	b++;
	a++;
	goto toploop1;
endofloop1:

if (b <= 100) goto endif1;
	if (b % 2 != 0) goto endif2;
	if (a!=1) goto endif3;
			// do something
			goto endofswitch;
		endif3:
		if (a!=2) goto endif4;
			// do something
			goto endofswitch;
		endif4:
			// do something
		endofswitch:
	endif2:
endif1:

toploop2:
if (b <= 0) goto endofloop2;
	// do something
	b--;
	b--;
	b--;
	goto toploop2;
endofloop2;