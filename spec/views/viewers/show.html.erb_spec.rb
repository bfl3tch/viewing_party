require 'rails_helper'

RSpec.describe "viewers/show", type: :view do
  before(:each) do
    @viewer = assign(:viewer, Viewer.create!(
      title: "Title",
      host: 2,
      duration: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
