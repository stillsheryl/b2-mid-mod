class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def add_ride(ride_id)
    id = ride_id.to_i
    MechanicRide.create!(mechanic_id: self.id, ride_id: id)
  end
end
