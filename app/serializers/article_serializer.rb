class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :headline, :published, :content, :tag_list
  has_one :category

  def tag_list
    object.tag_list
  end

  def image
    object.image.url
  end
end
