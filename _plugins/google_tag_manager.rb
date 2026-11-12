# Adds the Google Tag Manager container (site.google_tag_manager in _config.yml)
# to every built HTML page, including the GEOG 215 book pages that Quarto
# renders and that are copied into geog215/ without Jekyll layouts.
# Skipped under `jekyll serve` so local previews don't send analytics.

module GoogleTagManager
  def self.head_snippet(id)
    <<~HTML
      <!-- Google Tag Manager -->
      <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
      j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
      'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','dataLayer','#{id}');</script>
      <!-- End Google Tag Manager -->
    HTML
  end

  def self.ga_snippet(id)
    <<~HTML
      <!-- Google tag (gtag.js) -->
      <script async src="https://www.googletagmanager.com/gtag/js?id=#{id}"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '#{id}');
      </script>
    HTML
  end

  def self.body_snippet(id)
    <<~HTML
      <!-- Google Tag Manager (noscript) -->
      <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=#{id}"
      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
      <!-- End Google Tag Manager (noscript) -->
    HTML
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  next if site.config["serving"]

  gtm = site.config["google_tag_manager"].to_s.strip
  ga = site.config["google_analytics"].to_s.strip
  next if gtm.empty? && ga.empty?

  head = ""
  head << GoogleTagManager.ga_snippet(ga) unless ga.empty?
  head << GoogleTagManager.head_snippet(gtm) unless gtm.empty?
  body = gtm.empty? ? "" : GoogleTagManager.body_snippet(gtm)

  Dir.glob(File.join(site.dest, "**", "*.html")).each do |path|
    html = File.read(path, encoding: "UTF-8")
    next if html.include?("www.googletagmanager.com/") # already tagged
    next unless html =~ /<head[^>]*>/i

    html = html.sub(/<head[^>]*>/i) { |tag| "#{tag}\n#{head}" }
    html = html.sub(/<body[^>]*>/i) { |tag| "#{tag}\n#{body}" } unless body.empty?
    File.write(path, html, encoding: "UTF-8")
  end
end
