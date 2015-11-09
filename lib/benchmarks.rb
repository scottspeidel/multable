require 'benchmark'
require 'prime'
require_relative 'primes'

n = 1000000
Benchmark.bm(7) do |x|
  x.report("prime")      {Prime.take(n)}
  x.report("sieve")      {Primes.generate(n,:sieve)}
  x.report("trialdiv")   {Primes.generate(n,:trial_division)}
end

################################################################################
# Performace Results
################################################################################
# n=5000        user     system      total        real
# prime     0.010000   0.000000   0.010000 (  0.005119)
# sieve     0.040000   0.000000   0.040000 (  0.045338)
# trialdiv  0.160000   0.000000   0.160000 (  0.155216)

# n=50000       user     system      total        real
# prime     0.070000   0.000000   0.070000 (  0.070597)
# sieve     0.920000   0.000000   0.920000 (  0.927030)
# trialdiv  5.060000   0.010000   5.070000 (  5.069946)

# n=100000      user     system      total        real
# prime     0.140000   0.000000   0.140000 (  0.144874)
# sieve     2.280000   0.000000   2.280000 (  2.281248)
# trialdiv 13.910000   0.010000  13.920000 ( 13.923905)

# n=1000000      user     system      total        real
# prime      1.450000   0.060000   1.510000 (  1.504385)
# sieve     54.610000   0.030000  54.640000 ( 54.680664)
# trialdiv 467.710000   0.370000 468.080000 (468.531527)

