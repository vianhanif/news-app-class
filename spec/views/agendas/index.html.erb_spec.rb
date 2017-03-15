require 'rails_helper'

RSpec.describe "agendas/index", type: :view do
  before(:each) do
    assign(:agendas, [
      Agenda.create!(
        :title => "Title",
        :organizer => "Organizer",
        :image => "Image",
        :location => "Location",
        :start => "Start",
        :end => "End",
        :description => "MyText",
        :price => "",
        :slug => "Slug"
      ),
      Agenda.create!(
        :title => "Title",
        :organizer => "Organizer",
        :image => "Image",
        :location => "Location",
        :start => "Start",
        :end => "End",
        :description => "MyText",
        :price => "",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of agendas" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Organizer".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Start".to_s, :count => 2
    assert_select "tr>td", :text => "End".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
