class RPNCalculator
    attr_accessor :queue

    def initialize
        @queue = []
    end

    def push(value)
        @queue.push(value)
    end

    def plus
        if @queue.size < 2
            raise 'calculator is empty'
        else
            a = @queue.pop
            b = @queue.pop
            @queue.push(a + b)
        end
    end

    def minus
        if @queue.size < 2
            raise 'calculator is empty'
        else
            a = @queue.pop
            b = @queue.pop
            @queue.push(b - a)
        end
    end

    def times
        if @queue.size < 2
            raise 'calculator is empty'
        else
            a = @queue.pop
            b = @queue.pop
            @queue.push(a * b)
        end
    end

    def divide
        if @queue.size < 2
            raise 'calculator is empty'
        else
            a = @queue.pop
            b = @queue.pop
            @queue.push(b.to_f / a)
        end
    end

    def value
        @queue[-1]
    end

    def tokens(string)
        string.split(' ').collect{ |value|
            if value == '+'
                :+
            elsif value == '-'
                :-
            elsif value == '*'
                :*
            elsif value == '/'
                :/
            else
                value.to_i
            end
        }
    end

    def evaluate(string)
        list = self.tokens(string)
        for value in list
            if value == :+
                self.plus
            elsif value == :-
                self.minus
            elsif value == :*
                self.times
            elsif value == :/
                self.divide
            else
                self.push(value)
            end
        end
        self.value
    end
end
