require "./spec_helper"

describe "Iterator" do
  path = "tmp/db_iteration"

  it "work" do
    db = RocksDB::DB.new(path)
    3.times{|i| db.put("k#{i}", i) }
    iter = RocksDB::Iterator.new(db)

    iter.valid?.should be_false
    
    iter.first
    iter.valid?.should be_true
    iter.key.should eq("k0")
    iter.value.should eq("0")

    iter.next
    iter.key.should eq("k1")
    iter.value.should eq("1")

    iter.next
    iter.key.should eq("k2")
    iter.value.should eq("2")

    iter.prev
    iter.key.should eq("k1")
    iter.value.should eq("1")

    iter.first
    iter.key.should eq("k0")
    iter.value.should eq("0")

    iter.last
    iter.key.should eq("k2")
    iter.value.should eq("2")

    iter.next
    iter.valid?.should be_false

    iter.seek("k1")
    iter.valid?.should be_true
    iter.key.should eq("k1")

    iter.seek("xx")
    iter.valid?.should be_false
    
    db.close
  end

  it "#rocksdb_create_iterator" do ; end
  it "#rocksdb_iter_destroy" do ; end
  it "#rocksdb_iter_seek_to_first" do ; end
  it "#rocksdb_iter_seek_to_last" do ; end
  it "#rocksdb_iter_seek" do; end
  it "#rocksdb_iter_prev" do; end
  it "#rocksdb_iter_next" do; end
  it "#rocksdb_iter_key" do; end
  it "#rocksdb_iter_value" do ; end
  it "#rocksdb_iter_valid" do ; end
end
