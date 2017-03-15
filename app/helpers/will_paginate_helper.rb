module WillPaginateHelper
  class WillPaginateJSLinkRenderer < WillPaginate::ActionView::LinkRenderer
    def prepare(collection, options, template)
      options[:params] ||= {}
      options[:params]['_'] = nil
      super(collection, options, template)
    end

    protected
    def link(text, target, attributes = {})
      if target.is_a? Fixnum
        attributes[:rel] = rel_value(target)
        target = url(target)
      end

      @template.link_to(target, attributes.merge(remote: true)) do
        text.to_s.html_safe
      end
    end
  end

  def js_will_paginate(collection, options = {})
    will_paginate(collection, options.merge(:renderer => WillPaginateHelper::WillPaginateJSLinkRenderer))
  end

  def init_auto_paginate
    "<script>
      $(document).on('click', '.pagination a', function() {
        $('.pagination').html('<span class=\"loading\">Loading...</span>');
        console.log(this.href);
        $.ajax({
          url: this.href,
          dataType: 'script',
          error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.responseText);
        }
        });
        return false;
      });
    </script>".html_safe
  end
end
