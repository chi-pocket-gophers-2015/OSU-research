class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.belongs_to :experiment
      t.string :body

      t.timestamps
    end
  end
end
