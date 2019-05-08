class AddDescColumnInEventsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :desc, :text
  end
end
