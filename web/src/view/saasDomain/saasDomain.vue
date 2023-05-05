<template>
  <div>
    <div class="gva-search-box">
      <!--   Element ui     -->
      <el-form :inline="true" :model="searchInfo" class="demo-form-inline">
        <el-form-item>
          <el-button size="small" type="primary" icon="search" @click="onSubmit">查询</el-button>
          <el-button size="small" icon="refresh" @click="onReset">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="todo-item">
      <el-form :inline="true" :model="searchInfo" class="demo-form-inline">
        <el-form-item>
          <el-tag>TODO标签</el-tag>
          <el-tag type="info"> 完成了
          </el-tag>
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
                :disabled="!multipleSelection.length"
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
        <el-table-column type="selection" width="55"/>
        <el-table-column align="left" label="数据库实例集群ID" prop="ID" width="150"/>
        <el-table-column align="left" label="项目名称" prop="projName" width="150"/>
        <el-table-column align="left" label="集群名称" prop="domainName" width="300"/>
        <el-table-column align="left" label="高可用VIP" prop="vip" width="300"/>
        <el-table-column align="left" label="域名" prop="dns" width="300"/>
        <el-table-column align="left" label="按钮组">
          <template #default="scope">
            <el-row>
              <el-button
                  type="primary"
                  link
                  icon="search"
                  size="large"
                  class="table-button"
                  plain
                  @click="GetInstanceInfoByDomainID(scope.row)"
              >{{ '详情' }}
              </el-button>

              <el-button
                  type="success"
                  link
                  icon="edit"
                  size="large"
                  class="table-button"
                  plain
                  @click="updateDomainFunc(scope.row)"
              >变更

              </el-button>
              <el-button
                  type="danger"
                  link
                  icon="delete"
                  size="big"
                  plain
                  @click="deleteRow(scope.row)"
              >删除
              </el-button>
            </el-row>
          </template>
        </el-table-column>
      </el-table>
      <div class="gva-pagination">
        <el-pagination
            layout="total, sizes, prev, pager, next, jumper"
            :current-page="page"
            :page-size="pageSize"
            :page-sizes="[10, 30, 50, 100]"
            :total="total"
            @current-change="handleCurrentChange"
            @size-change="handleSizeChange"
        />
      </div>
    </div>
    <el-dialog v-model="dialogFormVisible" :before-close="closeDialog" title="新增domain信息">
      <el-form ref="elFormRef" :model="formData" label-position="right" :rules="rule" label-width="100px">
        <el-form-item label="DomainID:" prop="ID">
          <el-input v-model.number="formData.ID" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="DomainName:" prop="domainName">
          <el-input v-model="formData.domainName" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="projId:" prop="projId">
          <el-input v-model.number="formData.projId" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="vip:" prop="vip">
          <el-input v-model="formData.vip" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="dns:" prop="dns">
          <el-input v-model="formData.dns" :clearable="true" placeholder="请输入"/>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button size="small" @click="closeDialog">取 消</el-button>
          <el-button size="small" type="primary" @click="enterDialog">确 定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script>
import {findInstanceOfOneDomain} from "@/api/saasInstance";

export default {
  name: 'Domain',
// 获取对应实例的详细信息
  methods: {
    GetInstanceInfoByDomainID(row) {
      const data = {
        domainId: row.ID,
      }
      this.$router.push(
          {
            name: 'findInstanceOfOneDomain',
            query: data,
          }
      )
    }
  }
}
</script>

<script setup>
import {
  createDomain,
  deleteDomain,
  deleteDomainByIds,
  updateDomain,
  findDomain,
  getDomainList,
} from '@/api/saasDomain'

// 全量引入格式化工具 请按需保留
import {getDictFunc, formatDate, formatBoolean, filterDict} from '@/utils/format'
import {ElMessage, ElMessageBox} from 'element-plus'
import {ref, reactive} from 'vue'
import {findInstanceOfOneDomain} from '@/api/saasInstance'

// 自动化生成的字典（可能为空）以及字段
const formData = ref({
  ID: 0,
  domainName: '',
  projId: 0,
  projName: '',
  vip:'',
  dns:'',
})

// 验证规则
const rule = reactive({
  ID: [{
    required: true,
    message: 'ID is required',
    trigger: ['input', 'blur'],
  }],
  projId: [{
    required: true,
    message: 'projId is required',
    trigger: ['input', 'blur'],
  }],
})

const elFormRef = ref()

// =========== 表格控制部分 ===========
const page = ref(1)
const total = ref(0)
const pageSize = ref(10)
const tableData = ref([])
const searchInfo = ref({})

// 重置
const onReset = () => {
  searchInfo.value = {}
}

// 搜索
const onSubmit = () => {
  page.value = 1
  pageSize.value = 10
  getTableData()
}

// 分页
const handleSizeChange = (val) => {
  pageSize.value = val
  getTableData()
}

// 修改页面容量
const handleCurrentChange = (val) => {
  page.value = val
  getTableData()
}

// 查询
const getTableData = async () => {
  const table = await getDomainList({page: page.value, pageSize: pageSize.value, ...searchInfo.value})
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

getTableData()

// ============== 表格控制部分结束 ===============

// 获取需要的字典 可能为空 按需保留
const setOptions = async () => {
}

// 获取需要的字典 可能为空 按需保留
setOptions()

// 多选数据
const multipleSelection = ref([])
// 多选
const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

// 删除行
const deleteRow = (row) => {
  ElMessageBox.confirm('确定要删除吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning',
  }).then(() => {
    deleteDomainFunc(row)
  })
}

// 批量删除控制标记
const deleteVisible = ref(false)

// 多选删除
const onDelete = async () => {
  const ids = []
  if (multipleSelection.value.length === 0) {
    ElMessage({
      type: 'warning',
      message: '请选择要删除的数据',
    })
    return
  }
  multipleSelection.value &&
  multipleSelection.value.map(item => {
    ids.push(item.ID)
  })
  const res = await deleteDomainByIds({ids})
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '删除成功',
    })
    if (tableData.value.length === ids.length && page.value > 1) {
      page.value--
    }
    deleteVisible.value = false
    getTableData()
  }
}

// 行为控制标记（弹窗内部需要增还是改）
const type = ref('')

// 更新行
const updateDomainFunc = async (row) => {
  const res = await findDomain({ID: row.ID})
  console.log(row.ID)
  type.value = 'update'
  if (res.code === 0) {
    formData.value = res.data.redomain
    dialogFormVisible.value = true
  }
}

// 删除行
const deleteDomainFunc = async (row) => {
  const res = await deleteDomain({ID: row.ID})
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '删除成功',
    })
    if (tableData.value.length === 1 && page.value > 1) {
      page.value--
    }
    getTableData()
  }
}

// 弹窗控制标记
const dialogFormVisible = ref(false)

// 打开弹窗
const openDialog = () => {
  type.value = 'create'
  dialogFormVisible.value = true
}

// 关闭弹窗
const closeDialog = () => {
  dialogFormVisible.value = false
  formData.value = {
    domainName: '',
    ID: 0,
  }
}
// 弹窗确定
const enterDialog = async () => {
  elFormRef.value?.validate(async (valid) => {
    if (!valid) return
    let res
    switch (type.value) {
      case 'create':
        res = await createDomain(formData.value)
        break
      case 'update':
        res = await updateDomain(formData.value)
        break
      default:
        res = await createDomain(formData.value)
        break
    }
    if (res.code === 0) {
      ElMessage({
        type: 'success',
        message: '创建/更改成功',
      })
      closeDialog()
      getTableData()
    }
  })
}
</script>

<style>
</style>
