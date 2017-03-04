json.extract! article, :id, :author, :title, :headline, :published, :content, :category_id, :created_at, :updated_at
json.url article_url(article, format: :json)
