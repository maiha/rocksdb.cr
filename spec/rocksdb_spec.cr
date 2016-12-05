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

    opts = RocksDB::Options.new
    opts.set_create_if_missing(1)

    ropts = RocksDB::ReadOptions.new
    ropts.set_verify_checksums(1)

    wopts = RocksDB::WriteOptions.new
    wopts.set_sync(1)
    wopts.disable_wal(1)

    db = RocksDB::DB.new("tmp/db1", options: opts, read_options: ropts, write_options: wopts)
    db.close
  end
  it "#rocksdb_options_set_create_if_missing" do; end
  it "#rocksdb_readoptions_set_verify_checksums" do; end
  it "#rocksdb_writeoptions_set_sync" do; end
  it "#rocksdb_writeoptions_disable_wal" do; end

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
