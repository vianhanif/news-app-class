module ArticlesHelper

  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size-1)
      yield(tag, classes[index.round])
    end
  end

  def open_article article
    year = article.published.strftime("%Y")
    month = article.published.strftime("%m")
    date = article.published.strftime("%d")
    "/article/#{year}/#{month}/#{date}/#{article.slug}"
  end

  def pick_path article
    "pick/#{article.id}"
  end

end
