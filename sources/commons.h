
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


// NOTE(sigod): calloc
#include <stdlib.h>


typedef struct
{
	u64 Length;
	u8 *Digits;
	u64 MemorySize;
} big_number;

big_number BigNumber_Create(u8 Value)
{
	big_number BigNumber = {0};
	BigNumber.Length = 1;
	BigNumber.MemorySize = 400;
	BigNumber.Digits = calloc(BigNumber.MemorySize, sizeof(u8));
	BigNumber.Digits[0] = Value;
	return(BigNumber);
}

void BigNumber_Multiply(big_number *TheNumber, i64 Multiplier)
{
	u64 Value = Multiplier;

	u64 Extra = 0;
	u64 DigitIndex = 0;

	for (;
		DigitIndex < TheNumber->Length || Extra > 0;
		DigitIndex += 1)
	{
		u64 Digit = TheNumber->Digits[DigitIndex] * Value + Extra;

		TheNumber->Digits[DigitIndex] = Digit % 10;
		Extra = Digit / 10;
	}

	TheNumber->Length = DigitIndex;
}

i64 BigNumber_DigitSum(big_number *TheNumber)
{
	i64 Result = 0;
	for (u64 Index = 0; Index < TheNumber->Length; Index += 1)
	{
		Result += TheNumber->Digits[Index];
	}
	return(Result);
}
