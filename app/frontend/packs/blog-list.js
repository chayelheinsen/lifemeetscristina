import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import BlogList from '../components/blog-list.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  let element = document.querySelector('#blog-list')

  if (element) {
    const app = new Vue({
      el: element,
      data: {
        posts: JSON.parse(element.dataset.posts),
        showSearch: !!~~element.dataset.showSearch
      },
      template: "<BlogList :posts='posts' :showSearch='showSearch' />",
      components: { BlogList }
    })
  }
})
