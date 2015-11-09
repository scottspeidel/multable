require_relative '../lib/primes'
require 'prime'

describe Primes, "#generate" do
  it "should return an empty array for n=1" do
    expect(Primes.generate(0,:sieve)).to eq []
  end

  it "should return the first prime" do
    expect(Primes.generate(1,:sieve)).to eq Prime.take(1)
  end

  it "should return the first thousand primes" do
    expect(Primes.generate(1000,:sieve)).to eq Prime.take(1000)
  end

  it "should return the first thousand primes" do
    expect(Primes.generate(1000,:trial_division)).to eq Prime.take(1000)
  end

end
