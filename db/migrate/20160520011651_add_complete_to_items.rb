class AddCompleteToItems < ActiveRecord::Migration
  def change
    add_column :items, :complete, :boolean, default: false
    add_column :items, :expire_at, :datetime
  end
end
