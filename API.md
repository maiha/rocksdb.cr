# Supported API
### Database (2 / 24)

|Command                                              |impl|test|note|
|-----------------------------------------------------|:--:|:--:|----|
|`rocksdb_open`                                       |  ✓ |  ✓ |    |
|`rocksdb_close`                                      |  ✓ |  ✓ |    |
|`rocksdb_open_for_read_only`                         |    |    |    |
|`rocksdb_backup_engine_open`                         |    |    |    |
|`rocksdb_backup_engine_create_new_backup`            |    |    |    |
|`rocksdb_restore_options_create`                     |    |    |    |
|`rocksdb_restore_options_destroy`                    |    |    |    |
|`rocksdb_restore_options_set_keep_log_files`         |    |    |    |
|`rocksdb_backup_engine_restore_db_from_latest_backup`|    |    |    |
|`rocksdb_backup_engine_get_backup_info`              |    |    |    |
|`rocksdb_backup_engine_info_count`                   |    |    |    |
|`rocksdb_backup_engine_info_timestamp`               |    |    |    |
|`rocksdb_backup_engine_info_backup_id`               |    |    |    |
|`rocksdb_backup_engine_info_size`                    |    |    |    |
|`rocksdb_backup_engine_info_number_files`            |    |    |    |
|`rocksdb_backup_engine_info_destroy`                 |    |    |    |
|`rocksdb_backup_engine_close`                        |    |    |    |
|`rocksdb_open_column_families`                       |    |    |    |
|`rocksdb_open_for_read_only_column_families`         |    |    |    |
|`rocksdb_list_column_families`                       |    |    |    |
|`rocksdb_list_column_families_destroy`               |    |    |    |
|`rocksdb_create_column_family`                       |    |    |    |
|`rocksdb_drop_column_family`                         |    |    |    |
|`rocksdb_column_family_handle_destroy`               |    |    |    |

### Reads and writes (5 / 13)

|Command               |impl|test|note|
|----------------------|:--:|:--:|----|
|`rocksdb_get`         |  ✓ |  ✓ |    |
|`rocksdb_put`         |  ✓ |  ✓ |    |
|`rocksdb_delete`      |  ✓ |  ✓ |    |
|`rocksdb_put_cf`      |    |    |    |
|`rocksdb_delete`      |  ✓ |  ✓ |    |
|`rocksdb_delete_cf`   |    |    |    |
|`rocksdb_merge`       |    |    |    |
|`rocksdb_merge_cf`    |    |    |    |
|`rocksdb_write`       |    |    |    |
|`rocksdb_get`         |  ✓ |  ✓ |    |
|`rocksdb_get_cf`      |    |    |    |
|`rocksdb_multi_get`   |    |    |    |
|`rocksdb_multi_get_cf`|    |    |    |

### Iteration (0 / 12)

|Command                     |impl|test|note|
|----------------------------|:--:|:--:|----|
|`rocksdb_create_iterator`   |    |    |    |
|`rocksdb_create_iterator_cf`|    |    |    |
|`rocksdb_iter_destroy`      |    |    |    |
|`rocksdb_iter_valid`        |    |    |    |
|`rocksdb_iter_seek_to_first`|    |    |    |
|`rocksdb_iter_seek_to_last` |    |    |    |
|`rocksdb_iter_seek`         |    |    |    |
|`rocksdb_iter_next`         |    |    |    |
|`rocksdb_iter_prev`         |    |    |    |
|`rocksdb_iter_key`          |    |    |    |
|`rocksdb_iter_value`        |    |    |    |
|`rocksdb_iter_get_error`    |    |    |    |

### Snapshots (0 / 15)

|Command                         |impl|test|note|
|--------------------------------|:--:|:--:|----|
|`rocksdb_create_snapshot`       |    |    |    |
|`rocksdb_release_snapshot`      |    |    |    |
|`rocksdb_property_value`        |    |    |    |
|`rocksdb_property_value_cf`     |    |    |    |
|`rocksdb_approximate_sizes`     |    |    |    |
|`rocksdb_approximate_sizes_cf`  |    |    |    |
|`rocksdb_compact_range`         |    |    |    |
|`rocksdb_compact_range_cf`      |    |    |    |
|`rocksdb_delete_file`           |    |    |    |
|`rocksdb_livefiles`             |    |    |    |
|`rocksdb_flush`                 |    |    |    |
|`rocksdb_disable_file_deletions`|    |    |    |
|`rocksdb_enable_file_deletions` |    |    |    |
|`rocksdb_destroy_db`            |    |    |    |
|`rocksdb_repair_db`             |    |    |    |

### Atomic updates (0 / 19)

|Command                          |impl|test|note|
|---------------------------------|:--:|:--:|----|
|`rocksdb_writebatch_create_from` |    |    |    |
|`rocksdb_writebatch_destroy`     |    |    |    |
|`rocksdb_writebatch_clear`       |    |    |    |
|`rocksdb_writebatch_count`       |    |    |    |
|`rocksdb_writebatch_put`         |    |    |    |
|`rocksdb_writebatch_put_cf`      |    |    |    |
|`rocksdb_writebatch_putv`        |    |    |    |
|`rocksdb_writebatch_putv_cf`     |    |    |    |
|`rocksdb_writebatch_merge`       |    |    |    |
|`rocksdb_writebatch_merge_cf`    |    |    |    |
|`rocksdb_writebatch_mergev`      |    |    |    |
|`rocksdb_writebatch_mergev_cf`   |    |    |    |
|`rocksdb_writebatch_delete`      |    |    |    |
|`rocksdb_writebatch_delete_cf`   |    |    |    |
|`rocksdb_writebatch_deletev`     |    |    |    |
|`rocksdb_writebatch_deletev_cf`  |    |    |    |
|`rocksdb_writebatch_put_log_data`|    |    |    |
|`rocksdb_writebatch_iterate`     |    |    |    |
|`rocksdb_writebatch_data`        |    |    |    |

### Cache (0 / 15)

|Command                                                        |impl|test|note|
|---------------------------------------------------------------|:--:|:--:|----|
|`rocksdb_block_based_options_create`                           |    |    |    |
|`rocksdb_block_based_options_destroy`                          |    |    |    |
|`rocksdb_block_based_options_set_block_size`                   |    |    |    |
|`rocksdb_block_based_options_set_block_size_deviation`         |    |    |    |
|`rocksdb_block_based_options_set_block_restart_interval`       |    |    |    |
|`rocksdb_block_based_options_set_filter_policy`                |    |    |    |
|`rocksdb_block_based_options_set_no_block_cache`               |    |    |    |
|`rocksdb_block_based_options_set_block_cache`                  |    |    |    |
|`rocksdb_block_based_options_set_block_cache_compressed`       |    |    |    |
|`rocksdb_block_based_options_set_whole_key_filtering`          |    |    |    |
|`rocksdb_block_based_options_set_format_version`               |    |    |    |
|`rocksdb_block_based_options_set_index_type`                   |    |    |    |
|`rocksdb_block_based_options_set_hash_index_allow_collision`   |    |    |    |
|`rocksdb_block_based_options_set_cache_index_and_filter_blocks`|    |    |    |
|`rocksdb_options_set_block_based_table_factory`                |    |    |    |

### Cuckoo hashing (0 / 8)

|Command                                            |impl|test|note|
|---------------------------------------------------|:--:|:--:|----|
|`rocksdb_cuckoo_options_create`                    |    |    |    |
|`rocksdb_cuckoo_options_destroy`                   |    |    |    |
|`rocksdb_cuckoo_options_set_hash_ratio`            |    |    |    |
|`rocksdb_cuckoo_options_set_max_search_depth`      |    |    |    |
|`rocksdb_cuckoo_options_set_cuckoo_block_size`     |    |    |    |
|`rocksdb_cuckoo_options_set_identity_as_first_hash`|    |    |    |
|`rocksdb_cuckoo_options_set_use_module_hash`       |    |    |    |
|`rocksdb_options_set_cuckoo_table_factory`         |    |    |    |

### Options (0 / 94)

|Command                                                        |impl|test|note|
|---------------------------------------------------------------|:--:|:--:|----|
|`rocksdb_options_create`                                       |    |    |    |
|`rocksdb_options_destroy`                                      |    |    |    |
|`rocksdb_options_increase_parallelism`                         |    |    |    |
|`rocksdb_options_optimize_for_point_lookup`                    |    |    |    |
|`rocksdb_options_optimize_level_style_compaction`              |    |    |    |
|`rocksdb_options_optimize_universal_style_compaction`          |    |    |    |
|`rocksdb_options_set_compaction_filter`                        |    |    |    |
|`rocksdb_options_set_compaction_filter_factory`                |    |    |    |
|`rocksdb_options_set_comparator`                               |    |    |    |
|`rocksdb_options_set_merge_operator`                           |    |    |    |
|`rocksdb_options_set_uint64add_merge_operator`                 |    |    |    |
|`rocksdb_options_set_compression_per_level`                    |    |    |    |
|`rocksdb_options_set_create_if_missing`                        |    |    |    |
|`rocksdb_options_set_create_missing_column_families`           |    |    |    |
|`rocksdb_options_set_error_if_exists`                          |    |    |    |
|`rocksdb_options_set_paranoid_checks`                          |    |    |    |
|`rocksdb_options_set_env`                                      |    |    |    |
|`rocksdb_options_set_info_log`                                 |    |    |    |
|`rocksdb_options_set_info_log_level`                           |    |    |    |
|`rocksdb_options_set_write_buffer_size`                        |    |    |    |
|`rocksdb_options_set_max_open_files`                           |    |    |    |
|`rocksdb_options_set_max_total_wal_size`                       |    |    |    |
|`rocksdb_options_set_compression_options`                      |    |    |    |
|`rocksdb_options_set_prefix_extractor`                         |    |    |    |
|`rocksdb_options_set_num_levels`                               |    |    |    |
|`rocksdb_options_set_level0_file_num_compaction_trigger`       |    |    |    |
|`rocksdb_options_set_level0_slowdown_writes_trigger`           |    |    |    |
|`rocksdb_options_set_level0_stop_writes_trigger`               |    |    |    |
|`rocksdb_options_set_max_mem_compaction_level`                 |    |    |    |
|`rocksdb_options_set_target_file_size_base`                    |    |    |    |
|`rocksdb_options_set_target_file_size_multiplier`              |    |    |    |
|`rocksdb_options_set_max_bytes_for_level_base`                 |    |    |    |
|`rocksdb_options_set_max_bytes_for_level_multiplier`           |    |    |    |
|`rocksdb_options_set_expanded_compaction_factor`               |    |    |    |
|`rocksdb_options_set_max_grandparent_overlap_factor`           |    |    |    |
|`rocksdb_options_set_max_bytes_for_level_multiplier_additional`|    |    |    |
|`rocksdb_options_enable_statistics`                            |    |    |    |
|`rocksdb_options_statistics_get_string`                        |    |    |    |
|`rocksdb_options_set_max_write_buffer_number`                  |    |    |    |
|`rocksdb_options_set_min_write_buffer_number_to_merge`         |    |    |    |
|`rocksdb_options_set_max_write_buffer_number_to_maintain`      |    |    |    |
|`rocksdb_options_set_max_background_compactions`               |    |    |    |
|`rocksdb_options_set_max_background_flushes`                   |    |    |    |
|`rocksdb_options_set_max_log_file_size`                        |    |    |    |
|`rocksdb_options_set_log_file_time_to_roll`                    |    |    |    |
|`rocksdb_options_set_keep_log_file_num`                        |    |    |    |
|`rocksdb_options_set_soft_rate_limit`                          |    |    |    |
|`rocksdb_options_set_hard_rate_limit`                          |    |    |    |
|`rocksdb_options_set_rate_limit_delay_max_milliseconds`        |    |    |    |
|`rocksdb_options_set_max_manifest_file_size`                   |    |    |    |
|`rocksdb_options_set_table_cache_numshardbits`                 |    |    |    |
|`rocksdb_options_set_table_cache_remove_scan_count_limit`      |    |    |    |
|`rocksdb_options_set_arena_block_size`                         |    |    |    |
|`rocksdb_options_set_use_fsync`                                |    |    |    |
|`rocksdb_options_set_db_log_dir`                               |    |    |    |
|`rocksdb_options_set_wal_dir`                                  |    |    |    |
|`rocksdb_options_set_wal_ttl_seconds`                          |    |    |    |
|`rocksdb_options_set_wal_size_limit_mb`                        |    |    |    |
|`rocksdb_options_set_manifest_preallocation_size`              |    |    |    |
|`rocksdb_options_set_purge_redundant_kvs_while_flush`          |    |    |    |
|`rocksdb_options_set_allow_os_buffer`                          |    |    |    |
|`rocksdb_options_set_allow_mmap_reads`                         |    |    |    |
|`rocksdb_options_set_allow_mmap_writes`                        |    |    |    |
|`rocksdb_options_set_is_fd_close_on_exec`                      |    |    |    |
|`rocksdb_options_set_skip_log_error_on_recovery`               |    |    |    |
|`rocksdb_options_set_stats_dump_period_sec`                    |    |    |    |
|`rocksdb_options_set_advise_random_on_open`                    |    |    |    |
|`rocksdb_options_set_access_hint_on_compaction_start`          |    |    |    |
|`rocksdb_options_set_use_adaptive_mutex`                       |    |    |    |
|`rocksdb_options_set_bytes_per_sync`                           |    |    |    |
|`rocksdb_options_set_verify_checksums_in_compaction`           |    |    |    |
|`rocksdb_options_set_filter_deletes`                           |    |    |    |
|`rocksdb_options_set_max_sequential_skip_in_iterations`        |    |    |    |
|`rocksdb_options_set_disable_data_sync`                        |    |    |    |
|`rocksdb_options_set_disable_auto_compactions`                 |    |    |    |
|`rocksdb_options_set_delete_obsolete_files_period_micros`      |    |    |    |
|`rocksdb_options_set_source_compaction_factor`                 |    |    |    |
|`rocksdb_options_prepare_for_bulk_load`                        |    |    |    |
|`rocksdb_options_set_memtable_vector_rep`                      |    |    |    |
|`rocksdb_options_set_hash_skip_list_rep`                       |    |    |    |
|`rocksdb_options_set_hash_link_list_rep`                       |    |    |    |
|`rocksdb_options_set_plain_table_factory`                      |    |    |    |
|`rocksdb_options_set_min_level_to_compress`                    |    |    |    |
|`rocksdb_options_set_memtable_prefix_bloom_bits`               |    |    |    |
|`rocksdb_options_set_memtable_prefix_bloom_probes`             |    |    |    |
|`rocksdb_options_set_max_successive_merges`                    |    |    |    |
|`rocksdb_options_set_min_partial_merge_operands`               |    |    |    |
|`rocksdb_options_set_bloom_locality`                           |    |    |    |
|`rocksdb_options_set_inplace_update_support`                   |    |    |    |
|`rocksdb_options_set_inplace_update_num_locks`                 |    |    |    |
|`rocksdb_options_set_compression`                              |    |    |    |
|`rocksdb_options_set_compaction_style`                         |    |    |    |
|`rocksdb_options_set_universal_compaction_options`             |    |    |    |
|`rocksdb_options_set_fifo_compaction_options`                  |    |    |    |

### Compaction (0 / 50)

|Command                                                                  |impl|test|note|
|-------------------------------------------------------------------------|:--:|:--:|----|
|`rocksdb_compactionfilter_create`                                        |    |    |    |
|`rocksdb_compactionfilter_destroy`                                       |    |    |    |
|`rocksdb_compactionfiltercontext_is_full_compaction`                     |    |    |    |
|`rocksdb_compactionfiltercontext_is_manual_compaction`                   |    |    |    |
|`rocksdb_compactionfilterfactory_create`                                 |    |    |    |
|`rocksdb_compactionfilterfactory_destroy`                                |    |    |    |
|`rocksdb_comparator_create`                                              |    |    |    |
|`rocksdb_comparator_destroy`                                             |    |    |    |
|`rocksdb_filterpolicy_create`                                            |    |    |    |
|`rocksdb_filterpolicy_destroy`                                           |    |    |    |
|`rocksdb_filterpolicy_create_bloom`                                      |    |    |    |
|`rocksdb_mergeoperator_create`                                           |    |    |    |
|`rocksdb_mergeoperator_destroy`                                          |    |    |    |
|`rocksdb_readoptions_create`                                             |    |    |    |
|`rocksdb_readoptions_destroy`                                            |    |    |    |
|`rocksdb_readoptions_set_verify_checksums`                               |    |    |    |
|`rocksdb_readoptions_set_fill_cache`                                     |    |    |    |
|`rocksdb_readoptions_set_snapshot`                                       |    |    |    |
|`rocksdb_readoptions_set_iterate_upper_bound`                            |    |    |    |
|`rocksdb_readoptions_set_read_tier`                                      |    |    |    |
|`rocksdb_readoptions_set_tailing`                                        |    |    |    |
|`rocksdb_writeoptions_create`                                            |    |    |    |
|`rocksdb_writeoptions_destroy`                                           |    |    |    |
|`rocksdb_writeoptions_set_sync`                                          |    |    |    |
|`rocksdb_writeoptions_disable_wal`                                       |    |    |    |
|`rocksdb_flushoptions_create`                                            |    |    |    |
|`rocksdb_flushoptions_destroy`                                           |    |    |    |
|`rocksdb_flushoptions_set_wait`                                          |    |    |    |
|`rocksdb_cache_create_lru`                                               |    |    |    |
|`rocksdb_cache_destroy`                                                  |    |    |    |
|`rocksdb_create_default_env`                                             |    |    |    |
|`rocksdb_env_set_background_threads`                                     |    |    |    |
|`rocksdb_env_set_high_priority_background_threads`                       |    |    |    |
|`rocksdb_env_join_all_threads`                                           |    |    |    |
|`rocksdb_env_destroy`                                                    |    |    |    |
|`rocksdb_slicetransform_create`                                          |    |    |    |
|`rocksdb_slicetransform_create_fixed_prefix`                             |    |    |    |
|`rocksdb_slicetransform_create_noop`                                     |    |    |    |
|`rocksdb_slicetransform_destroy`                                         |    |    |    |
|`rocksdb_universal_compaction_options_create`                            |    |    |    |
|`rocksdb_universal_compaction_options_set_size_ratio`                    |    |    |    |
|`rocksdb_universal_compaction_options_set_min_merge_width`               |    |    |    |
|`rocksdb_universal_compaction_options_set_max_merge_width`               |    |    |    |
|`rocksdb_universal_compaction_options_set_max_size_amplification_percent`|    |    |    |
|`rocksdb_universal_compaction_options_set_compression_size_percent`      |    |    |    |
|`rocksdb_universal_compaction_options_set_stop_style`                    |    |    |    |
|`rocksdb_universal_compaction_options_destroy`                           |    |    |    |
|`rocksdb_fifo_compaction_options_create`                                 |    |    |    |
|`rocksdb_fifo_compaction_options_set_max_table_files_size`               |    |    |    |
|`rocksdb_fifo_compaction_options_destroy`                                |    |    |    |

### Backup (0 / 7)

|Command                        |impl|test|note|
|-------------------------------|:--:|:--:|----|
|`rocksdb_livefiles_count`      |    |    |    |
|`rocksdb_livefiles_name`       |    |    |    |
|`rocksdb_livefiles_level`      |    |    |    |
|`rocksdb_livefiles_size`       |    |    |    |
|`rocksdb_livefiles_smallestkey`|    |    |    |
|`rocksdb_livefiles_largestkey` |    |    |    |
|`rocksdb_livefiles_destroy`    |    |    |    |

### Misc (0 / 2)

|Command                          |impl|test|note|
|---------------------------------|:--:|:--:|----|
|`rocksdb_get_options_from_string`|    |    |    |
|`rocksdb_free`                   |    |    |    |

