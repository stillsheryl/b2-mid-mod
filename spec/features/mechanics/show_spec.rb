require 'rails_helper'

describe "As a user," do
  describe "When I go to a mechanics show page" do

    before :each do
      @park = Park.create!(name: "Kali's Park", price: 50.00)
      @thunder_mountain = @park.rides.create!(name: "Thunder Mountain", thrill_rating: 10)
      @merry = @park.rides.create!(name: "Merry Go Round", thrill_rating: 2)
      @slide = @park.rides.create!(name: "Giant Slide", thrill_rating: 6)
      @millie = Mechanic.create!(name: "Millie Little", years_of_experience: 7)
      MechanicRide.create!(mechanic_id: @millie.id, ride_id: @thunder_mountain.id)
      MechanicRide.create!(mechanic_id: @millie.id, ride_id: @merry.id)
      MechanicRide.create!(mechanic_id: @millie.id, ride_id: @slide.id)
    end

    it "shows their name, years of experience, and names of all rides they’re working on" do
      visit "/mechanics/#{@millie.id}"

      expect(page).to have_content("Mechanic: #{@millie.name}")
      expect(page).to have_content("Years of Experience: #{@millie.years_of_experience}")
      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content(@thunder_mountain.name)
      expect(page).to have_content(@merry.name)
      expect(page).to have_content(@slide.name)
    end
  end
end
