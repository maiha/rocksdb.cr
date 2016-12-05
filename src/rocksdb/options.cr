option_class Options do
  def self.default
    new.set_create_if_missing(1).set_keep_log_file_num(5)
  end

  option set_create_if_missing
  option set_keep_log_file_num
  option increase_parallelism
#  option optimize_for_point_lookup(opt : RocksdbOptionsT, block_cache_size_mb : Uint64T)
#  option optimize_level_style_compaction(opt : RocksdbOptionsT, memtable_memory_budget : Uint64T)
#  option optimize_universal_style_compaction(opt : RocksdbOptionsT, memtable_memory_budget : Uint64T)
#  option set_compaction_filter(x0 : RocksdbOptionsT, x1 : RocksdbCompactionfilterT)
#  option set_compaction_filter_factory(x0 : RocksdbOptionsT, x1 : RocksdbCompactionfilterfactoryT)
#  option set_comparator(x0 : RocksdbOptionsT, x1 : RocksdbComparatorT)
#  option set_merge_operator(x0 : RocksdbOptionsT, x1 : RocksdbMergeoperatorT)
#  option set_uint64add_merge_operator(x0 : RocksdbOptionsT)
#  option set_compression_per_level(opt : RocksdbOptionsT, level_values : LibC::Int*, num_levels : LibC::SizeT)
  option set_create_if_missing
  option set_create_missing_column_families
  option set_error_if_exists
  option set_paranoid_checks
#  option set_env(x0 : RocksdbOptionsT, x1 : RocksdbEnvT)
#  option set_info_log(x0 : RocksdbOptionsT, x1 : RocksdbLoggerT)
  option set_info_log_level
  option set_write_buffer_size
  option set_max_open_files
  option set_max_total_wal_size
#  option set_compression_options(x0 : RocksdbOptionsT, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Int)
#  option set_prefix_extractor(x0 : RocksdbOptionsT, x1 : RocksdbSlicetransformT)
  option set_num_levels
  option set_level0_file_num_compaction_trigger
  option set_level0_slowdown_writes_trigger
  option set_level0_stop_writes_trigge
  option set_max_mem_compaction_level
  option set_target_file_size_base
  option set_target_file_size_multiplier
  option set_max_bytes_for_level_base
  option set_max_bytes_for_level_multiplier
  option set_expanded_compaction_factor
  option set_max_grandparent_overlap_factor
#  option set_max_bytes_for_level_multiplier_additional(x0 : RocksdbOptionsT, level_values : LibC::Int*, num_levels : LibC::SizeT)
#  option enable_statistics(x0 : RocksdbOptionsT)
#  option statistics_get_string(opt : RocksdbOptionsT) : LibC::Char*
  option set_max_write_buffer_number
  option set_min_write_buffer_number_to_merge
  option set_max_write_buffer_number_to_maintain
  option set_max_background_compactions
  option set_max_background_flushes
  option set_max_log_file_size
  option set_log_file_time_to_roll
  option set_keep_log_file_num
  option set_soft_rate_limit
  option set_hard_rate_limit
  option set_rate_limit_delay_max_milliseconds
  option set_max_manifest_file_size
  option set_table_cache_numshardbits
  option set_table_cache_remove_scan_count_limit
  option set_arena_block_size
  option set_use_fsync
#  option set_db_log_dir(x0 : RocksdbOptionsT, x1 : LibC::Char*)
#  option set_wal_dir(x0 : RocksdbOptionsT, x1 : LibC::Char*)
#  option set_wal_ttl_seconds = rocksdb_options_set_WAL_ttl_seconds(x0 : RocksdbOptionsT, x1 : Uint64T)
#  option set_wal_size_limit_mb = rocksdb_options_set_WAL_size_limit_MB(x0 : RocksdbOptionsT, x1 : Uint64T)
  option set_manifest_preallocation_size
  option set_purge_redundant_kvs_while_flush
  option set_allow_os_buffer
  option set_allow_mmap_reads
  option set_allow_mmap_writes
  option set_is_fd_close_on_exec
  option set_skip_log_error_on_recovery
  option set_stats_dump_period_sec
  option set_advise_random_on_open
  option set_access_hint_on_compaction_start
  option set_use_adaptive_mutex
  option set_bytes_per_sync
  option set_verify_checksums_in_compaction
  option set_filter_deletes
  option set_max_sequential_skip_in_iterations
  option set_disable_data_sync
  option set_disable_auto_compactions
  option set_delete_obsolete_files_period_micros
  option set_source_compaction_factor
#  option prepare_for_bulk_load(x0 : RocksdbOptionsT)
#  option set_memtable_vector_rep(x0 : RocksdbOptionsT)
  option set_hash_skip_list_rep
  option set_hash_link_list_rep
  option set_plain_table_factory
  option set_min_level_to_compress
  option set_memtable_prefix_bloom_bits
  option set_memtable_prefix_bloom_probes
  option set_max_successive_merges
  option set_min_partial_merge_operands
  option set_bloom_locality
  option set_inplace_update_support
  option set_inplace_update_num_locks
end

option_class ReadOptions do
  option set_verify_checksums
  option set_fill_cache
#  option set_snapshot(x0 : RocksdbReadoptionsT, x1 : RocksdbSnapshotT)
#  option set_iterate_upper_bound(x0 : RocksdbReadoptionsT, key : LibC::Char*, keylen : LibC::SizeT)
  option set_read_tier
  option set_tailing
end

option_class WriteOptions do
  option set_sync
  option disable_wal
end
