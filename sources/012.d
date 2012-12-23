module pu_012;

import std.math : sqrt;
import std.stdio;

void main(string[] args) {
	foreach (i; 2 .. ulong.max) {
		if (findDividersCount(i) > 500) {
			stdout.write(i);
			break;
		}
	}
}

pure size_t findDividersCount(ulong number) {
	if (number == 0) return 0;
	else if (number == 1) return 1;

	size_t count = 2;

	foreach (i; 2 .. cast(ulong) sqrt(cast(float) number)) {
		if (number % i == 0) count += 2;
	}

	return count;
}