class EventParticipants < ActiveRecord::Migration
  def change
    create_table :event_participants do |t|
      t.references :event, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
