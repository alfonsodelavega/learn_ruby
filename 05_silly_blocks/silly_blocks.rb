def reverser()
    yield.split(' ').map{ |word| word.reverse! }.join(' ')
end

def adder(value = 1)
    yield + value
end

def repeater(number_of_times = 1)
    number_of_times.times do
        yield
    end
end
