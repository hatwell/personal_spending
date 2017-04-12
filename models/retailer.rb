require_relative('../db/sql_runner')

class Retailer
  attr_reader :id, :retailer_name

  def initialize(params)
    @retailer_name = params['retailer_name']
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO retailers(retailer_name) VALUES ('#{@retailer_name}') RETURNING * "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE retailers SET (retailer_name) = '#{@retailer_name}'"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM retailers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  #Class Methods
  def self.all()
    sql = "SELECT * FROM retailers"
    Retailer.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM retailers"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    result = SqlRunner.run(sql)
    retailers = result.map{|retailer| Retailer.new(retailer)}
    return retailers
  end
end
