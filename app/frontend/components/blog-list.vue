<template>
  <div class='blogs'>
    <div class='blog-filter' v-if='showSearch'>
      <input id='search-input'
        type='text'
        v-model='search'
        placeholder="Search Blogs"
        onfocus="this.placeholder=''"
        onblur="this.placeholder='Search Blogs'"
      />
      <label id='search-label'>Search Blogs</label>
      <span class="close" id="close" @click='clearSearch'>×</span>
    </div>
    <div id='blog-list' class='blog-list blog-content'>
      <BlogItem v-for='post in filteredPosts' :key='post.id' :post='post' class='card'></BlogItem>
    </div>
  </div>
</template>

<script>
import BlogItem from './blog-item.vue'
import { uniq } from 'lodash/array'

export default {
  data: function() {
    return {
      search: ''
    }
  },
  props: ['posts', 'showSearch'],
  components: { BlogItem },
  computed: {
    filteredPosts() {
      const search = this.search.toLowerCase()
      const title = this.posts.filter(post => post.title.toLowerCase().includes(search))
      // const content = this.posts.filter(post => post.content.toLowerCase().includes(search))
      const category = this.posts.filter(post => post.category.name.toLowerCase().includes(search))

      let items = title.concat(category)
      return uniq(items)
    }
  },
  methods: {
    clearSearch() {
      this.search = ''
    }
  }
}
</script>

<style scoped>

.blogs {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.card {
  box-shadow: rgba(0, 0, 0, 0.117647) 0px 1px 6px, rgba(0, 0, 0, 0.117647) 0px 1px 4px;
  transition: .15s all ease-in-out;

  &:hover {
   transform: scale(1.01);
  }
}

#close {
  position: absolute;
  top: 29px;
  right: -30px;
  font-size: 20px;
}
</style>
