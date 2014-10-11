require 'benchmark'

module MiniTest::Assertions
  def assert_benchmark_in(time, &block)
    result = Benchmark.realtime do
      yield
    end
    assert result <= time, "Expected benchmark #{result} to be within #{time}."
  end
end

Proc.infect_an_assertion :assert_benchmark_in, :must_benchmark_in
