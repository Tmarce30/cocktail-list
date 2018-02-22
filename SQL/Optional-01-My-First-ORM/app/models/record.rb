# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.
require 'pry-byebug'

class Record
  # TODO: all the code should be here!
  attr_reader :id

  def initialize(attributes = {})
    @id = attributes[:id]
  end

  def save

    DB.execute()
  end

  def self.table_name
    "#{to_s.downcase}s"
  end

  private

  def create
    DB.execute('INSERT INTO {table_name}')
  end

  def update
  end
end
