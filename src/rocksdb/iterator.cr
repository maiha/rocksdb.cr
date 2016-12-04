abstract class RocksDB::Iterator(T)
  include Api
  include RawMemory(LibRocksDB::RocksdbIteratorT)
  
  protected abstract def zero : T
  protected abstract def underly(ptr, size) : T

  @read_options : ReadOptions

  def initialize(@db : DB, read_options : ReadOptions? = nil)
    @read_options = (read_options || @db.read_options).not_nil!
    @raw = rocksdb_create_iterator(@db.raw, @read_options.raw)
    @len = Pointer(UInt64).malloc(1_u64)
    @opened = true
  end

  def first!
    rocksdb_iter_seek_to_first(raw)
  end
  
  def last!
    rocksdb_iter_seek_to_last(raw)
  end

  def next!
    rocksdb_iter_next(raw)
  end
  
  def prev!
    rocksdb_iter_prev(raw)
  end
  
  def valid?
    rocksdb_iter_valid(raw) == 1
  end

  def key
    ptr = rocksdb_iter_key(raw, @len)
    underly(ptr, @len.value)
  end

  def value
    ptr = rocksdb_iter_value(raw, @len)
    underly(ptr, @len.value)
  end

  def key?
    return nil if !valid?
    ptr = rocksdb_iter_key(raw, @len)
    @len.value == 0 ? nil : underly(ptr, @len.value)
  end

  def key
    key? || zero
  end

  protected def free
    rocksdb_iter_destroy(raw)
  end

  protected def clue
    "iter"
  end

#  fun rocksdb_iter_valid(x0 : RocksdbIteratorT) : UInt8
#  fun rocksdb_iter_seek(x0 : RocksdbIteratorT, k : LibC::Char*, klen : LibC::SizeT)
#  fun rocksdb_iter_value(x0 : RocksdbIteratorT, vlen : LibC::SizeT*) : LibC::Char*
#  fun rocksdb_iter_get_error(x0 : RocksdbIteratorT, errptr : LibC::Char**)

end

module RocksDB
  class StringIterator < Iterator(String)
    protected def zero
      ""
    end

    protected def underly(ptr, size) : String
      String.new(ptr, size)
    end
  end
end
