class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true
      t.datetime :served_at

      t.timestamps null: true

    end
  end
end
