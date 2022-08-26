<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="ID:" prop="ID">
          <el-input v-model.number="formData.ID" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="projId:" prop="projId">
          <el-input v-model.number="formData.projId" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="ip:" prop="ip">
          <el-input v-model="formData.ip" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="port:" prop="port">
          <el-input v-model.number="formData.port" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="application:" prop="application">
          <el-select v-model="formData.application" placeholder="请选择" style="width:100%" :clearable="true">
            <el-option v-for="item in ['oracle','mysql','redis','mongodb','tidb']" :key="item" :label="item"
                       :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="version:" prop="version">
          <el-input v-model="formData.version" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="useType:" prop="useType">
          <el-select v-model="formData.useType" placeholder="请选择" style="width:100%" :clearable="true">
            <el-option v-for="item in ['正式','线上测试','预发布']" :key="item" :label="item" :value="item"/>
          </el-select>
        </el-form-item>
        <el-form-item label="health:" prop="health">
          <el-select v-model="formData.health" placeholder="请选择" style="width:100%" :clearable="true">
            <el-option v-for="item in ['available','unavailable','restarting','starting','stoping','migrating']"
                       :key="item" :label="item" :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="role:" prop="role">
          <el-select v-model="formData.role" placeholder="请选择" style="width:100%" :clearable="true">
            <el-option v-for="item in ['master','slaveforha','slaveonly']" :key="item" :label="item" :value="item"/>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button size="mini" type="primary" @click="save">保存</el-button>
          <el-button size="mini" type="primary" @click="back">返回</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Instance',
}
</script>

<script setup>
import {
  createInstance,
  updateInstance,
  findInstance,
} from '@/api/saasInstance'

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'

const route = useRoute()
const router = useRouter()

const type = ref('')

const formData = ref({
  ID: 0,
  USER: '',
  HOST: '',
  DB: '',
  COMMAND: '',
  STATE: '',
  INFO: '',
})
// 验证规则
const rule = reactive({
  ip: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  }],
  port: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  }],
  application: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  }],
})

const elFormRef = ref()

// 初始化方法
const init = async() => {
  // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
  if (route.query.id) {
    const res = await findInstance({ ID: route.query.id })
    if (res.code === 0) {
      formData.value = res.data.resaas_instance
      type.value = 'update'
    }
  } else {
    type.value = 'create'
  }
}

init()
// 保存按钮
const save = async() => {
  elFormRef.value?.validate(async(valid) => {
    if (!valid) return
    let res
    switch (type.value) {
      case 'create':
        res = await createInstance(formData.value)
        break
      case 'update':
        res = await updateInstance(formData.value)
        break
      default:
        res = await createInstance(formData.value)
        break
    }
    if (res.code === 0) {
      ElMessage({
        type: 'success',
        message: '创建/更改成功',
      })
    }
  })
}

// 返回按钮
const back = () => {
  router.go(-1)
}

</script>

<style>
</style>
