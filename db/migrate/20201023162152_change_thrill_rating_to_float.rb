class ChangeThrillRatingToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :thrill_rating, :float
  end
end
