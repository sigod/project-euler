/*
A googol (10^100) is a massive number: one followed by one-hundred zeros;
100^100 is almost unimaginably large: one followed by two-hundred zeros.
Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
*/

#include "commons.h"
#include <stdio.h>


int main(int argc, char *argv[])
{
	i64 Result = 0;
	i64 Limit = 100;

	for (i64 A = 1; A < Limit; A += 1)
	{
		for (i64 B = 1; B < Limit; B += 1)
		{
			big_number BigNumber = BigNumber_Create((u8)A);

			for (i64 Index = 0; Index < B; Index += 1)
			{
				BigNumber_Multiply(&BigNumber, A);
			}

			i64 Sum = BigNumber_DigitSum(&BigNumber);
			if (Sum > Result)
			{
				Result = Sum;
			}
		}
	}

	printf("Result: %lld\n", Result);

	return(0);
}
