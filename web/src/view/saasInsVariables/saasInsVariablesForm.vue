<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="ID:" prop="ID">
          <el-input v-model.number="formData.ID" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="USER:" prop="USER">
          <el-input v-model.number="formData.USER" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="HOST:" prop="HOST">
          <el-input v-model="formData.HOST" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="DB:" prop="DB">
          <el-input v-model.number="formData.DB" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="COMMAND:" prop="COMMAND">
          <el-input v-model.number="formData.COMMAND" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="STATE:" prop="STATE">
          <el-input v-model.number="formData.STATE" :clearable="true" placeholder="请输入"/>
        </el-form-item>
        <el-form-item label="INFO:" prop="INFO">
          <el-input v-model.number="formData.INFO" :clearable="true" placeholder="请输入"/>
          <el-button size="mini" type="primary" @click="save">保存</el-button>
          <el-button size="mini" type="primary" @click="back">返回</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'InsVariablesForm',
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
  USER: 0,
  HOST: '',
  DB: '',
  COMMAND: 0,
  TIME: '',
  STATE: '',
})
// 验证规则
const rule = reactive({
  ID: [{
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
