module RocksDB::Commands
  include Api
  
  def each(&block)
    iter = Iterator.new(self)
  end

  def keys(limit = Int32::MAX)
    iter = Iterator.new(self)
    iter.first!
    array = [] of String
    i = 0
    while (key = iter.key?)
      i += 1
      break if i > limit
      array << key
      iter.next!
    end
    return array
  ensure
    iter.try(&.close)
  end
end
