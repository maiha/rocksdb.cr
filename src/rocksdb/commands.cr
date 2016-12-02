require "./commands/*"

module RocksDB::Commands
  # Define all commands explicitly for the purpose of
  # 1. automatically generate `API.md` which shows supported api
  # 2. show pretty messages rather than ugly macro code when method missing

  # A macro to call normal functions of rocksdb
  macro normal(name)
    def {{name.id}}(*args)
      LibRocksDB.{{name.id}}(*args)
    end
  end

  # A macro to call status functions of rocksdb
  macro status(name)
    def {{name.id}}(*args)
      LibRocksDB.{{name.id}}(*args, @err).tap {
        raise "ERR: {{name}} #{String.new(@err.value)}" if !@err.value.null?
      }
    end
  end

  ### Basic

  status rocksdb_open
  normal rocksdb_close
  status rocksdb_get
  status rocksdb_put
  status rocksdb_delete
end
