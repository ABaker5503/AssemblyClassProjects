#include <stdio.h>
#include <unistd.h>

static char *int2binstr(int i, int size) {

	static char s[33] = {0};
	int p = 32;

	while (i > 0) {
		s[--p] = (i % 2) + '0';
		i = i / 2;
	}

	while (p > (32 - size)) {
		s[--p] = '0';
	}

	return (s + p);

}

int main() {

	int a;

	for (a=0; ; a=(a+1)%256) {

		printf("dec( %4hhd ) = hex( %02hhx ) = bin( %8s )\n", a, a, int2binstr(a, 8));
		usleep(100000);

	}

}