require 'rails_helper'

RSpec.describe "agendas/show", type: :view do
  before(:each) do
    @agenda = assign(:agenda, Agenda.create!(
      :title => "Title",
      :organizer => "Organizer",
      :image => "Image",
      :location => "Location",
      :start => "Start",
      :end => "End",
      :description => "MyText",
      :price => "",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Organizer/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Start/)
    expect(rendered).to match(/End/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
