import Vue from 'vue'
import Vuex from 'vuex'
import Meta from 'vue-meta'
import ClientOnly from 'vue-client-only'
import NoSsr from 'vue-no-ssr'
import { createRouter } from './router.js'
import NuxtChild from './components/nuxt-child.js'
import NuxtError from './components/nuxt-error.vue'
import Nuxt from './components/nuxt.js'
import App from './App.js'
import { setContext, getLocation, getRouteData, normalizeError } from './utils'
import { createStore } from './store.js'

/* Plugins */

import nuxt_plugin_plugin_1bc2fd20 from 'nuxt_plugin_plugin_1bc2fd20' // Source: .\\components\\plugin.js (mode: 'all')
import nuxt_plugin_moment_5b46a665 from 'nuxt_plugin_moment_5b46a665' // Source: .\\moment.js (mode: 'all')
import nuxt_plugin_axios_02789d93 from 'nuxt_plugin_axios_02789d93' // Source: .\\axios.js (mode: 'all')
import nuxt_plugin_templatesplugin0ef13b0c_008fc4be from 'nuxt_plugin_templatesplugin0ef13b0c_008fc4be' // Source: .\\templates.plugin.0ef13b0c.js (mode: 'all')
import nuxt_plugin_helper_0bc87e87 from 'nuxt_plugin_helper_0bc87e87' // Source: ..\\plugins\\helper (mode: 'all')
import nuxt_plugin_vuesax_248aab7d from 'nuxt_plugin_vuesax_248aab7d' // Source: ..\\plugins\\vuesax (mode: 'all')
import nuxt_plugin_extablecolumn_82eb25d0 from 'nuxt_plugin_extablecolumn_82eb25d0' // Source: ..\\plugins\\extablecolumn (mode: 'all')
import nuxt_plugin_vuegeolocation_276efa99 from 'nuxt_plugin_vuegeolocation_276efa99' // Source: ..\\plugins\\vuegeolocation (mode: 'all')
import nuxt_plugin_vuegooglemaps_9398d546 from 'nuxt_plugin_vuegooglemaps_9398d546' // Source: ..\\plugins\\vuegooglemaps (mode: 'all')
import nuxt_plugin_vcalendar_37ff9c3b from 'nuxt_plugin_vcalendar_37ff9c3b' // Source: ..\\plugins\\vcalendar (mode: 'client')
import nuxt_plugin_swal_d9d73ab0 from 'nuxt_plugin_swal_d9d73ab0' // Source: ..\\plugins\\swal (mode: 'client')
import nuxt_plugin_vue2editor_50d6bb9c from 'nuxt_plugin_vue2editor_50d6bb9c' // Source: ..\\plugins\\vue2editor (mode: 'client')
import nuxt_plugin_chart_223dba6a from 'nuxt_plugin_chart_223dba6a' // Source: ..\\plugins\\chart (mode: 'client')
import nuxt_plugin_plugin_ef9a59fc from 'nuxt_plugin_plugin_ef9a59fc' // Source: .\\auth\\plugin.js (mode: 'all')

// Component: <ClientOnly>
Vue.component(ClientOnly.name, ClientOnly)

// TODO: Remove in Nuxt 3: <NoSsr>
Vue.component(NoSsr.name, {
  ...NoSsr,
  render (h, ctx) {
    if (process.client && !NoSsr._warned) {
      NoSsr._warned = true

      console.warn('<no-ssr> has been deprecated and will be removed in Nuxt 3, please use <client-only> instead')
    }
    return NoSsr.render(h, ctx)
  }
})

// Component: <NuxtChild>
Vue.component(NuxtChild.name, NuxtChild)
Vue.component('NChild', NuxtChild)

// Component NuxtLink is imported in server.js or client.js

// Component: <Nuxt>
Vue.component(Nuxt.name, Nuxt)

Object.defineProperty(Vue.prototype, '$nuxt', {
  get() {
    return this.$root.$options.$nuxt
  },
  configurable: true
})

Vue.use(Meta, {"keyName":"head","attribute":"data-n-head","ssrAttribute":"data-n-head-ssr","tagIDKeyName":"hid"})

const defaultTransition = {"name":"page","mode":"out-in","appear":false,"appearClass":"appear","appearActiveClass":"appear-active","appearToClass":"appear-to"}

const originalRegisterModule = Vuex.Store.prototype.registerModule
const baseStoreOptions = { preserveState: process.client }

function registerModule (path, rawModule, options = {}) {
  return originalRegisterModule.call(this, path, rawModule, { ...baseStoreOptions, ...options })
}

async function createApp(ssrContext, config = {}) {
  const router = await createRouter(ssrContext)

  const store = createStore(ssrContext)
  // Add this.$router into store actions/mutations
  store.$router = router

  // Fix SSR caveat https://github.com/nuxt/nuxt.js/issues/3757#issuecomment-414689141
  store.registerModule = registerModule

  // Create Root instance

  // here we inject the router and store to all child components,
  // making them available everywhere as `this.$router` and `this.$store`.
  const app = {
    head: {"title":"Afsen","meta":[{"charset":"utf-8"},{"name":"viewport","content":"width=device-width, initial-scale=1"},{"hid":"description","name":"description","content":""}],"link":[{"rel":"stylesheet","href":"\u002Fassets\u002Fvendor\u002Felement-ui\u002Findex.css"},{"rel":"icon","type":"image\u002Fx-icon","href":"\u002FAfsen-Icon.png"},{"rel":"stylesheet","href":"https:\u002F\u002Ffonts.googleapis.com\u002Ficon?family=Material+Icons"},{"rel":"stylesheet","href":"https:\u002F\u002Ffonts.googleapis.com\u002Fcss?family=Poppins:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap"},{"rel":"stylesheet","href":"https:\u002F\u002Fmaxst.icons8.com\u002Fvue-static\u002Flandings\u002Fline-awesome\u002Fline-awesome\u002F1.3.0\u002Fcss\u002Fline-awesome.min.css"},{"rel":"stylesheet","href":"https:\u002F\u002Fcdnjs.cloudflare.com\u002Fajax\u002Flibs\u002Fbulma\u002F0.9.0\u002Fcss\u002Fbulma.min.css"}],"script":[{"src":"\u002Fassets\u002Fvendor\u002Fjquery\u002Fdist\u002Fjquery.min.js"},{"src":"\u002Fassets\u002Fvendor\u002Fbootstrap\u002Fdist\u002Fjs\u002Fbootstrap.bundle.min.js"},{"src":"\u002Fassets\u002Fvendor\u002Fjs-cookie\u002Fjs.cookie.js"},{"src":"\u002Fassets\u002Fvendor\u002Fjquery.scrollbar\u002Fjquery.scrollbar.min.js"},{"src":"\u002Fassets\u002Fvendor\u002Fjquery-scroll-lock\u002Fdist\u002Fjquery-scrollLock.min.js"},{"src":"\u002Fassets\u002Fvendor\u002Fchart.js\u002Fdist\u002FChart.min.js"},{"src":"\u002Fassets\u002Fvendor\u002Fchart.js\u002Fdist\u002FChart.extension.js"},{"src":"\u002Fassets\u002Fjs\u002Fargon.min001.js"},{"src":"https:\u002F\u002Fcdnjs.cloudflare.com\u002Fajax\u002Flibs\u002Fmoment.js\u002F2.18.1\u002Fmoment.min.js"}],"style":[]},

    store,
    router,
    nuxt: {
      defaultTransition,
      transitions: [defaultTransition],
      setTransitions (transitions) {
        if (!Array.isArray(transitions)) {
          transitions = [transitions]
        }
        transitions = transitions.map((transition) => {
          if (!transition) {
            transition = defaultTransition
          } else if (typeof transition === 'string') {
            transition = Object.assign({}, defaultTransition, { name: transition })
          } else {
            transition = Object.assign({}, defaultTransition, transition)
          }
          return transition
        })
        this.$options.nuxt.transitions = transitions
        return transitions
      },

      err: null,
      dateErr: null,
      error (err) {
        err = err || null
        app.context._errored = Boolean(err)
        err = err ? normalizeError(err) : null
        let nuxt = app.nuxt // to work with @vue/composition-api, see https://github.com/nuxt/nuxt.js/issues/6517#issuecomment-573280207
        if (this) {
          nuxt = this.nuxt || this.$options.nuxt
        }
        nuxt.dateErr = Date.now()
        nuxt.err = err
        // Used in src/server.js
        if (ssrContext) {
          ssrContext.nuxt.error = err
        }
        return err
      }
    },
    ...App
  }

  // Make app available into store via this.app
  store.app = app

  const next = ssrContext ? ssrContext.next : location => app.router.push(location)
  // Resolve route
  let route
  if (ssrContext) {
    route = router.resolve(ssrContext.url).route
  } else {
    const path = getLocation(router.options.base, router.options.mode)
    route = router.resolve(path).route
  }

  // Set context to app.context
  await setContext(app, {
    store,
    route,
    next,
    error: app.nuxt.error.bind(app),
    payload: ssrContext ? ssrContext.payload : undefined,
    req: ssrContext ? ssrContext.req : undefined,
    res: ssrContext ? ssrContext.res : undefined,
    beforeRenderFns: ssrContext ? ssrContext.beforeRenderFns : undefined,
    ssrContext
  })

  function inject(key, value) {
    if (!key) {
      throw new Error('inject(key, value) has no key provided')
    }
    if (value === undefined) {
      throw new Error(`inject('${key}', value) has no value provided`)
    }

    key = '$' + key
    // Add into app
    app[key] = value
    // Add into context
    if (!app.context[key]) {
      app.context[key] = value
    }

    // Add into store
    store[key] = app[key]

    // Check if plugin not already installed
    const installKey = '__nuxt_' + key + '_installed__'
    if (Vue[installKey]) {
      return
    }
    Vue[installKey] = true
    // Call Vue.use() to install the plugin into vm
    Vue.use(() => {
      if (!Object.prototype.hasOwnProperty.call(Vue.prototype, key)) {
        Object.defineProperty(Vue.prototype, key, {
          get () {
            return this.$root.$options[key]
          }
        })
      }
    })
  }

  // Inject runtime config as $config
  inject('config', config)

  if (process.client) {
    // Replace store state before plugins execution
    if (window.__NUXT__ && window.__NUXT__.state) {
      store.replaceState(window.__NUXT__.state)
    }
  }

  // Add enablePreview(previewData = {}) in context for plugins
  if (process.static && process.client) {
    app.context.enablePreview = function (previewData = {}) {
      app.previewData = Object.assign({}, previewData)
      inject('preview', previewData)
    }
  }
  // Plugin execution

  if (typeof nuxt_plugin_plugin_1bc2fd20 === 'function') {
    await nuxt_plugin_plugin_1bc2fd20(app.context, inject)
  }

  if (typeof nuxt_plugin_moment_5b46a665 === 'function') {
    await nuxt_plugin_moment_5b46a665(app.context, inject)
  }

  if (typeof nuxt_plugin_axios_02789d93 === 'function') {
    await nuxt_plugin_axios_02789d93(app.context, inject)
  }

  if (typeof nuxt_plugin_templatesplugin0ef13b0c_008fc4be === 'function') {
    await nuxt_plugin_templatesplugin0ef13b0c_008fc4be(app.context, inject)
  }

  if (typeof nuxt_plugin_helper_0bc87e87 === 'function') {
    await nuxt_plugin_helper_0bc87e87(app.context, inject)
  }

  if (typeof nuxt_plugin_vuesax_248aab7d === 'function') {
    await nuxt_plugin_vuesax_248aab7d(app.context, inject)
  }

  if (typeof nuxt_plugin_extablecolumn_82eb25d0 === 'function') {
    await nuxt_plugin_extablecolumn_82eb25d0(app.context, inject)
  }

  if (typeof nuxt_plugin_vuegeolocation_276efa99 === 'function') {
    await nuxt_plugin_vuegeolocation_276efa99(app.context, inject)
  }

  if (typeof nuxt_plugin_vuegooglemaps_9398d546 === 'function') {
    await nuxt_plugin_vuegooglemaps_9398d546(app.context, inject)
  }

  if (process.client && typeof nuxt_plugin_vcalendar_37ff9c3b === 'function') {
    await nuxt_plugin_vcalendar_37ff9c3b(app.context, inject)
  }

  if (process.client && typeof nuxt_plugin_swal_d9d73ab0 === 'function') {
    await nuxt_plugin_swal_d9d73ab0(app.context, inject)
  }

  if (process.client && typeof nuxt_plugin_vue2editor_50d6bb9c === 'function') {
    await nuxt_plugin_vue2editor_50d6bb9c(app.context, inject)
  }

  if (process.client && typeof nuxt_plugin_chart_223dba6a === 'function') {
    await nuxt_plugin_chart_223dba6a(app.context, inject)
  }

  if (typeof nuxt_plugin_plugin_ef9a59fc === 'function') {
    await nuxt_plugin_plugin_ef9a59fc(app.context, inject)
  }

  // Lock enablePreview in context
  if (process.static && process.client) {
    app.context.enablePreview = function () {
      console.warn('You cannot call enablePreview() outside a plugin.')
    }
  }

  // If server-side, wait for async component to be resolved first
  if (process.server && ssrContext && ssrContext.url) {
    await new Promise((resolve, reject) => {
      router.push(ssrContext.url, resolve, (err) => {
        // https://github.com/vuejs/vue-router/blob/v3.4.3/src/util/errors.js
        if (!err._isRouter) return reject(err)
        if (err.type !== 2 /* NavigationFailureType.redirected */) return resolve()

        // navigated to a different route in router guard
        const unregister = router.afterEach(async (to, from) => {
          ssrContext.url = to.fullPath
          app.context.route = await getRouteData(to)
          app.context.params = to.params || {}
          app.context.query = to.query || {}
          unregister()
          resolve()
        })
      })
    })
  }

  return {
    store,
    app,
    router
  }
}

export { createApp, NuxtError }
