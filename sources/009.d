module pu_009;

import std.stdio;

void main() {
	ulong a, b, c;

	find(1000, a, b, c);

	stdout.write(a * b * c);
}

pure void find(ulong sum, out ulong a, out ulong b, out ulong c) {
	foreach (_a; 1 .. sum - 1) {
		foreach (_b; _a .. sum) {
			auto _c = sum - _a - _b;

			if (_a * _a + _b * _b == _c * _c) {
				a = _a;
				b = _b;
				c = _c;

				return;
			}
		}
	}

	a = b = c = 0;
}


unittest {
	ulong a, b, c;

	find(12, a, b, c);

	assert(a == 3 && b == 4 && c == 5);
}