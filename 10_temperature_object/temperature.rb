class Temperature
    attr_accessor :temp

    def Temperature.from_celsius(temp)
        Temperature.new(:c => temp)
    end

    def Temperature.from_fahrenheit(temp)
        Temperature.new(:f => temp)
    end

    def initialize(options)
        if options.has_key?(:f)
            @temp = options[:f]
        elsif options.has_key?(:c)
            @temp = options[:c].to_f * 9 / 5 + 32
        else
            @temp = 32 #default
        end
    end

    def in_fahrenheit
        @temp
    end

    def in_celsius
        (@temp.to_f - 32) * 5 / 9
    end
end

class Celsius < Temperature

    def initialize(temp)
        super(:c => temp)
    end
end

class Fahrenheit < Temperature

    def initialize(temp)
        super(:f => temp)
    end
end
