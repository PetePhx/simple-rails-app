class AddSkilltoCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :skill, :string
  end
end