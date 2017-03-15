require 'rails_helper'

RSpec.describe "agendas/new", type: :view do
  before(:each) do
    assign(:agenda, Agenda.new(
      :title => "MyString",
      :organizer => "MyString",
      :image => "MyString",
      :location => "MyString",
      :start => "MyString",
      :end => "MyString",
      :description => "MyText",
      :price => "",
      :slug => "MyString"
    ))
  end

  it "renders new agenda form" do
    render

    assert_select "form[action=?][method=?]", agendas_path, "post" do

      assert_select "input#agenda_title[name=?]", "agenda[title]"

      assert_select "input#agenda_organizer[name=?]", "agenda[organizer]"

      assert_select "input#agenda_image[name=?]", "agenda[image]"

      assert_select "input#agenda_location[name=?]", "agenda[location]"

      assert_select "input#agenda_start[name=?]", "agenda[start]"

      assert_select "input#agenda_end[name=?]", "agenda[end]"

      assert_select "textarea#agenda_description[name=?]", "agenda[description]"

      assert_select "input#agenda_price[name=?]", "agenda[price]"

      assert_select "input#agenda_slug[name=?]", "agenda[slug]"
    end
  end
end
