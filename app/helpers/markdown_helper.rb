# frozen_string_literal: true

# Renders text written with markdown.
module MarkdownHelper
  def simple_markdown(text, target_blank: true, table_class: "", allow_links: true, allow_lists: true)
    simple_format text
  end
end
