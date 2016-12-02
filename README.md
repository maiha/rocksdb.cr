# rocksdb.cr

RocksDB client for [Crystal](http://crystal-lang.org/).

- crystal: 0.20.0


## Supported API

See [API](https://github.com/maiha/rocksdb.cr/blob/master/API.md)


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
db.delete("foo")

db.get("foo")      # => ""
db.get?("foo")     # => nil
db.get!("foo")     # raise RocksDB::NotFound.new("foo")

db.keys            # => ["k1","k2","k3",...]
db.keys(2)         # => ["k1","k2"]

db.close
```

## Roadmap

#### 0.3.0

- [x] `keys`
- [ ] `each`

## Testing

- Manual test has passed in local with `librocksdb-dev`
- Unfortunately, we can't run ci on TravisCI which doesn't support ubuntu-16.04.

## Contributing

1. Fork it ( https://github.com/maiha/rocksdb.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) maiha - creator, maintainer
