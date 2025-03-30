class AddViewsToImages < ActiveRecord::Migration[7.2]
  def change
    add_column :images, :views, :integer, default: 0, null: false
  end
end
