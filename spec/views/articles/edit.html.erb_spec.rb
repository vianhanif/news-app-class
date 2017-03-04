require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :author => "MyString",
      :title => "MyString",
      :headline => "MyString",
      :content => "MyText",
      :category => nil
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_author[name=?]", "article[author]"

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_headline[name=?]", "article[headline]"

      assert_select "textarea#article_content[name=?]", "article[content]"

      assert_select "input#article_category_id[name=?]", "article[category_id]"
    end
  end
end
