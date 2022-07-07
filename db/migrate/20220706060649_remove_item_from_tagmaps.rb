class RemoveItemFromTagmaps < ActiveRecord::Migration[6.1]
  def change
    remove_reference :tagmaps, :item, null: false, foreign_key: true
  end
end
