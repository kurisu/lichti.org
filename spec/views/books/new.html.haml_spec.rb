require 'rails_helper'

RSpec.describe "books/new", :type => :view do
  before(:each) do
    assign(:book, Book.new(
      :title => "MyString",
      :subtitle => "MyString",
      :author => "MyString",
      :isbn => "MyString",
      :description => "MyString",
      :cover => "",
      :purchase_url => "MyString"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_title[name=?]", "book[title]"

      assert_select "input#book_subtitle[name=?]", "book[subtitle]"

      assert_select "input#book_author[name=?]", "book[author]"

      assert_select "input#book_isbn[name=?]", "book[isbn]"

      assert_select "textarea#book_description[name=?]", "book[description]"

      assert_select "input#book_cover[name=?]", "book[cover]"

      assert_select "input#book_purchase_url[name=?]", "book[purchase_url]"
    end
  end
end
