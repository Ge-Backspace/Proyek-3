export const state = () => ({
  coordinate: {
    data: [],
    center: '',
  },
  compLoader: false,
})

export const mutations = {
  setCoordinate(state, data) {
    state.coordinate.data = data
  },
  setCenter(state, data) {
    state.coordinate.center = data
  },
  setLoader(state){
    state.compLoader = !state.compLoader
  },
}

export const getters = {
  getCoordinate(state) {
    return state.coordinate
  },
  getLoader(state){
    return state.compLoader
  },
};

export const actions = {
  getLocation(context){
    context.commit('setLoader')
    this.$axios.get(`/coordinate`).then(resp => {
        context.commit('setCoordinate', resp.data.data.data)
        context.commit('setCenter', resp.data.data.center)
    }).catch(e => {
        console.log(e)
    }).finally(() => {
        context.commit('setLoader')
    })
  },
}
