# rocksdb.cr

RocksDB client for [Crystal](http://crystal-lang.org/).

- crystal: 0.20.0

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  rocksdb:
    github: maiha/rocksdb.cr
```


## Usage


```crystal
require "rocksdb"

db = RocksDB::DB.new("tmp/db1")

db.put("foo", "1")
db.get("foo")      # => "1"

db.get("xxx")      # => ""
db.get?("xxx")     # => nil
db.get!("xxx")     # raise RocksDB::NotFound.new("xxx")

db.close
```

## Roadmap

#### 0.2.0

- [x] `get`, `put`
- [ ] `delete`

## Contributing

1. Fork it ( https://github.com/maiha/rocksdb.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) maiha - creator, maintainer
