class Dictionary
    attr_accessor :entries

    def initialize()
        @entries = {}
    end

    def add(entry)
        if entry.is_a?(Hash)
            entry.each{ |key, value| @entries[key] = value }
        else
            @entries[entry] = nil
        end
    end

    def keywords
        @entries.keys.sort
    end

    def include?(key)
        @entries.has_key?(key)
    end

    def find(key)
        return @entries.select{ |k, v| k.match(/^#{key}/) }
    end

    def printable
        @entries.sort.collect{ |key, value| "[#{key}] \"#{value}\"" }.join("\n")
    end
end
