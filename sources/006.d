module pu_006;

import std.conv : to;
import std.stdio;

enum ulong problemAnswer = getDifference(100);

void main(string[] args) {
	if (args.length > 1) {
		ulong to = to!ulong(args[1]);

		stdout.write(getDifference(to));
	} else {
		stdout.write(problemAnswer);
	}
}

ulong calcSumOfSquares(ulong up_to) {
	ulong result = 0;

	foreach (number; 1 .. up_to + 1) {
		result += number * number;
	}

	return result;
}

ulong calcSquareOfSum(ulong up_to) {
	ulong sum = 0;

	foreach (number; 1 .. up_to + 1) {
		sum += number;
	}

	return sum * sum;
}

ulong getDifference(ulong up_to) {
	return calcSquareOfSum(up_to) - calcSumOfSquares(up_to);
}


unittest {
	static assert(calcSumOfSquares(10) == 385);
	static assert(calcSquareOfSum(10) == 3025);
	static assert(getDifference(10) == 2640);
}