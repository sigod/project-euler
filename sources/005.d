module pu_005;

import std.stdio;

void main(string[] args) {

}

ulong getEvenlyDivisibleNumber(ulong to) {
	ulong[] primes = getPrimes(to);

	foreach (ulong divider in 2..to + 1) {

	}
}

ulong[] getPrimes(ulong up_to) {
	if (up_to < 2) return [];

	ulong[] primes = [2];

	foreach (ulong number in 3..up_to + 1) {
		bool divide = false;

		foreach (ulong prime in primes) {
			if (number % prime != 0) {
				divide = true;
				break;
			}
		}

		if (!divide) {
			primes ~= number;
		}
	}

	return primes;
}
unittest {
	assert(getPrimes(1).length == 0);
	assert(getPrimes(2).length == 1);
	assert(getPrimes(5).length == 3);
	assert(getPrimes(20).length == 8);
}