export const state = () => ({
    kelas: {
      data: [],
      total: 0,
      current_page: 1
    },
    kelasLoader: false,
    // summary: {
    //     aktif: 0,
    //     non_aktif: 0
    // }
  })

  export const mutations = {
    setKelas(state, data) {
      state.kelas = data
    },
    setLoader(state){
        state.kelasLoader = !state.kelasLoader
    },
    setPage(state, data){
        state.kelas.current_page = data
    },
    // setSummary(state, data){
    //     state.summary = data
    // }
  }

  export const getters = {
    getKelas(state) {
         return state.kelas
    },
    getLoader(state){
        return state.kelasLoader
    },
    // getSummary(state){
    //     return state.summary
    // }
  };

  export const actions = {
    getAll(context, {showall = 1, search = '', defaultPage = false}){
        context.commit('setLoader')
        let page = defaultPage ? 1 : context.state.kelas.current_page
        this.$axios.get(`/kelas?$showall=${showall}&page=${page}&search=${search}`).then(resp => {
            context.commit('setKelas', resp.data)
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
