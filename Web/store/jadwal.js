export const state = () => ({
    jadwal: {
      data: [],
      total: 0,
      current_page: 1
    },
    jadwalLoader: false,
    // summary: {
    //     aktif: 0,
    //     non_aktif: 0
    // }
  })

  export const mutations = {
    setJadwal(state, data) {
      state.jadwal = data
    },
    setLoader(state){
        state.jadwalLoader = !state.jadwalLoader
    },
    setPage(state, data){
        state.semester.current_page = data
    },
    // setSummary(state, data){
    //     state.summary = data
    // }
  }

  export const getters = {
    getJadwal(state) {
         return state.jadwal
    },
    getLoader(state){
        return state.jadwalLoader
    },
    // getSummary(state){
    //     return state.summary
    // }
  };

  export const actions = {
    getAll(context, {showall = 1, search = '', defaultPage = false, kelas_id = '', semester_id = ''}){
        context.commit('setLoader')
        let page = defaultPage ? 1 : context.state.jadwal.current_page
        this.$axios.get(`/jadwal_pelajarans?showall=${showall}&page=${page}&search=${search}&kelas_id=${kelas_id}&semester_id=${semester_id}`).then(resp => {
            context.commit('setJadwal', resp.data)
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
