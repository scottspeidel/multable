require_relative 'lib/multable'
require_relative 'lib/primes'

Multable.new(Primes.generate(10,:trial_division)).print_table
