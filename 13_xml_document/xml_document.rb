class XmlDocument
    attr_accessor :indent

    def initialize(indent = false)
        @indent = indent
    end

    def hello(options = {})
        res = ''
        if block_given?
            res = "<hello>" + yield + "</hello>"
        else
            res = "<hello/>"
        end
        if options.has_key?(:name)
            res = res[0..5] + " name='#{options[:name]}'" + res[6..-1]
        end
        if @indent
            res = indent(res)
        end
        res
    end

    def send(tag_name, options = {}, level = 0)
        initial_tag = tag_name
        if options != {}
            options.each { |key, value|
                initial_tag += " #{key}='#{value}'"
            }
        end
        if block_given?
            "<#{initial_tag}>" + yield + "</#{tag_name}>"
        else
            "<#{initial_tag}/>"
        end
    end

    def goodbye
        if block_given?
            send('goodbye') { yield }
        else
            send('goodbye')
        end
    end

    def come_back
        if block_given?
            send('come_back') { yield }
        else
            send('come_back')
        end
    end

    def ok_fine(options)
        if block_given?
            send('ok_fine', options) { yield }
        else
            send('ok_fine', options)
        end
    end

    def indent(xml)
        level = 0
        xml.split(">").collect { |tag|
            if tag.match(/^<[^\/]/)
                if tag[-1] == "/"
                    # atomic tag
                    tag = "  " * level + tag
                else
                    # opening tag
                    tag = "  " * level + tag
                    level += 1
                end
                tag
            else
                #closing tag
                level -= 1
                tag = "  " * level + tag
            end
        }.join(">\n") + ">\n"
    end
end
