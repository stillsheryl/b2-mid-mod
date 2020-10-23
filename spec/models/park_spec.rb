require 'rails_helper'

describe Park, type: :model do
  describe "relationships" do
    it { should have_many :rides }
  end
end
