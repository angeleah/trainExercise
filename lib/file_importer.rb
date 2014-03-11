require 'csv'
require 'db/schema'
require 'models/train'
require 'pry'

class FileImporter

  def initialize(file)
    @file = file
  end

  def import
   CSV.foreach(@file, { :headers => true } ) do |row|
      Train.find_or_create_by!(
        line: row[0].strip,
        route: row[1].strip,
        run_number: row[2].strip,
        operator: row[3].strip,
      )
    end
  end
end
