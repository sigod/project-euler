module pu_005;

import std.conv : to;
import std.stdio;

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

ulong[] getPrimeNumbers(ulong up_to) {
	if (up_to < 2) return [];

	ulong[] primes = [2];

	foreach (ulong number; 3..up_to + 1) {
		bool isPrime = true;

		foreach (ulong prime; primes) {
			if (number % prime == 0) {
				isPrime = false;
				break;
			}
		}

		if (isPrime) {
			primes ~= number;
		}
	}

	return primes;
}


unittest {
	static assert(getPrimeNumbers(1).length == 0);
	static assert(getPrimeNumbers(2).length == 1);
	static assert(getPrimeNumbers(5).length == 3);
	static assert(getPrimeNumbers(20).length == 8);

	static assert(getEvenlyDivisibleNumber(1) == 1);
	static assert(getEvenlyDivisibleNumber(2) == 2);
	static assert(getEvenlyDivisibleNumber(3) == 6);
	static assert(getEvenlyDivisibleNumber(4) == 12);
	static assert(getEvenlyDivisibleNumber(5) == 60);
	static assert(getEvenlyDivisibleNumber(10) == 2520);
	static assert(getEvenlyDivisibleNumber(20) == 232_792_560);
}