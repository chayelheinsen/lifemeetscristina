<template>
  <div class='blog-post'>
    <a v-bind:href='post.url'>
      <div class='text-container'>
        <div class='image' v-bind:style="{ backgroundImage: `url('${post.image.url}')`, backgroundSize: 'cover' }"></div>
        <span class='date'>{{ post.published_at_string }}</span>
        <h2 class='blog-title'>{{ post.title }}</h2>
        <p class='description'>{{ post.truncated_description }}</p>
        <p></p>
        <p class='read-more'>READ MORE</p>
      </div>
    </a>
  </div>
</template>

<script>
export default {
  props: {
    post: {
      type: Object,
      required: true
    },
  },
  methods: {
  }
}
</script>
