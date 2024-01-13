require "../spec_helper"

describe "Basic Operations" do
  path = "tmp/db_basic"

  describe "(string data)" do
    it "open, put, get, delete, close" do
      db = RocksDB::DB.new(path)
      db.put("key", "v1")
      db.get("key").should eq("v1")
      db.delete("key")
      db.get("key").should eq("")
      db.delete("key") # success to delete non-exist key
      db.close
    end
  end

  describe "(binary data)" do
    it "open, put, get, delete, close" do
      db = RocksDB::DB.new(path)
      db.put(Bytes[0], Bytes[9])
      db.get(Bytes[0]).should eq(Bytes[9])
      db.get("\u{0}").should eq("\t")

      db.delete(Bytes[0])
      db.get(Bytes[0]).should eq(Bytes.new(0))
      db.delete(Bytes[0]) # success to delete non-exist key
      db.close
    end
  end

  describe "#flush" do
    it "flushes data to disk" do
      db = RocksDB::DB.new(path)
      db.put(Bytes[0], Bytes[9])
      flush_options = RocksDB::FlushOptions.new
      flush_options.set_wait(1)
      db.flush flush_options
      db.close

      db = RocksDB::DB.new(path)
      db.get(Bytes[0]).should eq(Bytes[9])
      db.close
    end
  end

  describe "#write" do
      it "writes with writeoptions" do
        batch = RocksDB::WriteBatch.new

        wopts = RocksDB::WriteOptions.new
        wopts.disable_wal(1)

        db = RocksDB::DB.new(path)
        db.write(batch, wopts).should eq nil
      end
  end

  # mark for api document
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
