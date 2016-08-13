json.array!(@pasts) do |past|
  json.extract! past, :id
  json.url past_url(past, format: :json)
end
