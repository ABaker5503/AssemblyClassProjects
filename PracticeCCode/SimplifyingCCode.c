#include <stdio.h>

int main()
{
	int a, b, c;
	a=10;
	b=40;
	c=0;

	topofloop1:
	if (a<0) goto endofloop1;
		if (a<=7) goto endif1;			//if (a>7)
			b++;
			b++;
			b++;
			b++;
		endif1:
		if (a!=5) goto endcase1;		//switch(a)
			b--;
			b--;
			goto endofswitch;
		endcase1:
		if (a!=3) goto endcase2;
			b--;
			b--;
			b--;
			b--;
			b--;
			b--;
			goto endofswitch;
		endcase2:
		b++;
		endofswitch:
		a--;
		a--;
		goto topofloop1;
	endofloop1:

	topofloop2:
	if (c>=25) goto endofloop2;
		if (c<11) goto endofif1;
			if (c>19) goto endofif2;
				b--;
			endofif2:
		endofif1:
		a++;
		a++;
		a++;
	c++;
	goto topofloop2;
	endofloop2:

	printf("a=%d b=%d c=%d\n", a, b, c);
}















