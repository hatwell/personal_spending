require_relative('../db/sql_runner')

class Tag
  attr_reader :id, :tag_name


  def initialize(params)
    @tag_name = params['tag_name']
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO tags(tag_name) VALUES ('#{@tag_name}') RETURNING * "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE tags SET (tag_name) = '#{@tag_name}'"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM tags WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  #Class Methods
  def self.all()
    sql = "SELECT * FROM tags"
    Tag.map_items(sql)
  end

  def self.map_items(sql)
    result = SqlRunner.run(sql)
    tags = result.map{|tag| Tag.new(tag)}
    return tags
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

end
