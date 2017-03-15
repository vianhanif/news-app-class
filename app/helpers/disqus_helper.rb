require 'rubygems'
require 'base64'
require 'cgi'
require 'openssl'
require 'json'
require 'securerandom' #SecureRandom.uuid.gsub("-", "").hex
module DisqusHelper

  def disqus_host
    Rails.env.development? ? 'news-app-dev' : 'News App'
  end

  def render_disqus link = nil
    "<div id=\"disqus_thread\"></div>
      <script>
      var disqus_config = function () {
        this.page.url = window.location.origin+\"/#{link}\";  // Replace PAGE_URL with your page's canonical URL variable
        this.page.identifier = \"/#{link}\"; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
      };
      (function() { // DON'T EDIT BELOW THIS LINE
        var d = document, s = d.createElement('script');
        s.src = '//#{disqus_host}.disqus.com/embed.js';
        s.setAttribute('data-timestamp', +new Date());
        (d.head || d.body).appendChild(s);
      })();
      </script>
      <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>".html_safe
  end

  def disqus_count link
    "<span class=\"disqus-comment-count\" data-disqus-identifier=\"/#{link}\">0 Comments</span>
    <script type=\"text/javascript\">
    window.DISQUSWIDGETS = undefined;
    $.getScript(\"http://#{disqus_host}.disqus.com/count.js\");
    </script>".html_safe
  end
end
