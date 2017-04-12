require_relative('../db/sql_runner')

class Transaction
  attr_reader :id, :item_name, :retailer_id, :tag_id

  def initialize(params)
    @item_name = params['item_name']
    @tag_id = params['tag_id'].to_i
    @retailer_id = params['retailer_id'].to_i
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions(item_name, tag_id, retailer_id) VALUES ('#{@item_name}', #{@tag_id}, #{@retailer_id}) RETURNING * "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET (item_name, tag_id, retailer_id) = ('#{@item_name}', #{@tag_id}, #{@retailer_id})"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM transactions WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def retailer()
    sql = "SELECT * FROM retailers WHERE id = #{@retailer_id}"
    result = Retailer.map_items(sql)
    return result.first().retailer_name
  end

  def tag()
    sql = "SELECT * FROM tags WHERE id = #{@tag_id}"
    result = Tag.map_items(sql)
    return result.first().tag_name
  end

  #Class Methods
  def self.all()
    sql = "SELECT * FROM transactions"
    Transaction.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    result = SqlRunner.run(sql)
    transactions = result.map{|transaction| Transaction.new(transaction)}
    return transactions
  end
end
