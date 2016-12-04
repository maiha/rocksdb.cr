class RocksDB::DB
  include RawMemory(LibRocksDB::RocksdbT)
  include Commands

  alias Closable = Options | ReadOptions | WriteOptions

  @options       : Options
  @read_options  : ReadOptions
  @write_options : WriteOptions

  getter! read_options
  getter! write_options

  def initialize(@path : String, options : Options? = nil, read_options : ReadOptions? = nil, write_options : WriteOptions? = nil)
    @closables = [] of Closable

    @options       = options       || mark_closable(Options.new.set_create_if_missing(1))
    @read_options  = read_options  || mark_closable(ReadOptions.new)
    @write_options = write_options || mark_closable(WriteOptions.new)

    @len = Pointer(UInt64).malloc(1_u64)
    @err = Pointer(Pointer(UInt8)).malloc(1_u64)
    @raw = rocksdb_open(@options.raw, @path)
    @opened = true
  end

  protected def free
    @closables.each(&.close)
    @closables.clear
    rocksdb_close(@raw.not_nil!)
  end

  protected def clue
    @path
  end

  protected def mark_closable(value)
    @closables << value
    value
  end
end
