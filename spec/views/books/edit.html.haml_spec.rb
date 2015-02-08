require 'rails_helper'

RSpec.describe "books/edit", :type => :view do
  context "when the book as no cover" do
    before(:each) do
      @book = assign(:book, Book.create!(
                              :title => "MyString",
                              :subtitle => "MyString",
                              :author => "MyString",
                              :isbn => "MyString",
                              :description => "MyString",
                              :cover => nil,
                              :purchase_url => "MyString"
                          ))
    end

    it "renders the edit book form" do
      render

      assert_select "form[action=?][method=?]", book_path(@book), "post" do

        assert_select "input#book_title[name=?]", "book[title]"

        assert_select "input#book_subtitle[name=?]", "book[subtitle]"

        assert_select "input#book_author[name=?]", "book[author]"

        assert_select "input#book_isbn[name=?]", "book[isbn]"

        assert_select "textarea#book_description[name=?]", "book[description]"

        assert_select "img", count: 0

        assert_select "input#book_cover[name=?]", "book[cover]"

        assert_select "input#book_purchase_url[name=?]", "book[purchase_url]"
      end
    end
  end
  context "when the book as a cover" do
    before(:each) do
      @book = assign(:book, Book.create!(
                              :title => "MyString",
                              :subtitle => "MyString",
                              :author => "MyString",
                              :isbn => "MyString",
                              :description => "MyString",
                              :cover => "cover",
                              :purchase_url => "MyString"
                          ))
    end

    it "renders the edit book form" do
      render

      assert_select "form[action=?][method=?]", book_path(@book), "post" do

        assert_select "input#book_title[name=?]", "book[title]"

        assert_select "input#book_subtitle[name=?]", "book[subtitle]"

        assert_select "input#book_author[name=?]", "book[author]"

        assert_select "input#book_isbn[name=?]", "book[isbn]"

        assert_select "textarea#book_description[name=?]", "book[description]"

        assert_select "img", count: 1

        assert_select "input#book_cover[name=?]", "book[cover]"

        assert_select "input#book_purchase_url[name=?]", "book[purchase_url]"
      end
    end
  end
end
