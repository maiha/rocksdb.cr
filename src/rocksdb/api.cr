module RocksDB::Api
  # Define all commands explicitly for the purpose of
  # 1. automatically generate `API.md` which shows supported api
  # 2. show pretty messages rather than ugly macro code when method missing

  # A macro for standard rocksdb functions
  private macro api(name)
    def {{name.id}}(*args)
      LibRocksDB.{{name.id}}(*args)
    end
  end

  # A macro for failurable rocksdb functions
  private macro try(name)
    def {{name.id}}(*args)
      LibRocksDB.{{name.id}}(*args, @err).tap {
        raise RocksDB::Error.new("ERR: {{name}} #{String.new(@err.value)}") if !@err.value.null?
      }
    end
  end

  # ## Basic

  try rocksdb_open
  try rocksdb_open_for_read_only
  api rocksdb_close
  try rocksdb_get
  try rocksdb_put
  try rocksdb_delete
  api rocksdb_free
  try rocksdb_flush

  # ## Iteration

  api rocksdb_create_iterator
  api rocksdb_iter_destroy
  api rocksdb_iter_seek_to_first
  api rocksdb_iter_seek_to_last
  api rocksdb_iter_prev
  api rocksdb_iter_next
  api rocksdb_iter_seek
  api rocksdb_iter_key
  api rocksdb_iter_value
  api rocksdb_iter_valid

  #  fun rocksdb_iter_seek(x0 : RocksdbIteratorT, k : LibC::Char*, klen : LibC::SizeT)
  #  fun rocksdb_iter_get_error(x0 : RocksdbIteratorT, errptr : LibC::Char**)

  # ## Options

  api rocksdb_options_create
  api rocksdb_options_destroy
  api rocksdb_readoptions_create
  api rocksdb_readoptions_destroy
  api rocksdb_writeoptions_create
  api rocksdb_writeoptions_destroy
  api rocksdb_flushoptions_create
  api rocksdb_flushoptions_destroy
  api rocksdb_flushoptions_set_wait
  # see `options.cr` for more option commands
end
