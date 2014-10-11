require 'timeout'

module InOneMinute
  def in_one_minute
    Timeout.timeout 60 do
      yield
    end
  end
end
