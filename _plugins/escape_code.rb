require 'jekyll'


module Jekyll
  module EscapeCode
    Jekyll::Hooks.register [:documents, :pages, :posts], :pre_render do |item|
      item.content = Jekyll::EscapeCode.escape(item)
    end

    Jekyll::Hooks.register [:documents, :pages, :posts], :post_render do |item|
      Jekyll::EscapeCode.unescape_brackets(item.output)
    end

    extend self

    def escape_brackets(content)
      content.gsub(/{/,'&#x7b;').gsub(/}/, '&#x7d;')
    end

    def unescape_brackets(content)
      content.gsub!(/&(amp;)?#x7b;/, '{')
      content.gsub!(/&(amp;)?#x7d;/, '}')
      content
    end

    def escape(page)
      ext = page.ext.downcase
      content = page.content.encode!("UTF-8")
      md_ext = %w{.markdown .mdown .mkdn .md .mkd .mdwn .mdtxt .mdtext}

      # Escape markdown style code blocks
      if md_ext.include?(ext)
        # Escape four tab or space indented code blocks
        content = content.gsub(/^((\t| {4})[^\n].+?)\n($|\S)/m) do
          "#{escape_brackets $1}\n#{$3}"
        end

        # Escape in-line code backticks
        content = content.gsub(/(`[^`\n]+?`)/) do
          "#{escape_brackets $1}"
        end

        # Escape in-line code double backticks
        content = content.gsub(/(``[^\n]+?``)/) do
          escape_brackets $1
        end

      end

      # Escape highlight and codeblock tag contents
      content = content.gsub(/^({%\s*(codeblock|highlight).+?%})(.+?){%\s*end(codeblock|highlight)\s*%}/m) do
        "#{$1}{% raw %}#{unescape_brackets $3}{% endraw %}{% end#{$4} %}"
      end

      # Escape codefenced codeblocks
      content = content.gsub(/^(`{3}.+?`{3})/m) do
        # Replace any raw/endraw tags inside of codefence block
        # as some of the regex above may have escaped contents
        # of the codefence block
        #

        code = unescape_brackets($1).gsub(/{% (end)?raw %}/, '')
        # Wrap codefence content in raw tags
        "{% raw %}\n#{code}\n{% endraw %}"
      end

      content
    end
  end
end
