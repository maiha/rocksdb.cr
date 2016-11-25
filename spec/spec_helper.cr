require "spec"
require "../src/rocksdb"
require "file_utils"

FileUtils.rm_rf("tmp")
FileUtils.mkdir("tmp")
