class AddColorToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :color, :string
  end
end
