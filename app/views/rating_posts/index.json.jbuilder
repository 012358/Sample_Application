json.array!(@rating_posts) do |rating_post|
  json.extract! rating_post, :id, :title
  json.url rating_post_url(rating_post, format: :json)
end
