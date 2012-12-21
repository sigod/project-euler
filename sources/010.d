module pu_010;

import std.conv : to;
import std.stdio;
import helpers.primenumbers : getPrimeNumbers;

void main(string[] args) {
	ulong below = 2_000_000;

	if (args.length > 1) {
		below = to!ulong(args[1]);
	}
	
	ulong sum = 0;
	foreach (prime; getPrimeNumbers(below - 1)) {
		sum += prime;
	}

	stdout.write(sum);
}