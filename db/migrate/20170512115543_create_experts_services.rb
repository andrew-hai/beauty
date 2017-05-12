class CreateExpertsServices < ActiveRecord::Migration[5.0]
  def change
    create_table :experts_services do |t|
      t.references :expert, index: true
      t.references :service, index: true
    end
  end
end
