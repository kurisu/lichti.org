require 'rails_helper'

RSpec.describe "books/show", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :title => "Title",
      :subtitle => "Subtitle",
      :author => "Author",
      :isbn => "Isbn",
      :description => "Description",
      :cover => "",
      :purchase_url => "Purchase Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Subtitle/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Isbn/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Purchase Url/)
  end
end
