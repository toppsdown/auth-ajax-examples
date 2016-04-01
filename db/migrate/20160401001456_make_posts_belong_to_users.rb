class MakePostsBelongToUsers < ActiveRecord::Migration
  def change
    remove_column :posts, :creator

    # I am explicitly using 'creator' rather than User
    # which will require me to explicitly specificy the
    # relationship between the two tables in the models
    add_column :posts, :creator_id, :integer
    add_index :posts, :creator_id
  end
end
