/*
The number 512 is interesting because it is equal to the sum
of its digits raised to some power: 5 + 1 + 2 = 8, and 8^3 = 512.
Another example of a number with this property is 614656 = 28^4.

We shall define an to be the nth term of this sequence and insist
that a number must contain at least two digits to have a sum.

You are given that a2 = 512 and a10 = 614656.

Find a30.
*/

#include "commons.h"
#include <stdio.h>
#include <stdlib.h>

i32
CalcSum(i64 Value)
{
	i32 Result = 0;

	while (Value > 0)
	{
		Result += Value % 10;
		Value /= 10;
	}

	return(Result);
}

int
Compare(const i64 *a, const i64 *b)
{
	return (*a > *b) - (*a < *b);
}

void
main(int argc, char *argv[])
{
	i64 Interesting[100] = {0};
	i64 Count = 0;

	for (int Sum = 2; Sum < 180; Sum += 1)
	{
		i64 Power = Sum * Sum;

		while (Power > 0)
		{
			if (CalcSum(Power) == Sum)
			{
				Interesting[Count] = Power;
				Count += 1;
			}

			Power *= Sum;
		}
	}

	qsort(Interesting, Count, sizeof(i64), Compare);

	for (int I = 0; I < Count; I += 1)
	{
		printf("%d: %lld\n", I+1, Interesting[I]);
	}
}
