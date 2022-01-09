json.extract! announcement, :id, :title_en, :title_fr, :body_en, :body_fr, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
