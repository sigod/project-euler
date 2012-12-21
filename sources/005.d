module pu_005;

import std.conv : to;
import std.stdio;
import helpers.primenumbers : getPrimeNumbers;

enum ulong problemAnswer = getEvenlyDivisibleNumber(20);

void main(string[] args) {
	if (args.length > 1) {
		ulong to = to!ulong(args[1]);

		stdout.write(getEvenlyDivisibleNumber(to));
	} else {
		stdout.write(problemAnswer);
	}
}

ulong getEvenlyDivisibleNumber(ulong to) {
	ulong[] primes = getPrimeNumbers(to);

	ulong result = 1;

	foreach (ulong divider; 2..to + 1) {
		if (result % divider == 0) continue;

		foreach (ulong prime; primes) {
			auto tmp = result * prime;

			if (tmp % divider == 0) {
				result = tmp;
				break;
			}
		}
	}

	return result;
}

unittest {
	static assert(getEvenlyDivisibleNumber(1) == 1);
	static assert(getEvenlyDivisibleNumber(2) == 2);
	static assert(getEvenlyDivisibleNumber(3) == 6);
	static assert(getEvenlyDivisibleNumber(4) == 12);
	static assert(getEvenlyDivisibleNumber(5) == 60);
	static assert(getEvenlyDivisibleNumber(10) == 2520);
	static assert(getEvenlyDivisibleNumber(20) == 232_792_560);
}