require 'rails_helper'

RSpec.describe "viewers/edit", type: :view do
  before(:each) do
    @viewer = assign(:viewer, Viewer.create!(
      title: "MyString",
      host: 1,
      duration: 1
    ))
  end

  it "renders the edit viewer form" do
    render

    assert_select "form[action=?][method=?]", viewer_path(@viewer), "post" do

      assert_select "input[name=?]", "viewer[title]"

      assert_select "input[name=?]", "viewer[host]"

      assert_select "input[name=?]", "viewer[duration]"
    end
  end
end
