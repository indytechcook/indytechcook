
 module Jekyll
  class RenderAbstract < Liquid::Tag
    def initialize(tag_name, char_count, tokens)
      @char_count = char_count
      super
    end

    def render(context)
      
    end
  end
end
 
Liquid::Template.register_tag('abstract', Jekyll::RenderAbstract)