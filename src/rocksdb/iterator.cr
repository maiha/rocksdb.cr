abstract class RocksDB::Iterator(T)
  include Api
  include RawMemory(LibRocksDB::RocksdbIteratorT)
  
  protected abstract def zero : T
  protected abstract def underlying(ptr, size) : T

  def initialize(@db : DB, r_opts : ReadOptions? = nil)
    opts = (r_opts || @db.r_opts).not_nil!
    @raw = rocksdb_create_iterator(@db.raw, opts.raw)
    @len = Pointer(UInt64).malloc(1_u64)
    @opened = true
  end

  def first
    rocksdb_iter_seek_to_first(raw)
  end
  
  def last
    rocksdb_iter_seek_to_last(raw)
  end

  def next
    rocksdb_iter_next(raw)
  end

  def prev
    rocksdb_iter_prev(raw)
  end

  def seek(key)
    rocksdb_iter_seek(raw, key, key.bytesize)
  end

  def valid?
    rocksdb_iter_valid(raw) == 1
  end

  def key
    ptr = rocksdb_iter_key(raw, @len)
    underlying(ptr, @len.value)
  end

  def value
    ptr = rocksdb_iter_value(raw, @len)
    underlying(ptr, @len.value)
  end

  def key?
    return nil if !valid?
    ptr = rocksdb_iter_key(raw, @len)
    @len.value == 0 ? nil : underlying(ptr, @len.value)
  end

  protected def free : Nil
    rocksdb_iter_destroy(raw)
  end

  protected def clue : String
    "iter"
  end

#  fun rocksdb_iter_seek(x0 : RocksdbIteratorT, k : LibC::Char*, klen : LibC::SizeT)
#  fun rocksdb_iter_get_error(x0 : RocksdbIteratorT, errptr : LibC::Char**)

end

module RocksDB
  class StringIterator < Iterator(String)
    protected def zero : String
      ""
    end

    protected def underlying(ptr, size) : String
      String.new(ptr, size)
    end
  end

  class BinaryIterator < Iterator(Bytes)
    protected def zero : Bytes
      Bytes.new(0)
    end

    protected def underlying(ptr, size) : Bytes
      Bytes.new(size).tap(&.copy_from(ptr, size))
    end
  end
end
