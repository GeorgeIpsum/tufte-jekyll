## properly render markdown tables within a div.table-wrapper tag
## Usage {% table [md table]} will render a span
## YOUR TEXT STRING HERE (sort of, you know, small caps) if you are using the tufte.css file

module Jekyll
  class TableWrapper < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
    end
    require "kramdown"
    def render(context)
      content = super
      "<div class=\"table-wrapper\">#{Kramdown::Document.new(content).to_html}</div>"
    end
  end
end
Liquid::Template.register_tag('tablewrapper', Jekyll::TableWrapper)