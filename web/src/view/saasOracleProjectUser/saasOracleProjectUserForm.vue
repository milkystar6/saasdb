<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="用户名:" prop="user_name">
          <el-input v-model="formData.user_name" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="Oracle数据库id:" prop="db_id">
          <el-input v-model.number="formData.db_id" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="项目ID:" prop="projId">
          <el-input v-model.number="formData.projId" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="oracle schema id:" prop="user_id">
          <el-input v-model.number="formData.user_id" :clearable="true" placeholder="请输入" />
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
  name: 'SaasOracleProjectUser'
}
</script>

<script setup>
import {
  createSaasOracleProjectUser,
  updateSaasOracleProjectUser,
  findSaasOracleProjectUser
} from '@/api/saasOracleProjectUser'

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from "vue-router"
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'
const route = useRoute()
const router = useRouter()

const type = ref('')
const formData = ref({
            user_name: '',
            db_id: 0,
            projId: 0,
            user_id: 0,
        })
// 验证规则
const rule = reactive({
               user_name : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
})

const elFormRef = ref()

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findSaasOracleProjectUser({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.resaas_oracle_project_user
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
               res = await createSaasOracleProjectUser(formData.value)
               break
             case 'update':
               res = await updateSaasOracleProjectUser(formData.value)
               break
             default:
               res = await createSaasOracleProjectUser(formData.value)
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
