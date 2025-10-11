module Jekyll
  class WhitespaceTrimmer
    def self.compress(content)
      content.gsub(/[ \t]+$/, '')
    end
  end

  Hooks.register :documents, :post_render do |doc|
    if doc.output_ext == '.html'
      doc.output = WhitespaceTrimmer.compress(doc.output)
    end
  end

  Hooks.register :pages, :post_render do |page|
    if page.output_ext == '.html'
      page.output = WhitespaceTrimmer.compress(page.output)
    end
  end
end
