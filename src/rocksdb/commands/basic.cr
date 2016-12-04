module RocksDB::Commands
  include Api
  
  def get?(key : Bytes) : Bytes?
    ptr = rocksdb_get(raw, @read_options.raw, key, key.bytesize, @len)
    @len.value == 0 ? nil : Bytes.new(ptr, @len.value)
  end

  def get?(key : String) : String?
    ptr = rocksdb_get(raw, @read_options.raw, key, key.bytesize, @len)
    @len.value == 0 ? nil : String.new(ptr, @len.value)
  end

  def get(key : Bytes) : Bytes
    get?(key) || Bytes.new(0)
  end

  def get(key : String) : String
    get?(key) || ""
  end

  def get!(key : Bytes) : Bytes
    get?(key) || raise NotFound.new(key)
  end

  def get!(key : String) : String
    get?(key) || raise NotFound.new(key)
  end

  def []?(key)
    get?(key)
  end
  
  def [](key)
    get(key)
  end
  
  def put(key : String, value : String)
    rocksdb_put(raw, @write_options.raw, key, key.bytesize, value, value.bytesize)
  end

  def put(key : Bytes, value : Bytes)
    rocksdb_put(raw, @write_options.raw, key, key.bytesize, value, value.bytesize)
  end

  def put(key : String, value)
    put(key, value.to_s)
  end

  def []=(key, value)
    put(key, value)
  end

  def delete(key : Bytes)
    rocksdb_delete(raw, @write_options.raw, key, key.bytesize)
  end

  def delete(key : String)
    rocksdb_delete(raw, @write_options.raw, key, key.bytesize)
  end
end