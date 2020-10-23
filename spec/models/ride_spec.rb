require 'rails_helper'

describe Ride, type: :model do
  describe "relationships" do
    it { should belong_to :parks }
  end
end
