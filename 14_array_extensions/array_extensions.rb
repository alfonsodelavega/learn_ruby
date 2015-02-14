class Array

  def sum
    sum = 0
    self.each do |e|
      sum += e
    end
    sum
  end

  def square
     self.collect { |value| value * value }
  end

  def square!
     self.collect! { |value| value * value }
  end

end
