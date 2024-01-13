class RocksDB::WriteBatch
  include Api
  include RawMemory(LibRocksDB::RocksdbWritebatchT)

  def initialize()
    @raw = rocksdb_writebatch_create
    @opened = true
  end

  def delete_range(begin_key : Bytes, end_key : Bytes)
    rocksdb_writebatch_delete_range(raw, begin_key, end_key)
  end

  def count : Int32
    rocksdb_writebatch_count(raw)
  end

  def clear
    rocksdb_writebatch_clear(raw)
  end

  protected def free : Nil
    rocksdb_writebatch_destroy(raw)
  end

  protected def clue : String
    "writebatch"
  end

end
