option_class Options do
  def self.default
    new.set_create_if_missing(1).set_keep_log_file_num(5)
  end

  option set_create_if_missing
  option set_keep_log_file_num
end

option_class ReadOptions do
end

option_class WriteOptions do
end
