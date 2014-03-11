require 'db/database_configuration'

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'trains'
    create_table :trains do |table|
    table.column :line, :string
    table.column :route, :string
    table.column :run_number, :string
    table.column :operator, :string
   end
  end
end
