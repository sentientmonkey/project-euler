#!/usr/bin/env ruby -w
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_of_multiples(n)
  (1...n).to_a.inject(0) do |sum, i|
    if (i % 5) == 0 || (i % 3) == 0
      sum += i
    end
    sum
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require_relative 'minitest_benchmark_in'

describe "multiples" do
  it "should find the sum of multiples below 10" do
    sum_of_multiples(10).must_equal 23
  end
  it "should find the sum of multiples below 1000" do
    sum_of_multiples(1000).must_equal 233168
  end
  it "should find the sum of multiples below 1000 within 1 second" do
    ->{ sum_of_multiples(1000) }.must_benchmark_in(1)
  end
end
