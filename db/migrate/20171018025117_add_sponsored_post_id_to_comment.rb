class AddSponsoredPostIdToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :sponsored_post_id, :integer
  end
end
