import std.stdio;



ulong calcNumberOfRoutesForGrid(int n, int m)
{
	++n;
	++m;

	// allocation

	ulong[][] grid = new ulong[][n];

	foreach (ref row; grid)
		row = new ulong[m];

	// initialization

	foreach (ref cell; grid[0])
		cell = 1;

	foreach (ref row; grid)
		row[0] = 1;

	// calculation

	for (auto i = 1; i < n; ++i) {
		for (auto j = 1; j < m; ++j) {
			grid[i][j] = grid[i - 1][j] + grid[i][j - 1];
		}
	}

	return grid[n - 1][m - 1];
}

unittest {
	assert(calcNumberOfRoutesForGrid(2, 2) == 6);
}



void main()
{
	calcNumberOfRoutesForGrid(20, 20)
		.writeln();
}
