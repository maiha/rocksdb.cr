class RocksDB::DB
  include RawMemory(LibRocksDB::RocksdbT)
  include Commands

  alias Closable = Options | ReadOptions | WriteOptions

  @d_opts : Options
  @r_opts : ReadOptions
  @w_opts : WriteOptions

  getter! r_opts
  getter! w_opts

  def self.read(path : String, options : Options? = nil, error_if_log_file_exist : Bool = false, read_options : ReadOptions? = nil)
    new(path, options: options, read_options: read_options, readonly: true, error_if_log_file_exist: error_if_log_file_exist)
  end

  def initialize(@path : String, options : Options? = nil, read_options : ReadOptions? = nil, write_options : WriteOptions? = nil, readonly : Bool = false, error_if_log_file_exist : Bool = false)
    @closables = [] of Closable

    @d_opts = options       || mark_closable(Options.default)
    @r_opts = read_options  || mark_closable(ReadOptions.new)
    @w_opts = write_options || mark_closable(WriteOptions.new)

    @len = Pointer(UInt64).malloc(1_u64)
    @err = Pointer(Pointer(UInt8)).malloc(1_u64)
    if readonly
      flag = error_if_log_file_exist ? 1_u8 : 0_u8
      @raw = rocksdb_open_for_read_only(@d_opts.raw, @path, flag)
    else
      @raw = rocksdb_open(@d_opts.raw, @path)
    end
    @opened = true
  end

  protected def free : Nil
    @closables.each(&.close)
    @closables.clear
    rocksdb_close(@raw.not_nil!)
  end

  protected def clue : String
    @path
  end

  protected def mark_closable(value)
    @closables << value
    value
  end
end
