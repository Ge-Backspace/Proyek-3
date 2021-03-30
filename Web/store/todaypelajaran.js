export const state = () => ({
    todaypelajaran: {
      all_jadwal: [],
      current_jadwal: '',
    },
    compLoader: false,
    })

  export const mutations = {
    setData(state, data) {
      state.todaypelajaran = data
    },
    setLoader(state){
        state.compLoader = !state.compLoader
    },
  }

  export const getters = {
    getTodayPelajaran(state) {
         return state.todaypelajaran
    },
    getLoader(state){
        return state.compLoader
    },
  };

  export const actions = {
    getAll(context, {user_id = '', pelajaran_id = ''}){
        context.commit('setLoader')
        this.$axios.get(`/check?user_id=${user_id}&pelajaran_id=${pelajaran_id}`).then(resp => {
          context.commit('setData', resp.data.data)
      }).catch(e => {
          console.log(e)
      }).finally(() => {
          context.commit('setLoader')
      })
    },
  }
