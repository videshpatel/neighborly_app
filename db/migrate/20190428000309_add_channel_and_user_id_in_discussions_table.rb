class AddChannelAndUserIdInDiscussionsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :user_id, :integer
    add_column :discussions, :channel_id, :integer

  end
end
