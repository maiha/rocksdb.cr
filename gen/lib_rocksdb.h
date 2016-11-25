@[Include("rocksdb/c.h", prefix: %w(rocksdb_), remove_prefix: false)]
@[Link("rocksdb")]
lib LibRocksDB
end
