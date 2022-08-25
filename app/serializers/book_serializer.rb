class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :year, :title, :author, :cover_image_url, :page_count, :publisher, :synopsis
end
