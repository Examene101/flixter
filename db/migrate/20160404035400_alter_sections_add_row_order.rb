class AlterSectionsAddRowOrder < ActiveRecord::Migration
  def change
  	# add column to keep track of section order
  	add_column :sections, :row_order, :integer
  	# add index to sort database
  	add_index :sections, :row_order

  end
end
