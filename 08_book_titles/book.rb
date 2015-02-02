class Book
    attr_accessor :title

    def initialize(title = '')
        @title = title.capitalize
    end

    def title=(title)
        @title = title.split(' ').each_with_index.map{ |word, index|
            if not ['and', 'the', 'over', 'in', 'of', 'a', 'an'].include?(word) or
               index == 0
                word.capitalize
            else
                word
            end
        }.join(' ')
    end
end
