#include <asmio.h>

int main()
{
	register int a;

	a=read_int();
/*
	if (a==13)
	{
		print_int(37);
		print_nl();
	}
	else if (a==100)
	{
		print_int(200);
		print_nl();
	}
	else
	{
		print_int(-1);
		print_nl();
	}
*/

	switch(a)
	{
		case 13:
			print_int(37);
			print_nl();
			break;
		case 100:
			print_int(200);
			print_nl();
			break;
		default:
			print_int(-1);
			print_nl();
	}

	return 0;
}