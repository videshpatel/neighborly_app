class ChangeDateDataTypeOnEventsTabletoString < ActiveRecord::Migration[5.2]
  change_column :events, :date, :string

  def change
  end
end
