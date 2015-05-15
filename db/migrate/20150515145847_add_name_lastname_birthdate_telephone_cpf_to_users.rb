class AddNameLastnameBirthdateTelephoneCpfToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :telephone, :string
    add_column :users, :cpf, :string
    add_column :users, :date_of_birth, :datetime
    add_index :users, :cpf, unique: true
  end
end
