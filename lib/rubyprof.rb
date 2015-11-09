require 'ruby-prof'
require_relative 'primes'
require 'prime'

n = 10000

dir_p = Dir.pwd + "/profile"
Dir.mkdir(dir_p) unless File.exists?(dir_p)

RubyProf.start
Primes.generate(n, :sieve)
result = RubyProf.stop
printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.new("profile/sieve.html","w"))

RubyProf.start
Primes.generate(n, :trial_division)
result = RubyProf.stop
printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.new("profile/trial_division.html","w"))

RubyProf.start
Prime.take(n)
result = RubyProf.stop
printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.new("profile/built_in_prime.html","w"))
