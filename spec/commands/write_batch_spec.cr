require "../spec_helper"

describe "WriteBatch" do
  path = "tmp/db_write_batch"

  describe "#delete_range" do
      it "deletes range" do
        db = RocksDB::DB.new(path)

        db.put(Bytes[0, 0], Bytes[9])
        db.put(Bytes[0, 1], Bytes[9])
        db.put(Bytes[0, 2], Bytes[9])

        batch = RocksDB::WriteBatch.new

        key_prefix_start = Bytes[0, 0, 0, 0]
        key_prefix_end = Bytes[255, 255, 255, 255]

        batch.delete_range(key_prefix_start, key_prefix_end)

        # Commit operation to database
        db.write(batch, db.w_opts).should eq nil

        db.get(Bytes[0, 0]).should eq(Bytes.new(0))
        db.get(Bytes[0, 1]).should eq(Bytes.new(0))
        db.get(Bytes[0, 2]).should eq(Bytes.new(0))
      end
  end

  describe "#count" do
      it "counts length" do
        batch = RocksDB::WriteBatch.new

        batch.count.should eq 0
      end
  end

  describe "#clear" do
      it "clears batch" do
        batch = RocksDB::WriteBatch.new

        key_prefix_start = Bytes[0, 0, 0, 0]
        key_prefix_end = Bytes[255, 255, 255, 255]

        batch.delete_range(key_prefix_start, key_prefix_end)

        batch.clear
        batch.count.should eq 0
      end
  end

end
