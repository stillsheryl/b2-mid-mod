require 'rails_helper'

describe "As a user," do
  describe "When I visit a mechanics index page" do
    it "I see a header saying 'All Mechanics' and I see a list of all mechanic’s names and their years of experience" do
      sam = Mechanic.create!(name: "Sam", years_of_experience: 4)
      millie = Mechanic.create!(name: "Millie", years_of_experience: 7)
      luke = Mechanic.create!(name: "Luke", years_of_experience: 2)
      betty = Mechanic.create!(name: "Betty", years_of_experience: 5)

      visit '/mechanics/index'

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(sam.name)
      expect(page).to have_content(sam.years_of_experience)
      expect(page).to have_content(millie.name)
      expect(page).to have_content(millie.years_of_experience)
      expect(page).to have_content(luke.name)
      expect(page).to have_content(luke.years_of_experience)
      expect(page).to have_content(betty.name)
      expect(page).to have_content(betty.years_of_experience)
    end
  end
end
