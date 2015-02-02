require "time"

def measure(number_of_times = 1)
    start = Time.now
    number_of_times.times do
        yield
    end
    (Time.now - start).to_f / number_of_times
end
