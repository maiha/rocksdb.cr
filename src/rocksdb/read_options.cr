class RocksDB::ReadOptions
  include Value(LibRocksDB::RocksdbReadoptionsT)

  def initialize
    @raw = LibRocksDB.rocksdb_readoptions_create
    @opened = true
  end

  protected def free
    LibRocksDB.rocksdb_readoptions_destroy(@raw)
  end
end
