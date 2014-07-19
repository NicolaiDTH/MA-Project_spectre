json.array!(@films) do |film|
  json.extract! film, :id, :title, :synopsis, :rating
  json.url film_url(film, format: :json)
end
