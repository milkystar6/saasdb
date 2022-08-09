<template>
  <!-- div这里面是页面显示的东西 -->
  <div>
    {{ myName }}
<!--    <el-form-item>-->
<!--      <el-button size="small" type="primary" icon="search" @click="onSubmit"></el-button>-->
<!--    </el-form-item>-->
  </div>
</template>

<script>
export default {
  name: 'Index',
}
</script>
<script setup>
import { ref } from 'vue'

const myName = ref('计划任务管理建设中 ...... ')
</script>
