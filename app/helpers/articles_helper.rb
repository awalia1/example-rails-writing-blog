module ArticlesHelper

    def long_article?(a)
       if a.content.split('').count > 100
            msg = 'You may want to read this later'
       else
            msg = 'This is a quick read'
       end
       return msg
    end

end
