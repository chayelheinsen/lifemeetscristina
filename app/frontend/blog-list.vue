<template>
  <div id="blog-list" class="blog-list blog-content">
    <div v-for='post in posts' class="blog-post">
        <a v-bind:href='urlForPost(post)'>
          <div class="text-container">
            <div class="image" v-bind:style="{ backgroundImage: `url('${post.image.url}')`, backgroundSize: 'cover' }"></div>
            <span class="date">{{ post.published_at_string }}</span>
            <h2 class="blog-title">{{ post.title }}</h2>
            <p class="description">{{ truncated_description(post) }}</p>
            <p></p>
            <p class="read-more">READ MORE</p>
          </div>
        </a>
    </div>
  </div>
</template>

<script>
export default {
  props: ['posts'],
  methods: {
    urlForPost(post) {
      return `/posts/${post.id}`
    },
    truncated_description(post) {
      return post.content.substring(0, 160).trim() + '...'
    }
  }
}
</script>

<style scoped>

</style>
