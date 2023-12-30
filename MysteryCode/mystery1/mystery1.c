#include <stdio.h>

int myFunc(int a, int b)
{
	int x;

	if (a<10)
		x=a+b;
	else
		x=a-b;
	return x;
}

int main()
{
	printf("%d\n", myFunc(25, 31));

	return 0;
}