class AddBookToTagmaps < ActiveRecord::Migration[6.1]
  def change
    add_reference :tagmaps, :book, null: false, foreign_key: true
  end
end
