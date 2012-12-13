module pu_002;

import std.stdio;
import std.conv : to;

enum ulong n_4kk = process(4_000_000);

void main(string[] args) {
	if (args.length > 1) {
		ulong n = to!ulong(args[1]);

		stdout.write(process(n));
	} else {
		stdout.write(n_4kk);
	}
}

ulong process(ulong n) {
	ulong sum = 0,
		a = 1,
		b = 2,
		c;

	while (b <= n) {
		if (b % 2 == 0) sum += b;

		c = a + b;
		a = b;
		b = c;
	}

	return sum;
}
unittest {
	static assert(process(2) == 2);
	static assert(process(100) == 44);
	static assert(process(4_000_000) == 4613732);
}