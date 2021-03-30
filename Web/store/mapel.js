export const state = () => ({
    mapel: {
      data: [],
      total: 0,
      current_page: 1
    },
    mapelLoader: false,
    // summary: {
    //     aktif: 0,
    //     non_aktif: 0
    // }
  })

  export const mutations = {
    setMapel(state, data) {
      state.mapel = data
    },
    setLoader(state){
        state.mapelLoader = !state.mapelLoader
    },
    setPage(state, data){
        state.mapel.current_page = data
    },
    // setSummary(state, data){
    //     state.summary = data
    // }
  }

  export const getters = {
    getMapel(state) {
         return state.mapel
    },
    getLoader(state){
        return state.mapelLoader
    },
    // getSummary(state){
    //     return state.summary
    // }
  };

  export const actions = {
    getAll(context, {showall = 1, search = '', defaultPage = false}){
        context.commit('setLoader')
        let page = defaultPage ? 1 : context.state.mapel.current_page
        this.$axios.get(`/pelajarans?showall=${showall}&page=${page}&search=${search}`).then(resp => {
            context.commit('setMapel', resp.data)
        }).catch(e => {
            console.log(e)
        }).finally(() => {
            context.commit('setLoader')
        })
    },
    // getUserSummary(context){
    //     this.$axios.get(`/user-summary`).then(resp => {
    //         context.commit('setSummary', resp.data.data)
    //     }).catch(e => {
    //         console.log(e)
    //     }).finally(() => {
    //         // context.commit("setLoader")
    //     })
    // }
  }
