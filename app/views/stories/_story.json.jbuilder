json.extract! story, :id, :title, :location, :url_1, :url_2, :course, :summary, :summary_url, :created_at, :updated_at
json.url story_url(story, format: :json)
