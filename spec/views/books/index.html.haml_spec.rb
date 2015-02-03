require 'rails_helper'

RSpec.describe "books/index", :type => :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :title => "Title",
        :subtitle => "Subtitle",
        :author => "Author",
        :isbn => "Isbn",
        :description => "Description",
        :cover => "",
        :purchase_url => "Purchase Url"
      ),
      Book.create!(
        :title => "Title",
        :subtitle => "Subtitle",
        :author => "Author",
        :isbn => "Isbn",
        :description => "Description",
        :cover => "",
        :purchase_url => "Purchase Url"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Subtitle".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Purchase Url".to_s, :count => 2
  end
end
