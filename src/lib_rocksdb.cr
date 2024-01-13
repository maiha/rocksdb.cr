@[Link("rocksdb")]
lib LibRocksDB
  fun rocksdb_open(options : RocksdbOptionsT, name : LibC::Char*, errptr : LibC::Char**) : RocksdbT
  type RocksdbOptionsT = Void*
  type RocksdbT = Void*
  fun rocksdb_open_for_read_only(options : RocksdbOptionsT, name : LibC::Char*, error_if_log_file_exist : UInt8, errptr : LibC::Char**) : RocksdbT
  fun rocksdb_backup_engine_open(options : RocksdbOptionsT, path : LibC::Char*, errptr : LibC::Char**) : RocksdbBackupEngineT
  type RocksdbBackupEngineT = Void*
  fun rocksdb_backup_engine_create_new_backup(be : RocksdbBackupEngineT, db : RocksdbT, errptr : LibC::Char**)
  fun rocksdb_restore_options_create : RocksdbRestoreOptionsT
  type RocksdbRestoreOptionsT = Void*
  fun rocksdb_restore_options_destroy(opt : RocksdbRestoreOptionsT)
  fun rocksdb_restore_options_set_keep_log_files(opt : RocksdbRestoreOptionsT, v : LibC::Int)
  fun rocksdb_backup_engine_restore_db_from_latest_backup(be : RocksdbBackupEngineT, db_dir : LibC::Char*, wal_dir : LibC::Char*, restore_options : RocksdbRestoreOptionsT, errptr : LibC::Char**)
  fun rocksdb_backup_engine_get_backup_info(be : RocksdbBackupEngineT) : RocksdbBackupEngineInfoT
  type RocksdbBackupEngineInfoT = Void*
  fun rocksdb_backup_engine_info_count(info : RocksdbBackupEngineInfoT) : LibC::Int
  fun rocksdb_backup_engine_info_timestamp(info : RocksdbBackupEngineInfoT, index : LibC::Int) : Int64T
  alias Int64T = LibC::Long
  fun rocksdb_backup_engine_info_backup_id(info : RocksdbBackupEngineInfoT, index : LibC::Int) : Uint32T
  alias Uint32T = LibC::UInt
  fun rocksdb_backup_engine_info_size(info : RocksdbBackupEngineInfoT, index : LibC::Int) : Uint64T
  alias Uint64T = LibC::ULong
  fun rocksdb_backup_engine_info_number_files(info : RocksdbBackupEngineInfoT, index : LibC::Int) : Uint32T
  fun rocksdb_backup_engine_info_destroy(info : RocksdbBackupEngineInfoT)
  fun rocksdb_backup_engine_close(be : RocksdbBackupEngineT)
  fun rocksdb_open_column_families(options : RocksdbOptionsT, name : LibC::Char*, num_column_families : LibC::Int, column_family_names : LibC::Char**, column_family_options : RocksdbOptionsT*, column_family_handles : RocksdbColumnFamilyHandleT*, errptr : LibC::Char**) : RocksdbT
  type RocksdbColumnFamilyHandleT = Void*
  fun rocksdb_open_for_read_only_column_families(options : RocksdbOptionsT, name : LibC::Char*, num_column_families : LibC::Int, column_family_names : LibC::Char**, column_family_options : RocksdbOptionsT*, column_family_handles : RocksdbColumnFamilyHandleT*, error_if_log_file_exist : UInt8, errptr : LibC::Char**) : RocksdbT
  fun rocksdb_list_column_families(options : RocksdbOptionsT, name : LibC::Char*, lencf : LibC::SizeT*, errptr : LibC::Char**) : LibC::Char**
  fun rocksdb_list_column_families_destroy(list : LibC::Char**, len : LibC::SizeT)
  fun rocksdb_create_column_family(db : RocksdbT, column_family_options : RocksdbOptionsT, column_family_name : LibC::Char*, errptr : LibC::Char**) : RocksdbColumnFamilyHandleT
  fun rocksdb_drop_column_family(db : RocksdbT, handle : RocksdbColumnFamilyHandleT, errptr : LibC::Char**)
  fun rocksdb_column_family_handle_destroy(x0 : RocksdbColumnFamilyHandleT)
  fun rocksdb_close(db : RocksdbT)
  fun rocksdb_put(db : RocksdbT, options : RocksdbWriteoptionsT, key : LibC::Char*, keylen : LibC::SizeT, val : LibC::Char*, vallen : LibC::SizeT, errptr : LibC::Char**)
  type RocksdbWriteoptionsT = Void*
  fun rocksdb_put_cf(db : RocksdbT, options : RocksdbWriteoptionsT, column_family : RocksdbColumnFamilyHandleT, key : LibC::Char*, keylen : LibC::SizeT, val : LibC::Char*, vallen : LibC::SizeT, errptr : LibC::Char**)
  fun rocksdb_delete(db : RocksdbT, options : RocksdbWriteoptionsT, key : LibC::Char*, keylen : LibC::SizeT, errptr : LibC::Char**)
  fun rocksdb_delete_cf(db : RocksdbT, options : RocksdbWriteoptionsT, column_family : RocksdbColumnFamilyHandleT, key : LibC::Char*, keylen : LibC::SizeT, errptr : LibC::Char**)
  fun rocksdb_merge(db : RocksdbT, options : RocksdbWriteoptionsT, key : LibC::Char*, keylen : LibC::SizeT, val : LibC::Char*, vallen : LibC::SizeT, errptr : LibC::Char**)
  fun rocksdb_merge_cf(db : RocksdbT, options : RocksdbWriteoptionsT, column_family : RocksdbColumnFamilyHandleT, key : LibC::Char*, keylen : LibC::SizeT, val : LibC::Char*, vallen : LibC::SizeT, errptr : LibC::Char**)
  fun rocksdb_write(db : RocksdbT, options : RocksdbWriteoptionsT, batch : RocksdbWritebatchT, errptr : LibC::Char**)
  type RocksdbWritebatchT = Void*
  fun rocksdb_get(db : RocksdbT, options : RocksdbReadoptionsT, key : LibC::Char*, keylen : LibC::SizeT, vallen : LibC::SizeT*, errptr : LibC::Char**) : LibC::Char*
  type RocksdbReadoptionsT = Void*
  fun rocksdb_get_cf(db : RocksdbT, options : RocksdbReadoptionsT, column_family : RocksdbColumnFamilyHandleT, key : LibC::Char*, keylen : LibC::SizeT, vallen : LibC::SizeT*, errptr : LibC::Char**) : LibC::Char*
  fun rocksdb_multi_get(db : RocksdbT, options : RocksdbReadoptionsT, num_keys : LibC::SizeT, keys_list : LibC::Char**, keys_list_sizes : LibC::SizeT*, values_list : LibC::Char**, values_list_sizes : LibC::SizeT*, errs : LibC::Char**)
  fun rocksdb_multi_get_cf(db : RocksdbT, options : RocksdbReadoptionsT, column_families : RocksdbColumnFamilyHandleT*, num_keys : LibC::SizeT, keys_list : LibC::Char**, keys_list_sizes : LibC::SizeT*, values_list : LibC::Char**, values_list_sizes : LibC::SizeT*, errs : LibC::Char**)
  fun rocksdb_create_iterator(db : RocksdbT, options : RocksdbReadoptionsT) : RocksdbIteratorT
  type RocksdbIteratorT = Void*
  fun rocksdb_create_iterator_cf(db : RocksdbT, options : RocksdbReadoptionsT, column_family : RocksdbColumnFamilyHandleT) : RocksdbIteratorT
  fun rocksdb_create_snapshot(db : RocksdbT) : RocksdbSnapshotT
  type RocksdbSnapshotT = Void*
  fun rocksdb_release_snapshot(db : RocksdbT, snapshot : RocksdbSnapshotT)
  fun rocksdb_property_value(db : RocksdbT, propname : LibC::Char*) : LibC::Char*
  fun rocksdb_property_value_cf(db : RocksdbT, column_family : RocksdbColumnFamilyHandleT, propname : LibC::Char*) : LibC::Char*
  fun rocksdb_approximate_sizes(db : RocksdbT, num_ranges : LibC::Int, range_start_key : LibC::Char**, range_start_key_len : LibC::SizeT*, range_limit_key : LibC::Char**, range_limit_key_len : LibC::SizeT*, sizes : Uint64T*)
  fun rocksdb_approximate_sizes_cf(db : RocksdbT, column_family : RocksdbColumnFamilyHandleT, num_ranges : LibC::Int, range_start_key : LibC::Char**, range_start_key_len : LibC::SizeT*, range_limit_key : LibC::Char**, range_limit_key_len : LibC::SizeT*, sizes : Uint64T*)
  fun rocksdb_compact_range(db : RocksdbT, start_key : LibC::Char*, start_key_len : LibC::SizeT, limit_key : LibC::Char*, limit_key_len : LibC::SizeT)
  fun rocksdb_compact_range_cf(db : RocksdbT, column_family : RocksdbColumnFamilyHandleT, start_key : LibC::Char*, start_key_len : LibC::SizeT, limit_key : LibC::Char*, limit_key_len : LibC::SizeT)
  fun rocksdb_delete_file(db : RocksdbT, name : LibC::Char*)
  fun rocksdb_livefiles(db : RocksdbT) : RocksdbLivefilesT
  type RocksdbLivefilesT = Void*
  fun rocksdb_flush(db : RocksdbT, options : RocksdbFlushoptionsT, errptr : LibC::Char**)
  type RocksdbFlushoptionsT = Void*
  fun rocksdb_disable_file_deletions(db : RocksdbT, errptr : LibC::Char**)
  fun rocksdb_enable_file_deletions(db : RocksdbT, force : UInt8, errptr : LibC::Char**)
  fun rocksdb_destroy_db(options : RocksdbOptionsT, name : LibC::Char*, errptr : LibC::Char**)
  fun rocksdb_repair_db(options : RocksdbOptionsT, name : LibC::Char*, errptr : LibC::Char**)
  fun rocksdb_iter_destroy(x0 : RocksdbIteratorT)
  fun rocksdb_iter_valid(x0 : RocksdbIteratorT) : UInt8
  fun rocksdb_iter_seek_to_first(x0 : RocksdbIteratorT)
  fun rocksdb_iter_seek_to_last(x0 : RocksdbIteratorT)
  fun rocksdb_iter_seek(x0 : RocksdbIteratorT, k : LibC::Char*, klen : LibC::SizeT)
  fun rocksdb_iter_next(x0 : RocksdbIteratorT)
  fun rocksdb_iter_prev(x0 : RocksdbIteratorT)
  fun rocksdb_iter_key(x0 : RocksdbIteratorT, klen : LibC::SizeT*) : LibC::Char*
  fun rocksdb_iter_value(x0 : RocksdbIteratorT, vlen : LibC::SizeT*) : LibC::Char*
  fun rocksdb_iter_get_error(x0 : RocksdbIteratorT, errptr : LibC::Char**)
  fun rocksdb_writebatch_create : RocksdbWritebatchT
  fun rocksdb_writebatch_create_from(rep : LibC::Char*, size : LibC::SizeT) : RocksdbWritebatchT
  fun rocksdb_writebatch_destroy(x0 : RocksdbWritebatchT)
  fun rocksdb_writebatch_clear(x0 : RocksdbWritebatchT)
  fun rocksdb_writebatch_count(x0 : RocksdbWritebatchT) : LibC::Int
  fun rocksdb_writebatch_put(x0 : RocksdbWritebatchT, key : LibC::Char*, klen : LibC::SizeT, val : LibC::Char*, vlen : LibC::SizeT)
  fun rocksdb_writebatch_put_cf(x0 : RocksdbWritebatchT, column_family : RocksdbColumnFamilyHandleT, key : LibC::Char*, klen : LibC::SizeT, val : LibC::Char*, vlen : LibC::SizeT)
  fun rocksdb_writebatch_putv(b : RocksdbWritebatchT, num_keys : LibC::Int, keys_list : LibC::Char**, keys_list_sizes : LibC::SizeT*, num_values : LibC::Int, values_list : LibC::Char**, values_list_sizes : LibC::SizeT*)
  fun rocksdb_writebatch_putv_cf(b : RocksdbWritebatchT, column_family : RocksdbColumnFamilyHandleT, num_keys : LibC::Int, keys_list : LibC::Char**, keys_list_sizes : LibC::SizeT*, num_values : LibC::Int, values_list : LibC::Char**, values_list_sizes : LibC::SizeT*)
  fun rocksdb_writebatch_merge(x0 : RocksdbWritebatchT, key : LibC::Char*, klen : LibC::SizeT, val : LibC::Char*, vlen : LibC::SizeT)
  fun rocksdb_writebatch_merge_cf(x0 : RocksdbWritebatchT, column_family : RocksdbColumnFamilyHandleT, key : LibC::Char*, klen : LibC::SizeT, val : LibC::Char*, vlen : LibC::SizeT)
  fun rocksdb_writebatch_mergev(b : RocksdbWritebatchT, num_keys : LibC::Int, keys_list : LibC::Char**, keys_list_sizes : LibC::SizeT*, num_values : LibC::Int, values_list : LibC::Char**, values_list_sizes : LibC::SizeT*)
  fun rocksdb_writebatch_mergev_cf(b : RocksdbWritebatchT, column_family : RocksdbColumnFamilyHandleT, num_keys : LibC::Int, keys_list : LibC::Char**, keys_list_sizes : LibC::SizeT*, num_values : LibC::Int, values_list : LibC::Char**, values_list_sizes : LibC::SizeT*)
  fun rocksdb_writebatch_delete_range(x0 : RocksdbWritebatchT, begin_key : LibC::Char*, end_key : LibC::Char*)
  fun rocksdb_writebatch_delete(x0 : RocksdbWritebatchT, key : LibC::Char*, klen : LibC::SizeT)
  fun rocksdb_writebatch_delete_cf(x0 : RocksdbWritebatchT, column_family : RocksdbColumnFamilyHandleT, key : LibC::Char*, klen : LibC::SizeT)
  fun rocksdb_writebatch_deletev(b : RocksdbWritebatchT, num_keys : LibC::Int, keys_list : LibC::Char**, keys_list_sizes : LibC::SizeT*)
  fun rocksdb_writebatch_deletev_cf(b : RocksdbWritebatchT, column_family : RocksdbColumnFamilyHandleT, num_keys : LibC::Int, keys_list : LibC::Char**, keys_list_sizes : LibC::SizeT*)
  fun rocksdb_writebatch_put_log_data(x0 : RocksdbWritebatchT, blob : LibC::Char*, len : LibC::SizeT)
  fun rocksdb_writebatch_iterate(x0 : RocksdbWritebatchT, state : Void*, put : (Void*, LibC::Char*, LibC::SizeT, LibC::Char*, LibC::SizeT -> Void), deleted : (Void*, LibC::Char*, LibC::SizeT -> Void))
  fun rocksdb_writebatch_data(x0 : RocksdbWritebatchT, size : LibC::SizeT*) : LibC::Char*
  fun rocksdb_block_based_options_create : RocksdbBlockBasedTableOptionsT
  type RocksdbBlockBasedTableOptionsT = Void*
  fun rocksdb_block_based_options_destroy(options : RocksdbBlockBasedTableOptionsT)
  fun rocksdb_block_based_options_set_block_size(options : RocksdbBlockBasedTableOptionsT, block_size : LibC::SizeT)
  fun rocksdb_block_based_options_set_block_size_deviation(options : RocksdbBlockBasedTableOptionsT, block_size_deviation : LibC::Int)
  fun rocksdb_block_based_options_set_block_restart_interval(options : RocksdbBlockBasedTableOptionsT, block_restart_interval : LibC::Int)
  fun rocksdb_block_based_options_set_filter_policy(options : RocksdbBlockBasedTableOptionsT, filter_policy : RocksdbFilterpolicyT)
  type RocksdbFilterpolicyT = Void*
  fun rocksdb_block_based_options_set_no_block_cache(options : RocksdbBlockBasedTableOptionsT, no_block_cache : UInt8)
  fun rocksdb_block_based_options_set_block_cache(options : RocksdbBlockBasedTableOptionsT, block_cache : RocksdbCacheT)
  type RocksdbCacheT = Void*
  fun rocksdb_block_based_options_set_block_cache_compressed(options : RocksdbBlockBasedTableOptionsT, block_cache_compressed : RocksdbCacheT)
  fun rocksdb_block_based_options_set_whole_key_filtering(x0 : RocksdbBlockBasedTableOptionsT, x1 : UInt8)
  fun rocksdb_block_based_options_set_format_version(x0 : RocksdbBlockBasedTableOptionsT, x1 : LibC::Int)
  RocksdbBlockBasedTableIndexTypeBinarySearch = 0
  RocksdbBlockBasedTableIndexTypeHashSearch = 1
  fun rocksdb_block_based_options_set_index_type(x0 : RocksdbBlockBasedTableOptionsT, x1 : LibC::Int)
  fun rocksdb_block_based_options_set_hash_index_allow_collision(x0 : RocksdbBlockBasedTableOptionsT, x1 : UInt8)
  fun rocksdb_block_based_options_set_cache_index_and_filter_blocks(x0 : RocksdbBlockBasedTableOptionsT, x1 : UInt8)
  fun rocksdb_options_set_block_based_table_factory(opt : RocksdbOptionsT, table_options : RocksdbBlockBasedTableOptionsT)
  fun rocksdb_cuckoo_options_create : RocksdbCuckooTableOptionsT
  type RocksdbCuckooTableOptionsT = Void*
  fun rocksdb_cuckoo_options_destroy(options : RocksdbCuckooTableOptionsT)
  fun rocksdb_cuckoo_options_set_hash_ratio(options : RocksdbCuckooTableOptionsT, v : LibC::Double)
  fun rocksdb_cuckoo_options_set_max_search_depth(options : RocksdbCuckooTableOptionsT, v : Uint32T)
  fun rocksdb_cuckoo_options_set_cuckoo_block_size(options : RocksdbCuckooTableOptionsT, v : Uint32T)
  fun rocksdb_cuckoo_options_set_identity_as_first_hash(options : RocksdbCuckooTableOptionsT, v : UInt8)
  fun rocksdb_cuckoo_options_set_use_module_hash(options : RocksdbCuckooTableOptionsT, v : UInt8)
  fun rocksdb_options_set_cuckoo_table_factory(opt : RocksdbOptionsT, table_options : RocksdbCuckooTableOptionsT)
  fun rocksdb_options_create : RocksdbOptionsT
  fun rocksdb_options_destroy(x0 : RocksdbOptionsT)
  fun rocksdb_options_increase_parallelism(opt : RocksdbOptionsT, total_threads : LibC::Int)
  fun rocksdb_options_optimize_for_point_lookup(opt : RocksdbOptionsT, block_cache_size_mb : Uint64T)
  fun rocksdb_options_optimize_level_style_compaction(opt : RocksdbOptionsT, memtable_memory_budget : Uint64T)
  fun rocksdb_options_optimize_universal_style_compaction(opt : RocksdbOptionsT, memtable_memory_budget : Uint64T)
  fun rocksdb_options_set_compaction_filter(x0 : RocksdbOptionsT, x1 : RocksdbCompactionfilterT)
  type RocksdbCompactionfilterT = Void*
  fun rocksdb_options_set_compaction_filter_factory(x0 : RocksdbOptionsT, x1 : RocksdbCompactionfilterfactoryT)
  type RocksdbCompactionfilterfactoryT = Void*
  fun rocksdb_options_set_comparator(x0 : RocksdbOptionsT, x1 : RocksdbComparatorT)
  type RocksdbComparatorT = Void*
  fun rocksdb_options_set_merge_operator(x0 : RocksdbOptionsT, x1 : RocksdbMergeoperatorT)
  type RocksdbMergeoperatorT = Void*
  fun rocksdb_options_set_uint64add_merge_operator(x0 : RocksdbOptionsT)
  fun rocksdb_options_set_compression_per_level(opt : RocksdbOptionsT, level_values : LibC::Int*, num_levels : LibC::SizeT)
  fun rocksdb_options_set_create_if_missing(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_create_missing_column_families(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_error_if_exists(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_paranoid_checks(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_env(x0 : RocksdbOptionsT, x1 : RocksdbEnvT)
  type RocksdbEnvT = Void*
  fun rocksdb_options_set_info_log(x0 : RocksdbOptionsT, x1 : RocksdbLoggerT)
  type RocksdbLoggerT = Void*
  fun rocksdb_options_set_info_log_level(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_write_buffer_size(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  fun rocksdb_options_set_max_open_files(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_max_total_wal_size(opt : RocksdbOptionsT, n : Uint64T)
  fun rocksdb_options_set_compression_options(x0 : RocksdbOptionsT, x1 : LibC::Int, x2 : LibC::Int, x3 : LibC::Int)
  fun rocksdb_options_set_prefix_extractor(x0 : RocksdbOptionsT, x1 : RocksdbSlicetransformT)
  type RocksdbSlicetransformT = Void*
  fun rocksdb_options_set_num_levels(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_level0_file_num_compaction_trigger(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_level0_slowdown_writes_trigger(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_level0_stop_writes_trigger(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_max_mem_compaction_level(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_target_file_size_base(x0 : RocksdbOptionsT, x1 : Uint64T)
  fun rocksdb_options_set_target_file_size_multiplier(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_max_bytes_for_level_base(x0 : RocksdbOptionsT, x1 : Uint64T)
  fun rocksdb_options_set_max_bytes_for_level_multiplier(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_expanded_compaction_factor(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_max_grandparent_overlap_factor(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_max_bytes_for_level_multiplier_additional(x0 : RocksdbOptionsT, level_values : LibC::Int*, num_levels : LibC::SizeT)
  fun rocksdb_options_enable_statistics(x0 : RocksdbOptionsT)
  fun rocksdb_options_statistics_get_string(opt : RocksdbOptionsT) : LibC::Char*
  fun rocksdb_options_set_max_write_buffer_number(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_min_write_buffer_number_to_merge(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_max_write_buffer_number_to_maintain(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_max_background_compactions(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_max_background_flushes(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_max_log_file_size(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  fun rocksdb_options_set_log_file_time_to_roll(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  fun rocksdb_options_set_keep_log_file_num(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  fun rocksdb_options_set_soft_rate_limit(x0 : RocksdbOptionsT, x1 : LibC::Double)
  fun rocksdb_options_set_hard_rate_limit(x0 : RocksdbOptionsT, x1 : LibC::Double)
  fun rocksdb_options_set_rate_limit_delay_max_milliseconds(x0 : RocksdbOptionsT, x1 : LibC::UInt)
  fun rocksdb_options_set_max_manifest_file_size(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  fun rocksdb_options_set_table_cache_numshardbits(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_table_cache_remove_scan_count_limit(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_arena_block_size(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  fun rocksdb_options_set_use_fsync(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_db_log_dir(x0 : RocksdbOptionsT, x1 : LibC::Char*)
  fun rocksdb_options_set_wal_dir(x0 : RocksdbOptionsT, x1 : LibC::Char*)
  fun rocksdb_options_set_wal_ttl_seconds = rocksdb_options_set_WAL_ttl_seconds(x0 : RocksdbOptionsT, x1 : Uint64T)
  fun rocksdb_options_set_wal_size_limit_mb = rocksdb_options_set_WAL_size_limit_MB(x0 : RocksdbOptionsT, x1 : Uint64T)
  fun rocksdb_options_set_manifest_preallocation_size(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  fun rocksdb_options_set_purge_redundant_kvs_while_flush(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_allow_os_buffer(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_allow_mmap_reads(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_allow_mmap_writes(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_is_fd_close_on_exec(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_skip_log_error_on_recovery(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_stats_dump_period_sec(x0 : RocksdbOptionsT, x1 : LibC::UInt)
  fun rocksdb_options_set_advise_random_on_open(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_access_hint_on_compaction_start(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_use_adaptive_mutex(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_bytes_per_sync(x0 : RocksdbOptionsT, x1 : Uint64T)
  fun rocksdb_options_set_verify_checksums_in_compaction(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_filter_deletes(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_max_sequential_skip_in_iterations(x0 : RocksdbOptionsT, x1 : Uint64T)
  fun rocksdb_options_set_disable_data_sync(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_disable_auto_compactions(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_delete_obsolete_files_period_micros(x0 : RocksdbOptionsT, x1 : Uint64T)
  fun rocksdb_options_set_source_compaction_factor(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_prepare_for_bulk_load(x0 : RocksdbOptionsT)
  fun rocksdb_options_set_memtable_vector_rep(x0 : RocksdbOptionsT)
  fun rocksdb_options_set_hash_skip_list_rep(x0 : RocksdbOptionsT, x1 : LibC::SizeT, x2 : Int32T, x3 : Int32T)
  alias Int32T = LibC::Int
  fun rocksdb_options_set_hash_link_list_rep(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  fun rocksdb_options_set_plain_table_factory(x0 : RocksdbOptionsT, x1 : Uint32T, x2 : LibC::Int, x3 : LibC::Double, x4 : LibC::SizeT)
  fun rocksdb_options_set_min_level_to_compress(opt : RocksdbOptionsT, level : LibC::Int)
  fun rocksdb_options_set_memtable_prefix_bloom_bits(x0 : RocksdbOptionsT, x1 : Uint32T)
  fun rocksdb_options_set_memtable_prefix_bloom_probes(x0 : RocksdbOptionsT, x1 : Uint32T)
  fun rocksdb_options_set_max_successive_merges(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  fun rocksdb_options_set_min_partial_merge_operands(x0 : RocksdbOptionsT, x1 : Uint32T)
  fun rocksdb_options_set_bloom_locality(x0 : RocksdbOptionsT, x1 : Uint32T)
  fun rocksdb_options_set_inplace_update_support(x0 : RocksdbOptionsT, x1 : UInt8)
  fun rocksdb_options_set_inplace_update_num_locks(x0 : RocksdbOptionsT, x1 : LibC::SizeT)
  RocksdbNoCompression = 0
  RocksdbSnappyCompression = 1
  RocksdbZlibCompression = 2
  RocksdbBz2Compression = 3
  RocksdbLz4Compression = 4
  RocksdbLz4hcCompression = 5
  fun rocksdb_options_set_compression(x0 : RocksdbOptionsT, x1 : LibC::Int)
  RocksdbLevelCompaction = 0
  RocksdbUniversalCompaction = 1
  RocksdbFifoCompaction = 2
  fun rocksdb_options_set_compaction_style(x0 : RocksdbOptionsT, x1 : LibC::Int)
  fun rocksdb_options_set_universal_compaction_options(x0 : RocksdbOptionsT, x1 : RocksdbUniversalCompactionOptionsT)
  type RocksdbUniversalCompactionOptionsT = Void*
  fun rocksdb_options_set_fifo_compaction_options(opt : RocksdbOptionsT, fifo : RocksdbFifoCompactionOptionsT)
  type RocksdbFifoCompactionOptionsT = Void*
  fun rocksdb_compactionfilter_create(state : Void*, destructor : (Void* -> Void), filter : (Void*, LibC::Int, LibC::Char*, LibC::SizeT, LibC::Char*, LibC::SizeT, LibC::Char**, LibC::SizeT*, UInt8* -> UInt8), name : (Void* -> LibC::Char*)) : RocksdbCompactionfilterT
  fun rocksdb_compactionfilter_destroy(x0 : RocksdbCompactionfilterT)
  fun rocksdb_compactionfiltercontext_is_full_compaction(context : RocksdbCompactionfiltercontextT) : UInt8
  type RocksdbCompactionfiltercontextT = Void*
  fun rocksdb_compactionfiltercontext_is_manual_compaction(context : RocksdbCompactionfiltercontextT) : UInt8
  fun rocksdb_compactionfilterfactory_create(state : Void*, destructor : (Void* -> Void), create_compaction_filter : (Void*, RocksdbCompactionfiltercontextT -> RocksdbCompactionfilterT), name : (Void* -> LibC::Char*)) : RocksdbCompactionfilterfactoryT
  fun rocksdb_compactionfilterfactory_destroy(x0 : RocksdbCompactionfilterfactoryT)
  fun rocksdb_comparator_create(state : Void*, destructor : (Void* -> Void), compare : (Void*, LibC::Char*, LibC::SizeT, LibC::Char*, LibC::SizeT -> LibC::Int), name : (Void* -> LibC::Char*)) : RocksdbComparatorT
  fun rocksdb_comparator_destroy(x0 : RocksdbComparatorT)
  fun rocksdb_filterpolicy_create(state : Void*, destructor : (Void* -> Void), create_filter : (Void*, LibC::Char**, LibC::SizeT*, LibC::Int, LibC::SizeT* -> LibC::Char*), key_may_match : (Void*, LibC::Char*, LibC::SizeT, LibC::Char*, LibC::SizeT -> UInt8), delete_filter : (Void*, LibC::Char*, LibC::SizeT -> Void), name : (Void* -> LibC::Char*)) : RocksdbFilterpolicyT
  fun rocksdb_filterpolicy_destroy(x0 : RocksdbFilterpolicyT)
  fun rocksdb_filterpolicy_create_bloom(bits_per_key : LibC::Int) : RocksdbFilterpolicyT
  fun rocksdb_mergeoperator_create(state : Void*, destructor : (Void* -> Void), full_merge : (Void*, LibC::Char*, LibC::SizeT, LibC::Char*, LibC::SizeT, LibC::Char**, LibC::SizeT*, LibC::Int, UInt8*, LibC::SizeT* -> LibC::Char*), partial_merge : (Void*, LibC::Char*, LibC::SizeT, LibC::Char**, LibC::SizeT*, LibC::Int, UInt8*, LibC::SizeT* -> LibC::Char*), delete_value : (Void*, LibC::Char*, LibC::SizeT -> Void), name : (Void* -> LibC::Char*)) : RocksdbMergeoperatorT
  fun rocksdb_mergeoperator_destroy(x0 : RocksdbMergeoperatorT)
  fun rocksdb_readoptions_create : RocksdbReadoptionsT
  fun rocksdb_readoptions_destroy(x0 : RocksdbReadoptionsT)
  fun rocksdb_readoptions_set_verify_checksums(x0 : RocksdbReadoptionsT, x1 : UInt8)
  fun rocksdb_readoptions_set_fill_cache(x0 : RocksdbReadoptionsT, x1 : UInt8)
  fun rocksdb_readoptions_set_snapshot(x0 : RocksdbReadoptionsT, x1 : RocksdbSnapshotT)
  fun rocksdb_readoptions_set_iterate_upper_bound(x0 : RocksdbReadoptionsT, key : LibC::Char*, keylen : LibC::SizeT)
  fun rocksdb_readoptions_set_read_tier(x0 : RocksdbReadoptionsT, x1 : LibC::Int)
  fun rocksdb_readoptions_set_tailing(x0 : RocksdbReadoptionsT, x1 : UInt8)
  fun rocksdb_writeoptions_create : RocksdbWriteoptionsT
  fun rocksdb_writeoptions_destroy(x0 : RocksdbWriteoptionsT)
  fun rocksdb_writeoptions_set_sync(x0 : RocksdbWriteoptionsT, x1 : UInt8)
  fun rocksdb_writeoptions_disable_wal = rocksdb_writeoptions_disable_WAL(opt : RocksdbWriteoptionsT, disable : LibC::Int)
  fun rocksdb_flushoptions_create : RocksdbFlushoptionsT
  fun rocksdb_flushoptions_destroy(x0 : RocksdbFlushoptionsT)
  fun rocksdb_flushoptions_set_wait(x0 : RocksdbFlushoptionsT, x1 : UInt8)
  fun rocksdb_cache_create_lru(capacity : LibC::SizeT) : RocksdbCacheT
  fun rocksdb_cache_destroy(cache : RocksdbCacheT)
  fun rocksdb_create_default_env : RocksdbEnvT
  fun rocksdb_env_set_background_threads(env : RocksdbEnvT, n : LibC::Int)
  fun rocksdb_env_set_high_priority_background_threads(env : RocksdbEnvT, n : LibC::Int)
  fun rocksdb_env_join_all_threads(env : RocksdbEnvT)
  fun rocksdb_env_destroy(x0 : RocksdbEnvT)
  fun rocksdb_slicetransform_create(state : Void*, destructor : (Void* -> Void), transform : (Void*, LibC::Char*, LibC::SizeT, LibC::SizeT* -> LibC::Char*), in_domain : (Void*, LibC::Char*, LibC::SizeT -> UInt8), in_range : (Void*, LibC::Char*, LibC::SizeT -> UInt8), name : (Void* -> LibC::Char*)) : RocksdbSlicetransformT
  fun rocksdb_slicetransform_create_fixed_prefix(x0 : LibC::SizeT) : RocksdbSlicetransformT
  fun rocksdb_slicetransform_create_noop : RocksdbSlicetransformT
  fun rocksdb_slicetransform_destroy(x0 : RocksdbSlicetransformT)
  RocksdbSimilarSizeCompactionStopStyle = 0
  RocksdbTotalSizeCompactionStopStyle = 1
  fun rocksdb_universal_compaction_options_create : RocksdbUniversalCompactionOptionsT
  fun rocksdb_universal_compaction_options_set_size_ratio(x0 : RocksdbUniversalCompactionOptionsT, x1 : LibC::Int)
  fun rocksdb_universal_compaction_options_set_min_merge_width(x0 : RocksdbUniversalCompactionOptionsT, x1 : LibC::Int)
  fun rocksdb_universal_compaction_options_set_max_merge_width(x0 : RocksdbUniversalCompactionOptionsT, x1 : LibC::Int)
  fun rocksdb_universal_compaction_options_set_max_size_amplification_percent(x0 : RocksdbUniversalCompactionOptionsT, x1 : LibC::Int)
  fun rocksdb_universal_compaction_options_set_compression_size_percent(x0 : RocksdbUniversalCompactionOptionsT, x1 : LibC::Int)
  fun rocksdb_universal_compaction_options_set_stop_style(x0 : RocksdbUniversalCompactionOptionsT, x1 : LibC::Int)
  fun rocksdb_universal_compaction_options_destroy(x0 : RocksdbUniversalCompactionOptionsT)
  fun rocksdb_fifo_compaction_options_create : RocksdbFifoCompactionOptionsT
  fun rocksdb_fifo_compaction_options_set_max_table_files_size(fifo_opts : RocksdbFifoCompactionOptionsT, size : Uint64T)
  fun rocksdb_fifo_compaction_options_destroy(fifo_opts : RocksdbFifoCompactionOptionsT)
  fun rocksdb_livefiles_count(x0 : RocksdbLivefilesT) : LibC::Int
  fun rocksdb_livefiles_name(x0 : RocksdbLivefilesT, index : LibC::Int) : LibC::Char*
  fun rocksdb_livefiles_level(x0 : RocksdbLivefilesT, index : LibC::Int) : LibC::Int
  fun rocksdb_livefiles_size(x0 : RocksdbLivefilesT, index : LibC::Int) : LibC::SizeT
  fun rocksdb_livefiles_smallestkey(x0 : RocksdbLivefilesT, index : LibC::Int, size : LibC::SizeT*) : LibC::Char*
  fun rocksdb_livefiles_largestkey(x0 : RocksdbLivefilesT, index : LibC::Int, size : LibC::SizeT*) : LibC::Char*
  fun rocksdb_livefiles_destroy(x0 : RocksdbLivefilesT)
  fun rocksdb_get_options_from_string(base_options : RocksdbOptionsT, opts_str : LibC::Char*, new_options : RocksdbOptionsT, errptr : LibC::Char**)
  fun rocksdb_free(ptr : Void*)
end

