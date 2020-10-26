const {countries} = require('./countries.js')
const axios = require('axios')

const URL = 'https://api.reliefweb.int/v1/disasters?appname=omundoagora&profile=full&offset=0&limit=10&preset=latest'

function getAffectedCountries() {
  return axios.get(URL).then(result => {
    let affectedCountries = []
    for (let disaster of result.data.data) {
      affectedCountries.push(countries.find(country => country.iso3 == disaster.fields.country[0].iso3))
    }
    return affectedCountries
  })
}

exports.getAffectedCountries = getAffectedCountries