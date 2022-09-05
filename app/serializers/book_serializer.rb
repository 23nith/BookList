# == Schema Information
#
# Table name: books
#
#  id              :bigint           not null, primary key
#  title           :string
#  author          :string
#  cover_image_url :string
#  page_count      :integer
#  publisher       :string
#  synopsis        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :year, :title, :author, :cover_image_url, :page_count, :publisher, :synopsis
end
