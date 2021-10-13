class AddTempeeatureToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :temp, :float
  end
end
