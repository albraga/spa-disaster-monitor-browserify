const Vue = require('vue')
const {getAffectedCountries} = require('./api.js')


const { createApp } = Vue

const rootComponent = {
  data() {
    return {
      affected: []
    }
  },
  beforeCreate() {
    getAffectedCountries().then(affectedCountries => {
      this.affected = affectedCountries
    })
  },
  mounted() {

  }
}

const app = createApp(rootComponent)
app.mount('#app')