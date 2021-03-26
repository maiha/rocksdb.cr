macro option_class(klass)
  {% underly = "LibRocksDB::Rocksdb" + klass.stringify.capitalize + "T" %}
  {% method  = klass.stringify.downcase %}
  class RocksDB::{{ klass.id }}
    include Api
    include RawMemory({{ underly.id }})

    def initialize
      @raw = rocksdb_{{ method.id }}_create
      @opened = true
    end

    protected def free : Nil
      rocksdb_{{ method.id }}_destroy(raw)
    end

    protected def clue : String
      {{ klass.stringify }}
    end

    macro option(name)
      \{% prefix = @type.name.downcase.gsub(/::/,"_") %}
      def \{{name.id}}(*args)
        (LibRocksDB.\{{prefix}}_\{{name.id}}(raw, *args); self)
      end
    end

    {{ yield }}
  end
end
