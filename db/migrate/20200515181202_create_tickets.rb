class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name, null: false, index: true
      t.string :currency, null: false
      t.decimal :amount, :precision => 8, :scale => 2, :null => false
      t.references :event, index: true

      t.timestamps null: false
    end

    add_reference :event_participants, :ticket, index: true
  end
end
