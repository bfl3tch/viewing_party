require 'rails_helper'

RSpec.describe "viewers/new", type: :view do
  before(:each) do
    assign(:viewer, Viewer.new(
      title: "MyString",
      host: 1,
      duration: 1
    ))
  end

  it "renders new viewer form" do
    render

    assert_select "form[action=?][method=?]", viewers_path, "post" do

      assert_select "input[name=?]", "viewer[title]"

      assert_select "input[name=?]", "viewer[host]"

      assert_select "input[name=?]", "viewer[duration]"
    end
  end
end
