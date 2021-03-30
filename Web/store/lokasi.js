export const state = () => ({
    lokasi: {
      data: [],
      total: 0,
      current_page: 1
    },
    lokasiLoader: false,
    // summary: {
    //     aktif: 0,
    //     non_aktif: 0
    // }
  })

  export const mutations = {
    setLokasi(state, data) {
      state.lokasi = data
    },
    setLoader(state){
        state.lokasiLoader = !state.lokasiLoader
    },
    setPage(state, data){
        state.lokasi.current_page = data
    },
    // setSummary(state, data){
    //     state.summary = data
    // }
  }

  export const getters = {
    getLokasi(state) {
         return state.lokasi
    },
    getLoader(state){
        return state.lokasiLoader
    },
    // getSummary(state){
    //     return state.summary
    // }
  };

  export const actions = {
    getAll(context, {showall = 1, search = '', defaultPage = false}){
        context.commit('setLoader')
        let page = defaultPage ? 1 : context.state.lokasi.current_page
        this.$axios.get(`/lokasis?showall=${showall}&page=${page}&search=${search}`).then(resp => {
            context.commit('setLokasi', resp.data)
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
