module Primes
  def self.generate(n,algorithm)
    return [] if n < 1
    potential_prime = 2
    list_of_primes = [potential_prime]
    while list_of_primes.length < n
      potential_prime += 1
      case algorithm
      when :sieve
        if is_prime_sieve(list_of_primes, potential_prime)
          list_of_primes.push(potential_prime)
        end
      when :trial_division
        if is_prime_trial_division(potential_prime)
          list_of_primes.push(potential_prime)
        end
      end
    end
    list_of_primes
  end

  def self.is_prime_sieve(list_of_primes, potential_next_prime)
    sqrt_pnp = Math.sqrt(potential_next_prime)
    list_of_primes.each do |p|
      return true if p > sqrt_pnp
      return false if potential_next_prime % p == 0
    end
  end

  def self.is_prime_trial_division(potential_prime)
    (2..Math.sqrt(potential_prime)).each do |divisor|
      return false if potential_prime % divisor == 0
    end
    true
  end

end
