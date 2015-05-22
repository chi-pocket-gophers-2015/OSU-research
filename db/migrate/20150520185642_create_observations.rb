class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.belongs_to :experiment
      t.text :body

      t.timestamps
    end
  end
end
