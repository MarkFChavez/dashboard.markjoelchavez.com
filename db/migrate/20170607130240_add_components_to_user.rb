class AddComponentsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :components, :string, array: true, default: []
  end
end
