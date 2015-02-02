def translate(words)
    words.split(' ').collect! { |word|
        if ['a', 'e', 'i', 'o', 'u'].include?(word[0])
            word + 'ay'
        else
            index = 1
            while (index < word.length and
                   not ['a', 'e', 'i', 'o', 'u'].include?(word[index]))
                index += 1
            end
            # counting 'qu' as a single phoneme
            if (word[index] == 'u' and word[index - 1] == 'q')
                index += 1
            end
            word[index..-1] + word[0..index - 1] + 'ay'
        end
    }.join(' ')
end
