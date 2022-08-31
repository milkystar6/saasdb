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
        <el-table-column align="left" label="参数名称" prop="tableData" width="100"/>
        <el-table-column align="left" label="参数值" prop="tableData" width="150"/>
        <el-table-column align="left" label=" ">
          <template #default="scope">
            <el-button type="primary" link icon="edit" size="small" class="table-button"
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
  name: 'showVariables',
  data() {
    return {
      tableData: "",
    }
  },
  created() {
    if (JSON.stringify(this.$route.query) !== '{}') {
      const data = {
        ...this.$route.query,
      }
      console.log('>>>>>',data)
      showVariables(data).then(res => {
        console.log(res.data)
        this.tableData = res.data.variables_value
      }).catch(res => {
        console.log('cuowu',res)
        this.tableData = res.data.variables_value
      })
    }
  },
}
</script>
