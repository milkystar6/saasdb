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
        ref="multipleTable"
        style="width: 100%"
        tooltip-effect="dark"
        :data="tableData"
        row-key="ID"
        @selection-change="handleSelectionChange"
      >
        <!--        <el-table-column align="left" label="参数名称" prop="tableData" width="100"/>-->
        <!--        <el-table-column align="left" label="参数值" prop="tableData" width="150"/>-->
        <el-table border style="margin-top: 50px;" :data="transData">
          <el-table-column
            v-for="(item, index) in transTitle"
            :key="index"
            :label="item"
            align="center"
          >
            <template slot-scope="scope">
              {{ scope.row[index] }}
            </template>
          </el-table-column>

        </el-table>
        <el-table-column align="left" label=" ">
          <template #default="scope">
            <el-button
              type="primary"
              link
              icon="edit"
              size="small"
              class="table-button"
              @click="getProcesslistByRows(scope.row)"
            > 修改参数
            </el-button>
          </template>
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
      tableData: [
        {
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
        },
      ]
    }
  },
  created() {
    if (JSON.stringify(this.$route.query) !== '{}') {
      const data = {
        ...this.$route.query,
      }
      console.log('>>>>>', data)
      showVariables(data).then(res => {
        console.log(res.data)
        this.tableData.value = res.data.variables_value || []
        const matrixData = this.tableData.map((row) => {
          const arr = []
          for (const key in row) {
            arr.push(row[key])
          }
          return arr
        })
        console.log(arr)
        // 加入标题拼接最终的数据
        this.transData = matrixData[0].map((col, i) => {
          return [this.originTitle[i], ...matrixData.map((row) => {
            return row[i]
          })]
        })
        console.log('xxxxx', this.transData)
      })
    }

  },
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
