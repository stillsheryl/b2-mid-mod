require 'rails_helper'

describe "As a visitor," do
  describe "When I visit an amusement park’s show page" do

    before :each do
      @park = Park.create!(name: "Kali's Park", price: 50.00)
      @thunder_mountain = @park.rides.create!(name: "Thunder Mountain", thrill_rating: 10)
      @merry = @park.rides.create!(name: "Merry Go Round", thrill_rating: 2)
      @slide = @park.rides.create!(name: "Giant Slide", thrill_rating: 6)
    end

    it "shows the name and price of admissions for that amusement park" do
      visit "/parks/#{@park.id}"

      expect(page).to have_content(@park.name)
      expect(page).to have_content(@park.price)
    end
  end
end
