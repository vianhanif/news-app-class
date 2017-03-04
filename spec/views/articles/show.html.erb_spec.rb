require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :author => "Author",
      :title => "Title",
      :headline => "Headline",
      :content => "MyText",
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Headline/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
