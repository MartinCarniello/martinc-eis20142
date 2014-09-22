class PrimeGenerator

	def is_prime(n)
		!(2..n - 1).to_a.detect { |i| n % i == 0 }
	end

	def all_primes_to(n)
		(2..n - 1).to_a.select { |i| is_prime(i) }
	end

end