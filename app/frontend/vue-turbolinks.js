// https://github.com/jeffreyguenther/vue-turbolinks

function handleVueDestructionOn(turbolinksEvent, vue) {
  document.addEventListener(turbolinksEvent, function teardown() {
    vue.$destroy();
    document.removeEventListener(turbolinksEvent, teardown);
  });
}

function plugin(Vue, options) {
  // Install a global mixin
  Vue.mixin({

    beforeMount: function() {
      // If this is the root component, we want to cache the original element contents to replace later
      // We don't care about sub-components, just the root

      // Using before-cache instead of visit because the component gets removed too early causing
      // the screen to go empty
      if (this == this.$root) {
        handleVueDestructionOn('turbolinks:before-cache', this);
        this.$originalEl = this.$el.outerHTML;
      }
    },

    destroyed: function() {
      // We only need to revert the html for the root component
      if (this == this.$root && this.$el) {
        this.$el.outerHTML = this.$originalEl;
      }
    }
  })
};

export default plugin;
