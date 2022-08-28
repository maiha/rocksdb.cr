require "pretty"

require "../src/rocksdb"

def show_usage
  mb = Pretty::MemInfo.process.max.mb
  puts "%.1f MB" % mb
end

def test(db)
  keys = db.keys
  100.times do
    keys.each do |k|
      db.get(k)
    end
  end
  show_usage
end

Pretty.mkdir_p("tmp")
db = RocksDB::DB.new("tmp/free.db")

v = "x" * 1000
100.times do |i|
  k = i.to_s * 1000
  db.put(k, v)
end

show_usage

10.times do
  test(db)
  GC.collect
end

