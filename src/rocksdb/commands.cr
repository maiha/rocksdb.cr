module RocksDB::Commands
  def get?(key : String) : String?
    ptr = rocksdb_get(db, @read_options.raw, key, key.bytesize, @len)
    @len.value == 0 ? nil : String.new(ptr)
  end

  def get(key : String) : String
    get?(key) || ""
  end

  def get!(key : String) : String
    get?(key) || raise NotFound.new(key)
  end

  def []?(key : String) : String?
    get?(key)
  end
  
  def [](key : String) : String
    get(key)
  end
  
  def put(key : String, value : String)
    rocksdb_put(db, @write_options.raw, key, key.bytesize, value, value.bytesize)
  end

  def []=(key : String, value : String)
    put(key, value)
  end
end
