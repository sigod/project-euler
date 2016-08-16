/*
Problem 17

If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of
"and" when writing out numbers is in compliance with British usage.
*/

import std.stdio;

immutable int[] FIRST_N;
immutable int[] TENS;

immutable auto HUNDRED = 7;
immutable auto THOUSAND = 8;
immutable auto AND = 3;

static this()
{
	import std.algorithm: map;
	import std.array: array;

	auto _20 = ["",    "one",    "two",    "three",    "four",     "five",    "six",     "seven",     "eight",    "nine",
	            "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"];
	FIRST_N = cast(immutable)_20.map!(e => cast(int)e.length).array;

	auto _10 = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];
	TENS = cast(immutable)_10.map!(e => cast(int)e.length).array;
}

void main()
{
	int below_100(int _XX) static pure
	{
		return _XX < FIRST_N.length
			? FIRST_N[_XX]
			: TENS[_XX / 10] + FIRST_N[_XX % 10];
	}


	ulong result = FIRST_N[1] + THOUSAND;

	foreach (_XX; 1 .. 100)
		result += below_100(_XX);

	foreach (_X00; 1 .. 10) {
		result += FIRST_N[_X00] + HUNDRED;

		foreach (_XX; 1 .. 100)
			result += FIRST_N[_X00] + HUNDRED + AND + below_100(_XX);
	}

	writeln(result);
}
