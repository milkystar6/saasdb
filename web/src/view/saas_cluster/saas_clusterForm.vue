<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="各个domain ids:" prop="domain_ids">
          <el-input v-model="formData.domain_ids" :clearable="false" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="cluster_name:" prop="cluste_name">
          <el-input v-model="formData.cluste_name" :clearable="false" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="项目组ID:" prop="proj_id">
          <el-input v-model.number="formData.proj_id" :clearable="true" placeholder="请输入" />
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
  name: 'Cluster'
}
</script>

<script setup>
import {
  createCluster,
  updateCluster,
  findCluster
} from '@/api/saas_cluster'

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from "vue-router"
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'
const route = useRoute()
const router = useRouter()

const type = ref('')
const formData = ref({
            domain_ids: '',
            cluste_name: '',
            proj_id: 0,
        })
// 验证规则
const rule = reactive({
               domain_ids : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               cluste_name : [{
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
      const res = await findCluster({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.recluster
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
               res = await createCluster(formData.value)
               break
             case 'update':
               res = await updateCluster(formData.value)
               break
             default:
               res = await createCluster(formData.value)
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
