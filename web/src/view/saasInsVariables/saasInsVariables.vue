<template>
  <div>
    <div class="gva-search-box">
      <el-form :inline="true" :model="searchInfo" class="demo-form-inline">
        <el-form-item>
          <el-button size="small" type="primary" icon="search" @click="onSubmit">查询</el-button>
          <el-button size="small" icon="refresh" @click="onReset">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="gva-table-box">
      <div class="gva-btn-list">
        <el-button size="small" type="primary" icon="plus" @click="openDialog">新增</el-button>
        <el-popover v-model:visible="deleteVisible" placement="top" width="160">
          <p>确定要删除吗？</p>
          <div style="text-align: right; margin-top: 8px;">
            <el-button size="small" type="primary" link @click="deleteVisible = false">取消</el-button>
            <el-button size="small" type="primary" @click="onDelete">确定</el-button>
          </div>
          <template #reference>
            <el-button
                icon="delete"
                size="small"
                style="margin-left: 10px;"
                @click="deleteVisible = true"
            >删除
            </el-button>
          </template>
        </el-popover>
      </div>
      <el-table
          style="width: 100%"
          :data="getTableData"
          :show-header="false"
      >
        <el-table-column
            v-for="(item, index) in getTableTitle"
            :key="index"
            :prop="item"
        >
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import { showVariables } from '@/api/saasInsVariables'

export default {
  name: 'ShowVariables',
  data() {
    return {
      tableTitle: [
        {
          prop: 'innodb_adaptive_flushing',
          label: 'innodb_adaptive_flushing',
        },
        {
          prop: 'innodb_buffer_pool_size',
          label: 'innodb_buffer_pool_size',
        },
        {
          prop: 'innodb_doublewrite',
          label: 'innodb_doublewrite',
        },
        {
          prop: 'innodb_flush_log_at_trx_commit',
          label: 'innodb_flush_log_at_trx_commit',
        },
        {
          prop: 'innodb_io_capacity',
          label: 'innodb_io_capacity',
        },
        {
          prop: 'innodb_lock_wait_timeout',
          label: 'innodb_lock_wait_timeout',
        },
        {
          prop: 'innodb_log_file_size',
          label: 'innodb_log_file_size',
        },
        {
          prop: 'innodb_log_files_in_group',
          label: 'innodb_log_files_in_group',
        },
        {
          prop: 'innodb_read_only',
          label: 'innodb_read_only',
        },
        {
          prop: 'sql_mode',
          label: 'SQL MODE',
        },
        {
          prop: 'sync_binlog',
          label: 'sync_binlog',
        },
        {
          prop: 'transaction_isolation',
          label: 'transaction_isolation',
        },
        {
          prop: 'version',
          label: '版本',
        },
      ],
      tableData: []
    }
  },
  created() {
    if (JSON.stringify(this.$route.query) !== '{}') {
      const data = {
        ...this.$route.query,
      }
      showVariables(data).then(res => {
        const a = res.data.variables_value || []
        this.tableData.push(a)
      })
    }
  },

  computed: {
    getTableTitle() {
      return this.tableData.reduce((pre, cur, index) => pre.concat(`value${index}`), ['title'])
    },
    getTableData() {
      return this.tableTitle.map(item => {
        return this.tableData.reduce((pre, cur, index) => Object.assign(pre, {['value' + index]: cur[item.prop]}), {'title': item.label,});
      });
    }
  }
}
</script>

<script setup>
import { ref } from 'vue'

// eslint-disable-next-line no-unused-vars
const formData = ref({
  innodb_adaptive_flushing: 0,
  innodb_adaptive_hash_index: '',
  innodb_buffer_pool_size: 0,
  innodb_doublewrite: '',
  innodb_flush_log_at_trx_commit: '',
  innodb_io_capacity: '',
  innodb_lock_wait_timeout: '',
  innodb_log_file_size: '',
  innodb_log_files_in_group: '',
  innodb_read_only: '',
  sql_mode: '',
  sync_binlog: '',
  transaction_isolation: '',
  version: ''
})
</script>
