module RocksDB
  class Error < Exception
  end

  class NotFound < Error
    getter key
    def initialize(@key : String)
      super("Not Found: '#{@key}'")
    end
  end
end

module RocksDB::Value(T)
  @opened : Bool

  @raw : T?

  @[AlwaysInline]
  def raw : T
    raise Error.new("RocksDB(#{clue}) is closed.") if closed?
    @raw.not_nil!
  end
  
  def opened?
    @opened
  end

  def closed?
    !@opened
  end

  def close
    if opened?
      free
      @opened = false
    end
  end

  protected abstract def free : Nil
  protected abstract def clue : String
end
