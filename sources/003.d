module pu_003;

import std.conv : to;
import std.stdio;
import std.math : abs;

enum ulong problemAnswer = getMaxPrimeFactor(600_851_475_143);

void main(string[] args) {
	if (args.length > 1) {
		ulong number = to!ulong(args[1]);

		stdout.write(getMaxPrimeFactor(number));
	} else {
		stdout.write(problemAnswer);
	}
}

ulong getMaxPrimeFactor(ulong number) {
	if (number % 2 == 0) return 2;

	ulong max = 0;

	while (number > 1) {
		ulong divider = pollard_rho(number);

		if (max < divider) max = divider;

		number /= divider;
	}

	return max;
}
unittest {
	static assert(getMaxPrimeFactor(13195) == 29);
	static assert(getMaxPrimeFactor(600_851_475_143) == 6857);
}

ulong pollard_rho(ulong number){
	long p = 2,
		num2 = 2,
		num3 = 0;

	while (num3 < 2) {
		p = custom(p, number);
		num2 = custom(custom(num2, number), number);
		num3 = gcd(abs(num2 - p), number);
	}

	return num3;
}

private ulong custom(ulong p, ulong m) {
	assert(m != 0);

	return (p * p + 1) % m;
}

private ulong gcd(ulong x, ulong y) {
	if (x == 0) return y;
	if (y == 0) return x;

	return gcd(y, x % y);
}