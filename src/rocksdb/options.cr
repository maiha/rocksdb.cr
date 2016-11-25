class RocksDB::Options
  include Value(LibRocksDB::RocksdbOptionsT)

  def initialize
    @raw = LibRocksDB.rocksdb_options_create
    @opened = true
  end

  protected def free
    LibRocksDB.rocksdb_options_destroy(@raw)
  end

  def create!
    set_create_if_missing(1)
    return self
  end

  macro method_missing(call)
    LibRocksDB.rocksdb_options_{{call.name.id}}(@raw, {{*call.args}})
  end                          
end
