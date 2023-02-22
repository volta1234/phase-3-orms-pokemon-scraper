class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def save
  sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
  SQL

  db.execute(sql, name, type)
end

def self.find(id, db)
  sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
  SQL

  result = db.execute(sql, id).flatten
  Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
end


end

