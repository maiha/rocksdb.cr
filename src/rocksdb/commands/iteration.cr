module RocksDB::Commands
  include Api

  def new_iterator
    StringIterator.new(self)
  end
  
  def new_binary_iterator
    BinaryIterator.new(self)
  end
  
  def each(&block)
    iter = new_iterator
    iter.first
    while iter.valid?
      yield({iter.key, iter.value})
      iter.next
    end
  ensure
    iter.try(&.close)
  end

  def binary_each(&block)
    iter = new_binary_iterator
    iter.first
    while iter.valid?
      yield({iter.key, iter.value})
      iter.next
    end
  ensure
    iter.try(&.close)
  end

  def keys(limit = Int32::MAX)
    iter = new_iterator
    iter.first
    array = [] of String
    i = 0
    while (key = iter.key?)
      i += 1
      break if i > limit
      array << key
      iter.next
    end
    return array
  ensure
    iter.try(&.close)
  end

  def binary_keys(limit = Int32::MAX)
    iter = new_binary_iterator
    iter.first
    array = [] of Bytes
    i = 0
    while (key = iter.key?)
      i += 1
      break if i > limit
      array << key
      iter.next
    end
    return array
  ensure
    iter.try(&.close)
  end
end
