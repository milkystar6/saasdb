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
            <el-button icon="delete" size="small" style="margin-left: 10px;"
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
        <!--        <el-table-column type="selection" width="55"/>-->
        <!--        <el-table-column align="left" label="日期" width="180">-->
        <!--          <template #default="scope">{{ formatDate(scope.row.CreatedAt) }}</template>-->
        <!--        </el-table-column>-->
        <el-table-column align="left" label="ID" prop="ID" width="100"/>
        <el-table-column align="left" label="USER" prop="USER" width="150"/>
        <el-table-column align="left" label="HOST" prop="HOST" width="150"/>
        <el-table-column align="left" label="DB" prop="DB" width="200"/>
        <el-table-column align="left" label="COMMAND" prop="COMMAND" width="120"/>
        <el-table-column align="left" label="STATE" prop="STATE" width="250"/>
        <el-table-column align="left" label="INFO" prop="INFO" width="300"/>
        <el-table-column align="left" label="查询连接" >
          <template #default="scope">
            <el-button type="primary" link icon="edit" size="small" class="table-button"
                       @click="StopProcesslistById(scope.row)"
            > 停止会话
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
import { showinsprocesslist } from '@/api/saas_insShowProcesslist'

export default {
  name: 'showinsprocesslist',
  data(){
    return {
      tableData:[]
    }
  },
  created() {
    if (JSON.stringify(this.$route.query) !== '{}') {
      const data = {
        ...this.$route.query,
      }
      showinsprocesslist(data).then(res =>{
        console.log(res.data.processlist.ProcessListInfo)
        this.tableData = res.data.processlist.ProcessListInfo || []
      })
    }
  },
}
</script>
<script setup>
import { stopprocesslist } from  '@/api/saas_insShowProcesslist'
import {ElMessage, ElMessageBox} from "element-plus";
const StopProcesslistById = (row) => {
  ElMessageBox.confirm('确定要stop该会话吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(() => {
    stopProcessFunc(row)
  })
}
const stopProcessFunc = async(row) => {
  const res =await stopprocesslist({ ID: row.ID })
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: 'stop会话成功',
    })
    if (tableData.value.length === 1 && page.value > 1) {
      page.value--
    }
    // getTableData()
  }

}

</script>

