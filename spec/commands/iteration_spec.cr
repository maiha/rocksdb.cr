require "../spec_helper"

describe "Iterations" do
  path = "tmp/db_iteration"

  it "(setup)" do
    db = RocksDB::DB.new(path)
    3.times{|i| db.put("k#{i}", i) }
    db.close
  end
  
  it "#keys" do
    db = RocksDB::DB.new(path)
    db.keys.should eq(%w( k0 k1 k2 ))
    db.close
  end

  it "#keys(limit)" do
    db = RocksDB::DB.new(path)
    db.keys(2).should eq(%w( k0 k1 ))
    db.close
  end

  it "#binary_keys" do
    db = RocksDB::DB.new(path)
    db.binary_keys.should eq([Bytes[107, 48], Bytes[107, 49], Bytes[107, 50]])
    db.close
  end

  it "#binary_keys(limit)" do
    db = RocksDB::DB.new(path)
    db.binary_keys(2).should eq([Bytes[107, 48], Bytes[107, 49]])
    db.close
  end

  it "#each" do
    db = RocksDB::DB.new(path)
    items = [] of Tuple(String, String)
    db.each do |k,v|
      items << {k, v}
    end
    items.should eq([{"k0", "0"}, {"k1", "1"}, {"k2", "2"}])
    db.close
  end

  it "#binary_each" do
    db = RocksDB::DB.new(path)
    items = [] of Tuple(Bytes, Bytes)
    db.binary_each do |k,v|
      items << {k, v}
    end
    items.should eq([{Bytes[107, 48], Bytes[48]}, {Bytes[107, 49], Bytes[49]}, {Bytes[107, 50], Bytes[50]}])
    db.close
  end

  it "#new_iterator" do
    db = RocksDB::DB.new(path)
    iter = db.new_iterator
    iter.should be_a(RocksDB::StringIterator)
    iter.close
    db.close
  end

  it "#new_binary_iterator" do
    db = RocksDB::DB.new(path)
    iter = db.new_binary_iterator
    iter.should be_a(RocksDB::BinaryIterator)
    iter.close
    db.close
  end
end
