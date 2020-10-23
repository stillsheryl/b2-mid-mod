require 'rails_helper'

describe Park, type: :model do
  describe "relationships" do
    it { should have_many :rides }
  end

  describe "instance methods" do
    it "average_thrill_rating" do
      park = Park.create!(name: "Kali's Park", price: 50.00)
      thunder_mountain = park.rides.create!(name: "Thunder Mountain", thrill_rating: 10)
      merry = park.rides.create!(name: "Merry Go Round", thrill_rating: 2)
      slide = park.rides.create!(name: "Giant Slide", thrill_rating: 6)

      expect(park.average_thrill_rating).to eq(6)
    end
  end
end
