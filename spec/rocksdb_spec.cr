require "./spec_helper"

describe RocksDB do
  describe "(basic usage)" do
    path = "tmp/db1"

    it "Basic Operations" do
      db = RocksDB::DB.new(path)
      db.put("key", "value")
      db.get("key").should eq("value")
      db.close
    end

    it "Persistence" do
      db = RocksDB::DB.new(path)
      db.get("key").should eq("value")
      db.close
    end

    it "Empty keys" do
      db = RocksDB::DB.new(path)
      db.get("xxx").should eq("")
      db.get?("xxx").should eq(nil)
      expect_raises RocksDB::NotFound, /xxx/ do
        db.get!("xxx")
      end
      db.close
    end      

    it "Empty values" do
      db = RocksDB::DB.new(path)
      db.put("empty", "")
      db.get("empty").should eq("")
      db.get?("empty").should eq(nil)
      expect_raises RocksDB::NotFound, /empty/ do
        db.get!("empty")
      end
      db.close
    end      
  end
end
