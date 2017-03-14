json.extract! article, :id, :user, :title, :headline, :published, :content, :category_id, :created_at, :updated_at
json.url article_url(article, format: :json)
