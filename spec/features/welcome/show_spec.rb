require 'rails_helper'

RSpec.describe "About us Page" do
  describe "index" do
    before(:each) do
      visit about_path
    end

    it "has developer names " do
      expect(page).to have_content("Brian Fletcher")
      expect(page).to have_content("Jason Knoll")
    end

    it "has functional links to their linkedin" do
      expect(page).to have_link("Brian Fletcher")
      expect(page).to have_link("Jason Knoll")
    end
  end
end
