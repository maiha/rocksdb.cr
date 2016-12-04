require "./spec_helper"

describe RocksDB::DB do
  path = "tmp/db_readonly"
  invalid_path = "tmp/xxx"

  it "(setup)" do
    db = RocksDB::DB.new(path)
    db.put("key", "1")
    db.close
  end

  describe ".new(readonly: true)" do
    it "can read data" do
      db = RocksDB::DB.new(path, readonly: true)
      db.get("key").should eq("1")
      db.keys.should eq(["key"])
      db.close
    end
  
    it "can't write data" do
      db = RocksDB::DB.new(path, readonly: true)
      expect_raises(RocksDB::Error, /Not supported operation in read only mode/) do
        db.put("key", "10")
      end
      db.close
    end
  
    it "can't open when file not found" do
      expect_raises(RocksDB::Error, /No such file or directory/) do
        RocksDB::DB.new(invalid_path, readonly: true)
      end
    end
  end

  describe "read" do
    it "can read data" do
      db = RocksDB::DB.read(path)
      db.get("key").should eq("1")
      db.keys.should eq(["key"])
      db.close
    end
  
    it "can't write data" do
      db = RocksDB::DB.read(path)
      expect_raises(RocksDB::Error, /Not supported operation in read only mode/) do
        db.put("key", "10")
      end
      db.close
    end
  
    it "can't open when file not found" do
      expect_raises(RocksDB::Error, /No such file or directory/) do
        RocksDB::DB.read(invalid_path)
      end
    end
  end

  it "#rocksdb_open_for_read_only" do; end
end
