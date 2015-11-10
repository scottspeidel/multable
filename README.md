## Multable - Print a multiplication table for the first 10 primes 

### How to generate the table of primes:
```
> git clone https://github.com/scottspeidel/multable
> cd multable
> bundle
> ruby main.rb
```
### Running the benchmark
I've included the ability to measure the different prime number generators. 

open lib/benchmark.rb and set n to your desired value. Then run:
```
> ruby lib/benchmark.rb
```
It is extremely convenient that ruby automatically converts integers to Bignum when they overflow.
```
# irb
2.2.3 :001 > 2**999
 => 5357543035931336604742125245300009052807024058527668037218751941851755255624680612465991894078479290637973364587765734125935726428461570217992288787349287401967283887412115492710537302531185570938977091076523237491790970633699383779582771973038531457285598238843271083830214915826312193418602834034688
2.2.3 :002 > (2**999).class
 => Bignum
```
## Performance
Runtimes for prime number generation via trial division or sieve are well-known. When implementing these algorithms, there are some optimizations that can be made to gain obvious improvements over naive brute force approaches. The simplest of which is only iterate up until sqrt(n). 

The only optimization I made in the multiplicaiton table generation was to mirror the results. Assuming copying is faster than multiplication, you could expect improvements. I did not attempt to measure this. 

Specifically for the prime number generation, I ran some quick performance tests using ruby's benchmark tool.

### Performance Results
```
# prime = ruby's built-in Prime.take(n)
# sieve = Primes.generate(n,:sieve) 
# trialdiv = Primes.generate(n,:trial_division)  

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
```

### memory use
Speed is only one factor in performance. The other major consideration is memory use. The Multable.new method creates a 2d array to hold the multiplicaiton table data. Given *n* input factors, the table will be of size: *(n + 1)(n + 1)*. To calculate the memory use you would 
need to calculate this based on:

* the size of both Int, and Bignum(as they increase). 
* how the prime numbers grow (beyond the scope of this analysis) :)

To verify your estimates, it may be useful to run a [memory profiler](https://github.com/SamSaffron/memory_profiler) to measure it directly. 


 
