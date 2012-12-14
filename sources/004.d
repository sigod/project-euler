module pu_004;

import std.conv : to;
import std.stdio;

void main(string[] args) {
	stdout.write(getPalindrom());
}

int getPalindrom() {
	int max = 0;

	for (int a = 100; a < 1000; ++a) {
		for (int b = a; b < 1000; ++b) {
			int value = a * b;

			if (isPalindromic(value) && max < value)
				max = value;
		}
	}

	return max;
}

private bool isPalindromic(int number) {
	string str = to!string(number);

	if (str.length % 2 != 0) return false;

	for (int i = 0; i < str.length / 2; ++i) {
		if (str[i] != str[str.length - i - 1]) return false;
	}

	return true;
}
unittest {
	static assert(isPalindromic(9009));
	static assert(isPalindromic(580085));
}