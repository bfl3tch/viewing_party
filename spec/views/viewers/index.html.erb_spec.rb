require 'rails_helper'

RSpec.describe "viewers/index", type: :view do
  before(:each) do
    assign(:viewers, [
      Viewer.create!(
        title: "Title",
        host: 2,
        duration: 3
      ),
      Viewer.create!(
        title: "Title",
        host: 2,
        duration: 3
      )
    ])
  end

  it "renders a list of viewers" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
