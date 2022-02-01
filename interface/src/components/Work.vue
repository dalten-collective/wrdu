<template>
  <div class="flex flex-row">
    <div class="w-32 h-32 mr-2 text-3xl border border-gray-400" v-for="s in spaces" :key="s">
      {{ s }}
    </div>
  </div>
</template>

<script>
export default {
  props: [
    'spaces'
  ],
}
</script>
