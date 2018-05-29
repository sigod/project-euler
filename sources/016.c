/*
Problem 16
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2^1000?
*/

#include "commons.h"
#include <stdio.h>


int main(int argc, char *argv[])
{
	u32 Base = 2;
	u32 ExponentTarget = 1000;

	big_number BigNumber = BigNumber_Create(Base);

	for (int Exponent = 1; Exponent < ExponentTarget; Exponent += 1)
	{
		BigNumber_Multiply(&BigNumber, Base);
	}

	i64 Result = BigNumber_DigitSum(&BigNumber);

	printf("Length: %lld\n", BigNumber.Length);
	printf("Result: %lld\n", Result);

	return(0);
}
