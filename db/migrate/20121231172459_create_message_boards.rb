class CreateMessageBoards < ActiveRecord::Migration
  def change
    create_table :message_boards do |t|
      t.string :name

      t.timestamps
    end
  end
end
