class RocksDB::WriteOptions
  include Value(LibRocksDB::RocksdbWriteoptionsT)

  def initialize
    @raw = LibRocksDB.rocksdb_writeoptions_create
    @opened = true
  end

  protected def free
    LibRocksDB.rocksdb_writeoptions_destroy(@raw)
  end
end
