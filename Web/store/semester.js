export const state = () => ({
    semester: {
      data: [],
      total: 0,
      current_page: 1
    },
    semesterLoader: false,
    // summary: {
    //     aktif: 0,
    //     non_aktif: 0
    // }
  })

  export const mutations = {
    setSemester(state, data) {
      state.semester = data
    },
    setLoader(state){
        state.semesterLoader = !state.semesterLoader
    },
    setPage(state, data){
        state.semester.current_page = data
    },
    // setSummary(state, data){
    //     state.summary = data
    // }
  }

  export const getters = {
    getSemester(state) {
         return state.semester
    },
    getLoader(state){
        return state.semesterLoader
    },
    // getSummary(state){
    //     return state.summary
    // }
  };

  export const actions = {
    getAll(context, {showall = 1, search = '', defaultPage = false}){
        context.commit('setLoader')
        let page = defaultPage ? 1 : context.state.semester.current_page
        this.$axios.get(`/semesters?showall=${showall}&page=${page}&search=${search}`).then(resp => {
            context.commit('setSemester', resp.data)
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
