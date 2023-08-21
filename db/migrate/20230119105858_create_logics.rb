# frozen_string_literal: true

class CreateLogics < ActiveRecord::Migration[7.0]
  def change
    create_table :logics do |t|
      t.json :numbers
      t.json :result

      t.timestamps
    end
  end
end
