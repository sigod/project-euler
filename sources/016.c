/*
Problem 16
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2^1000?
*/
// --------------------------------
#include <stdint.h>

typedef int8_t i8;
typedef int16_t i16;
typedef int32_t i32;
typedef int64_t i64;

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

typedef int32_t b32;
#define true 1
#define false 0

typedef float r32;
typedef double r64;
// --------------------------------

// NOTE(sigod): calloc
#include <stdlib.h>

#include <stdio.h>

int main(int argc, char *argv[])
{
	u8* BigNumber = calloc(400, sizeof(u8));

	u32 Base = 2;
	u32 ExponentTarget = 1000;

	BigNumber[0] = Base;
	i32 BigNumberLength = 1;

	for (int Exponent = 1; Exponent < ExponentTarget; Exponent += 1)
	{
		u32 Extra = 0;
		i32 DigitIndex = 0;

		for (;
			DigitIndex < BigNumberLength || Extra;
			DigitIndex += 1)
		{
			i8 Digit = BigNumber[DigitIndex] * Base + Extra;
			if (Digit < 10) {
				BigNumber[DigitIndex] = Digit;
				Extra = 0;
			}
			else {
				BigNumber[DigitIndex] = Digit - 10;
				Extra = 1;
			}
		}

		BigNumberLength = DigitIndex;
	}


	u32 Result = 0;
	for (i32 Index = 0; Index < BigNumberLength; Index += 1)
	{
		Result += BigNumber[Index];
	}

	printf("Length: %d\n", BigNumberLength);
	printf("Result: %d\n", Result);

	return(0);
}
