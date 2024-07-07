class AddCreatorToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :creator, :string
  end
end
