module pu_007;

import std.conv : to;
import std.stdio;

void main(string[] args) {
	if (args.length > 1) {
		size_t n = to!size_t(args[1]);

		stdout.write(getNthPrimeNumber(n));
	} else {
		stdout.write(getNthPrimeNumber(10001));
	}
}

long getNthPrimeNumber(size_t n) {
	if (n == 1) return 2;

	ulong[] primes = [2];

	for (ulong number = 3; number < ulong.max; number += 2) {
		bool isPrime = true;

		foreach (prime; primes) {
			if (number % prime == 0) {
				isPrime = false;
				break;
			}
		}

		if (isPrime) {
			primes ~= number;

			if (primes.length >= n) {
				return primes[n - 1];
			}
		}
	}

	assert(false, "Prime number too big.");
}


unittest {
	static assert(getNthPrimeNumber(1) == 2);
	static assert(getNthPrimeNumber(6) == 13);
}