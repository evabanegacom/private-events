class CreateEventsusers < ActiveRecord::Migration[5.2]
  def change
    create_table :eventsusers do |t|

      t.timestamps
    end
  end
end
