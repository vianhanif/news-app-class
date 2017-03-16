module ApplicationHelper

  def render_metas title, image_url, desc
    if action_name == 'read_agenda' or action_name == 'read_article'
      " <meta property=\"fb:app_id\"             content=\"379416432442037\" />
        <meta property=\"og:url\"                content=\"#{request.original_url}\" />
        <meta property=\"og:type\"               content=\"article\" />
        <meta property=\"og:title\"              content=\"#{title}\" />
        <meta property=\"og:description\"        content=\"#{desc}\" />
        <meta property=\"og:image\"              content=\"#{image_url}\" />".html_safe
    end
  end

end
