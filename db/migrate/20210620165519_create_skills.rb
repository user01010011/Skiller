class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.string :skill_type
      t.string :skill_description

      t.timestamps
    end
  end
end
