import std.algorithm;
import std.range;
import std.stdio;
import std.typecons;



ulong nextCollatz(ulong value) pure
{
	return (value & 1) == 0
		? value / 2
		: 3 * value + 1;
}

ulong calculateCount(ulong value)
{
	int result = 1;

	while (value > 1) {
		value = nextCollatz(value);
		++result;
	}

	return result;
}

void main()
{
	auto value = iota(2, 1_000_000)
		.map!((e) => tuple(e, calculateCount(e)))
		.reduce!((a, b) => a[1] > b[1] ? a : b);
	
	writeln(value[0]);
}
