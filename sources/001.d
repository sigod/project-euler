module pu_001;

import std.stdio;
import std.conv : to;

enum ulong n_1000 = getSum(1000);

void main(string[] args) {
	if (args.length > 1) {
		ulong n = to!ulong(args[1]);

		stdout.write(getSum(n));
	} else {
		stdout.write(n_1000);
	}
}

ulong getSum(ulong n) {
	ulong sum = 0, 
		i = 0,
		i3 = 0,
		i5 = 0;

	// this work faster than (i % 3 == 0 || i % 5 == 0)
	while (i < n) {
		if (i3 == 3 || i5 == 5) {
			sum += i;

			if (i3 == 3) i3 = 0;
			if (i5 == 5) i5 = 0;
		}

		++i;
		++i3;
		++i5;
	}

	return sum;
}
unittest {
	static assert(getSum(3) == 0);
	static assert(getSum(4) == 3);
	static assert(getSum(6) == 8);
	static assert(getSum(10) == 23);
}