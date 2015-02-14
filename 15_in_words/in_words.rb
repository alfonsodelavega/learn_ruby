class Fixnum
    def in_words
        res = if self == 0
            'zero'
        elsif self < 100
            read_below_cent(self)
        elsif self < 1000
            read_hundreds(self)
        elsif self < 1000000
            read_thousands(self)
        elsif self < 1000000000
            read_millions(self)
        elsif self < 1000000000000
            read_billions(self)
        else
            read_trillions(self)
        end
        # Remove extra spaces (easier than the code to not add them)
        res.gsub(/\s+/, ' ')
    end
end

def read_trillions(number)
    post_fix = ' trillion'
    control_number = 1000000000000
    if number / control_number == 0
        post_fix = ''
    end
    if number % control_number > 0
        post_fix += ' ' + read_billions(number % control_number)
    end
    if number / control_number < 100
        read_below_cent(number / control_number).to_s + post_fix
    else
        read_hundreds(number / control_number).to_s + post_fix
    end
end

def read_billions(number)
    post_fix = ' billion'
    control_number = 1000000000
    if number / control_number == 0
        post_fix = ''
    end
    if number % control_number > 0
        post_fix += ' ' + read_millions(number % control_number)
    end
    if number / control_number < 100
        read_below_cent(number / control_number).to_s + post_fix
    else
        read_hundreds(number / control_number).to_s + post_fix
    end
end

def read_millions(number)
    post_fix = ' million'
    control_number = 1000000
    if number / control_number == 0
        post_fix = ''
    end
    if number % control_number > 0
        post_fix += ' ' + read_thousands(number % control_number)
    end
    if number / control_number < 100
        read_below_cent(number / control_number).to_s + post_fix
    else
        read_hundreds(number / control_number).to_s + post_fix
    end
end

def read_thousands(number)
    post_fix = ' thousand'
    control_number = 1000
    if number / control_number == 0
        post_fix = ''
    end
    if number % control_number > 0
        post_fix += ' ' + read_hundreds(number % control_number)
    end
    if number / control_number < 100
        read_below_cent(number / control_number).to_s + post_fix
    else
        read_hundreds(number / control_number).to_s + post_fix
    end
end

def read_hundreds(number)
    post_fix = ' hundred'
    control_number = 100
    if number / control_number == 0
        post_fix = ''
    end
    if number % control_number > 0
        post_fix += ' ' + read_below_cent(number % control_number)
    end
    read_below_cent(number / control_number).to_s + post_fix
end

def read_below_cent(number)
    case number
    when 0
        ''
    when 1
        'one'
    when 2
        'two'
    when 3
        'three'
    when 4
        'four'
    when 5
        'five'
    when 6
        'six'
    when 7
        'seven'
    when 8
        'eight'
    when 9
        'nine'
    when 10
        'ten'
    when 11
        'eleven'
    when 12
        'twelve'
    when 13
        'thirteen'
    when 14
        'fourteen'
    when 15
        'fifteen'
    when 16
        'sixteen'
    when 17
        'seventeen'
    when 18
        'eighteen'
    when 19
        'nineteen'
    when 20..99
        res = case (number / 10)
        when 2
            'twenty'
        when 3
            'thirty'
        when 4
            'forty'
        when 5
            'fifty'
        when 6
            'sixty'
        when 7
            'seventy'
        when 8
            'eighty'
        when 9
            'ninety'
        end
        if number % 10 != 0
            res += ' ' + read_below_cent(number % 10)
        end
        res
    end
end
