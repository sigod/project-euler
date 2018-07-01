/*
Let d(n) be defined as the sum of proper divisors of n (numbers less
than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair
and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/

#include "commons.h"
#include <stdio.h>

i32
DivisorSum(i32 Value)
{
	i32 Sum = 0;

	for (i32 D = 1; D < Value/2 + 1; D += 1)
	{
		if (Value % D == 0)
		{
			Sum += D;
		}
	}

	return(Sum);
}

int
main(int argc, char *argv[])
{
	i32 Sum = 0;

	for (i32 N = 1; N < 10000; N += 1)
	{
		i32 D1 = DivisorSum(N);

		if (D1 != N && DivisorSum(D1) == N)
		{
			printf("pair: %d, %d\n", N, D1);

			Sum += N;
		}
	}

	printf("%d\n", Sum);

	return(0);
}
