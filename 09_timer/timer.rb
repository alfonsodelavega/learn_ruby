class Timer
    attr_accessor :seconds

    def initialize(seconds = 0)
        @seconds = seconds
    end

    def time_string
        hours = @seconds / 3600
        minutes = (@seconds % 3600) / 60
        seconds = @seconds % 60
        if hours < 10
            hours = "0#{hours}"
        end
        if minutes < 10
            minutes = "0#{minutes}"
        end
        if seconds < 10
            seconds = "0#{seconds}"
        end
        "#{hours}:#{minutes}:#{seconds}"
    end
end
