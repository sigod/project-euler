import std.stdio;



struct TriangleNumbersRange
{
	enum empty = false;

	ulong front()
	{
		return _current;
	}

	void popFront()
	{
		_current += ++_index;
	}
	
private:

	ulong _current = 1;
	ulong _index = 1;
}



size_t getNumberOfFactors(ulong number)
{
	import std.math : sqrt;
	
	auto result = 2;
	
	foreach (value; 2 .. cast(ulong)sqrt(cast(real)number))
	{
		if (number % value == 0)
			result += 2;
	}
	
	return result;
}



void main()
{
	auto range = TriangleNumbersRange();

	foreach (number; range) {
		if (getNumberOfFactors(number) > 500) {
			writeln(number);
			return;
		}
	}
}
