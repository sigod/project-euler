/*
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
*/

#include "commons.h"
#include <stdio.h>


int main(int argc, char *argv[])
{
	big_number BigNumber = BigNumber_Create(1);

	for (int N = 2; N < 101; N += 1)
	{
		BigNumber_Multiply(&BigNumber, N);
	}

	i64 Result = BigNumber_DigitSum(&BigNumber);

	printf("Length: %lld\n", BigNumber.Length);
	printf("Result: %lld\n", Result);

	return(0);
}
