require 'rails_helper'

describe "As a user," do
  describe "When I go to a mechanics show page" do

    before :each do
      @park = Park.create!(name: "Kali's Park", price: 50.00)
      @thunder_mountain = @park.rides.create!(name: "Thunder Mountain", thrill_rating: 10)
      @merry = @park.rides.create!(name: "Merry Go Round", thrill_rating: 2)
      @slide = @park.rides.create!(name: "Giant Slide", thrill_rating: 6)
      @bounce = @park.rides.create!(name: "Bounce House", thrill_rating: 8)
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

    it "shows a form to add a ride to their workload" do
      visit "/mechanics/#{@millie.id}"

      expect(page).to have_content("Add a ride to workload:")
      expect(page).to have_field('Ride Id')
      expect(page).to have_button('Submit')
    end

    it "shows a form to add a ride to their workload" do
      visit "/mechanics/#{@millie.id}"

      fill_in('Ride Id', :with => "#{@bounce.id}")
      click_on("Submit")

      expect(page).to have_content("#{@bounce.name}")
    end

    it "shows rides in alphabetical order" do
      visit "/mechanics/#{@millie.id}"
save_and_open_page
      within all('.rides')[0] do
        expect(page).to have_content(@merry.name)
      end
      within all('.rides')[1] do
        expect(page).to have_content(@slide.name)
      end
      within all('.rides')[2] do
        expect(page).to have_content(@thunder_mountain.name)
      end
    end
  end
end
