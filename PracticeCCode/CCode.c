#include <stdio.h>
int main() {
	int a = 10;
	int b = 40;
	int c;
	while (a >= 0) {
		if(a > 7) {
			b += 4;
		}
		switch(a) {
			case 5:
				b -= 2;
			break;
			case 3:
				b -= 6;
			break;
			default:
				b++;
			}
		a -= 2;
	}
	for (c=0; c<25; c++) {
		if(c >= 11 && c <= 19) {
			b--;
		}
		a += 3;
	}
	printf("a=%d b=%d c=%d\n", a, b, c);
}