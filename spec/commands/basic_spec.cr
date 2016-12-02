require "../spec_helper"

describe "Basic Operations" do
  path = "tmp/db_basic"

  it "open, put, get, delete, close" do
    db = RocksDB::DB.new(path)
    db.put("key", "v1")
    db.get("key").should eq("v1")
    db.delete("key")
    db.get("key").should eq("")
    db.delete("key") # success to delete non-exist key
    db.close
  end
  it "#rocksdb_open" do
  end
  it "#rocksdb_get" do
  end
  it "#rocksdb_put" do
  end
  it "#rocksdb_delete" do
  end
  it "#rocksdb_close" do
  end
end
