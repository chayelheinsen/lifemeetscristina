<template>
  <div id="blog-list" class="blog-list blog-content">
    <BlogItem v-for="post in posts" :key='post.id' :post='post'></BlogItem>
  </div>
</template>

<script>
import BlogItem from './blog-item.vue'

export default {
  props: ['posts'],
  components: { BlogItem }
}
</script>

<style scoped>

</style>
