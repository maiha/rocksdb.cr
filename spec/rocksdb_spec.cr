require "./spec_helper"

describe RocksDB do
  path = "tmp/db_readme"

  it "Example codes" do
    db = RocksDB::DB.new(path)
    db.put("key", "v1")
    db.get("key").should eq("v1")
    db.delete("key")
    db.get("key").should eq("")
    db.delete("key") # success to delete non-exist key
    db.close
  end

  it "Persistence" do
    db = RocksDB::DB.new(path)
    db.put("key", "v2")
    db.close

    db = RocksDB::DB.new(path)
    db.get("key").should eq("v2")
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
