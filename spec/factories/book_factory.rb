FactoryGirl.define do

  factory :book do
    sequence :title do |n| "Amazing Book #{n}" end
    sequence :subtitle do |n| "The outstanding sequel to Amazing Book #{n-1}" end
    sequence :author do |n| "Christopher #{n}" end
    sequence :isbn do |n| "9993923014#{n}" end
    sequence :purchase_url do |n| "http://buy.it.here#{n}.com/books/this_one" end
  end

  factory :book_with_cover, class: Book do
    sequence :title do |n| "Amazing Book #{n}" end
    sequence :subtitle do |n| "The outstanding sequel to Amazing Book #{n-1}" end
    sequence :author do |n| "Christopher #{n}" end
    sequence :isbn do |n| "9993923014#{n}" end
    sequence :purchase_url do |n| "http://buy.it.here#{n}.com/books/this_one" end
    cover 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7'
  end
end