require 'rails_helper'

RSpec.describe "books/index", :type => :view do
  before(:each) do
    user = FactoryGirl.create(:admin)
    sign_in user
    assign(:current_user, user)

    assign(:books, [
      Book.create!(
        :title => "Title",
        :subtitle => "Subtitle",
        :author => "Author",
        :isbn => "Isbn",
        :description => "Description",
        :cover => nil,
        :purchase_url => "Purchase Url"
      ),
      Book.create!(
        :title => "Title",
        :subtitle => "Subtitle",
        :author => "Author",
        :isbn => "Isbn",
        :description => "Description",
        :cover => "Cover",
        :purchase_url => "Purchase Url"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Subtitle".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 4
    assert_select "tr>td", :text => "Isbn".to_s, :count => 4
    assert_select "tr>td", :text => "Description".to_s, :count => 4
    assert_select "tr>td", :text => "No Cover".to_s, :count => 1
    assert_select "tr>td>img", :count => 1
    assert_select "tr>td>a", :count => 8
  end
end
