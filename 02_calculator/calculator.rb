def add(x, y)
    x + y
end

def subtract(x, y)
    x - y
end

def sum(array)
  array.inject(0) { |sum, val| sum + val}
end

def multiply(*numbers)
  numbers.inject(1) { |accum, val| accum * val}
end

def power(x, pow)
  x ** pow
end

def factorial(x)
  res = 1
  while x > 1
    res = res * x
    x -= 1
  end
  res
end
