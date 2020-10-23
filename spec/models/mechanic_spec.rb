require 'rails_helper'

describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe "instance methods" do
    it "#add_ride" do
      park = Park.create!(name: "Kali's Park", price: 50.00)
      thunder_mountain = park.rides.create!(name: "Thunder Mountain", thrill_rating: 10)
      merry = park.rides.create!(name: "Merry Go Round", thrill_rating: 2)
      slide = park.rides.create!(name: "Giant Slide", thrill_rating: 6)
      bounce = park.rides.create!(name: "Bounce House", thrill_rating: 8)
      millie = Mechanic.create!(name: "Millie Little", years_of_experience: 7)
      MechanicRide.create!(mechanic_id: millie.id, ride_id: thunder_mountain.id)
      MechanicRide.create!(mechanic_id: millie.id, ride_id: merry.id)
      MechanicRide.create!(mechanic_id: millie.id, ride_id: slide.id)

      expect(millie.rides.count).to eq(3)

      millie.add_ride(bounce.id)

      expect(millie.rides.count).to eq(4)
    end
  end
end
