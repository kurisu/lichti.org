json.array!(@books) do |book|
  json.extract! book, :id, :title, :subtitle, :author, :isbn, :description, :cover, :purchase_url
  json.url book_url(book, format: :json)
end
