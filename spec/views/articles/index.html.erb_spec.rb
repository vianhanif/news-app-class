require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :author => "Author",
        :title => "Title",
        :headline => "Headline",
        :content => "MyText",
        :category => nil
      ),
      Article.create!(
        :author => "Author",
        :title => "Title",
        :headline => "Headline",
        :content => "MyText",
        :category => nil
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Headline".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
