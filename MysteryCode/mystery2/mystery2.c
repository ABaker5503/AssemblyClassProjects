#include <stdio.h>
#include <string.h>

int check(char stuff[])
{
	int a, b, flag;

	b=strlen(stuff)-1;
	a=0;
	flag=1;

	while (a<b)
	{
		if (stuff[a] != stuff[b])
			flag=0;
		a++;
		b--;
	}

	return flag;
}

int main()
{
	char nope[]="Nope";
	char yep[]="Yep";
	char stuff[]="racecar";

	if (check(stuff)==0)
		printf("%s\n", nope);
	else
		printf("%s\n", yep);
	return 0;
}