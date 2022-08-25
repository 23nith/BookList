# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { "The Lord of the Rings" }
    author { "J. R. R. Tolkien" }
    cover_image_url { "https://images-na.ssl-images-amazon.com/images/I/51r6XIPWmoL._SX331_BO1,204,203,200_.jpg" }
    page_count { "" }
    publisher { "Houghton Mifflin Harcour" }
    synopsis { "In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell by chance into the hands of the hobbit Bilbo Baggins." }
  end

  factory :random_book, class: Book do
    title { Faker::Book }
    author { Faker::Book.author }
    cover_image_url { Faker::Internet.url }
    page_count { Faker::Number.number(digits: 3) }
    publisher { Faker::Book.publisher }
    synopsis { Faker::Lorem.paragraph }
  end
end
