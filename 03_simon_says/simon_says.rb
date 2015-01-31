def echo(msg)
    msg
end

def shout(msg)
    msg.upcase
end

def repeat(msg, rep_num = 2)
    res = "#{msg}"
    (rep_num - 1).times do
        res += " #{msg}"
    end
    res
end

def start_of_word(word, len)
    word[0..len-1]
end

def first_word(str)
    str.split(' ').[](0)
end

def titleize(word)
    word.split(' ').each_with_index.map{ |i, index|
        if not ['and', 'the', 'over'].include?(i) or index == 0
            i.capitalize
        else
            i
        end
    }.join(' ')
end
