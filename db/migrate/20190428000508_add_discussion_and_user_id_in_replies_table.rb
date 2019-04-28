class AddDiscussionAndUserIdInRepliesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :discussion_id, :integer
    add_column :replies, :user_id, :integer
  end
end
