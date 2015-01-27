require 'rails_helper'

RSpec.describe "home/index.html.haml", :type => :view do
  require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

  describe "home/index.html.erb" do
    it 'should have a banner link wired up to existing scroll tools and rigged to disappear after one use' do
      render

      expect(rendered).to have_tag('a#banner-start-link', :with => { :class => ['banner-start-link', 'scrollspy','smooth-scroll','one-time-link']})
    end
  end
end
