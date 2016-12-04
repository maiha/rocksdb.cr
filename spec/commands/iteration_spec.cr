require "../spec_helper"

describe "Iterations" do
  path = "tmp/db_iter"

  it "(setup)" do
    db = RocksDB::DB.new(path)
    5.times{|i| db.put("k#{i}", i) }
    db.close
  end
  
  it "#keys" do
    db = RocksDB::DB.new(path)
    db.keys.should eq(%w( k0 k1 k2 k3 k4 ))
    db.close
  end

  it "#keys(limit)" do
    db = RocksDB::DB.new(path)
    db.keys(2).should eq(%w( k0 k1 ))
    db.close
  end

  it "#each" do
    db = RocksDB::DB.new(path)
    items = [] of Tuple(String, String)
    db.each do |k,v|
      items << {k, v}
    end
    items.should eq([{"k0", "0"}, {"k1", "1"}, {"k2", "2"}, {"k3", "3"}, {"k4", "4"}])
    db.close
  end
end
