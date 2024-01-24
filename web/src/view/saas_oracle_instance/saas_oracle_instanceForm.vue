<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="instance_id:" prop="instanceId">
          <el-input v-model.number="formData.instanceId" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="db_id:" prop="dbId">
          <el-input v-model.number="formData.dbId" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="sid:" prop="sid">
          <el-input v-model="formData.sid" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="host_id:" prop="hostId">
          <el-input v-model.number="formData.hostId" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="version:" prop="version">
          <el-input v-model="formData.version" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="status:" prop="status">
          <el-input v-model.number="formData.status" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="url:" prop="url">
          <el-input v-model="formData.url" :clearable="true" placeholder="请输入" />
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
  name: 'SaasOracleInstance'
}
</script>

<script setup>
import {
  createSaasOracleInstance,
  updateSaasOracleInstance,
  findSaasOracleInstance
} from '@/api/saas_oracle_instance'

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from "vue-router"
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'
const route = useRoute()
const router = useRouter()

const type = ref('')
const formData = ref({
            instanceId: 0,
            dbId: 0,
            sid: '',
            hostId: 0,
            version: '',
            status: 0,
            url: '',
        })
// 验证规则
const rule = reactive({
})

const elFormRef = ref()

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findSaasOracleInstance({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.resaas_oracle_instance
        type.value = 'update'
      }
    } else {
      type.value = 'create'
    }
}

init()
// 保存按钮
const save = async() => {
      elFormRef.value?.validate( async (valid) => {
         if (!valid) return
            let res
           switch (type.value) {
             case 'create':
               res = await createSaasOracleInstance(formData.value)
               break
             case 'update':
               res = await updateSaasOracleInstance(formData.value)
               break
             default:
               res = await createSaasOracleInstance(formData.value)
               break
           }
           if (res.code === 0) {
             ElMessage({
               type: 'success',
               message: '创建/更改成功'
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
