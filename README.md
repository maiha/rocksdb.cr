# rocksdb.cr [![Build Status](https://travis-ci.org/maiha/rocksdb.cr.svg?branch=master)](https://travis-ci.org/maiha/rocksdb.cr)

RocksDB client for [Crystal](http://crystal-lang.org/).

- crystal: `0.27.2` .. `1.5.0`

## Supported API

See [API](./API.md)


## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  rocksdb:
    github: maiha/rocksdb.cr
    version: 1.1.0
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

db.close
```

### readonly mode

```crystal
db = RocksDB::DB.new("tmp/db1", readonly: true)
# or RocksDB::DB.read("tmp/db1")
db.put("foo", "1")  # raise RocksDB::Error("Not supported operation in read only mode.")
```

### Iterations

```crystal
3.times{|i| db.put("k#{i}", i) }
db.keys            # => ["k0","k1","k2"]
db.keys(2)         # => ["k0","k1"]

db.each do |k,v|
  ...
```

### Iterator

```crystal
iter = db.new_iterator
iter.key           # => "k0"
iter.next
iter.value         # => "1"
iter.first
iter.key           # => "k0"
iter.seek("k2")
iter.next
iter.valid?        # => false

iter.close  # memory leaks when you forget this
```

- same as `each`

```crystal
iter = db.new_iterator
iter.first
while (iter.valid?)
  # yield {iter.key, iter.value}
  iter.next
end  
iter.close  # memory leaks when you forget this
```

### binary data

Although all data are stored as Binary in RocksDB,
return value will be converted to String when accessed by String key.

```crystal
db.put(Bytes[0], Bytes[9])
db.get(Bytes[0])  # => Bytes[9]
db.get("\u{0}")   # => "\t"
```

#### binary iterator

`binary_XXX` is available to treat data as binary

- `binary_keys`
- `binary_each`
- `new_binary_iterator`

```crystal
db.keys        # => ["\t"]
db.binary_keys # => [Bytes[9]]
```

### database options

- `options`  for opening database
- `read_options`  for reading data
- `write_options`  for writing data

```crystal
opts = RocksDB::Options.new
opts.set_create_if_missing(1)

ropts = RocksDB::ReadOptions.new
ropts.set_verify_checksum(1)

wopts = RocksDB::WriteOptions.new
wopts.set_sync(1)
wopts.disable_wal(1)

db = RocksDB::DB.new("tmp/db1", options: opts, read_options: ropts, write_options: wopts)
```

- all options: [options.cr](./src/rocksdb/options.cr)

## Roadmap

#### 0.5.0

- [x] Iterations for Binary

## Testing

- Now Travis CI is ready by https://github.com/maiha/rocksdb.cr/pull/3

## Contributing

1. Fork it ( https://github.com/maiha/rocksdb.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) maiha - creator, maintainer
