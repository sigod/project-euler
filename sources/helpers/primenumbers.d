module helpers.primenumbers;


pure ulong[] getPrimeNumbers(ulong up_to) {
	if (up_to < 2) return [];

	ulong[] primes = [2];

	for (ulong number = 3; number <= up_to; number += 2) {
		bool isPrime = true;

		foreach (prime; primes) {
			if (number % prime == 0) {
				isPrime = false;
				break;
			}
		}

		if (isPrime) {
			primes ~= number;
		}
	}

	return primes;
}


unittest {
	static assert(getPrimeNumbers(1).length == 0);
	static assert(getPrimeNumbers(2).length == 1);
	static assert(getPrimeNumbers(5).length == 3);
	static assert(getPrimeNumbers(20).length == 8);
}