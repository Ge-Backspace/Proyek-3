import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const VUEX_PROPERTIES = ['state', 'getters', 'actions', 'mutations']

let store = {};

(function updateModules () {
  store = normalizeRoot(require('..\\store\\index.js'), 'store/index.js')

  // If store is an exported method = classic mode (deprecated)

  if (typeof store === 'function') {
    return console.warn('Classic mode for store/ is deprecated and will be removed in Nuxt 3.')
  }

  // Enforce store modules
  store.modules = store.modules || {}

  resolveStoreModules(require('..\\store\\attendance.js'), 'attendance.js')
  resolveStoreModules(require('..\\store\\berita.js'), 'berita.js')
  resolveStoreModules(require('..\\store\\checkin.js'), 'checkin.js')
  resolveStoreModules(require('..\\store\\company.js'), 'company.js')
  resolveStoreModules(require('..\\store\\coordinate.js'), 'coordinate.js')
  resolveStoreModules(require('..\\store\\cuti.js'), 'cuti.js')
  resolveStoreModules(require('..\\store\\cutiemployee.js'), 'cutiemployee.js')
  resolveStoreModules(require('..\\store\\cutipermission.js'), 'cutipermission.js')
  resolveStoreModules(require('..\\store\\drawer.js'), 'drawer.js')
  resolveStoreModules(require('..\\store\\employee.js'), 'employee.js')
  resolveStoreModules(require('..\\store\\goverment.js'), 'goverment.js')
  resolveStoreModules(require('..\\store\\jadwal.js'), 'jadwal.js')
  resolveStoreModules(require('..\\store\\kelas.js'), 'kelas.js')
  resolveStoreModules(require('..\\store\\lokasi.js'), 'lokasi.js')
  resolveStoreModules(require('..\\store\\mapel.js'), 'mapel.js')
  resolveStoreModules(require('..\\store\\office.js'), 'office.js')
  resolveStoreModules(require('..\\store\\option.js'), 'option.js')
  resolveStoreModules(require('..\\store\\overtime.js'), 'overtime.js')
  resolveStoreModules(require('..\\store\\position.js'), 'position.js')
  resolveStoreModules(require('..\\store\\report.js'), 'report.js')
  resolveStoreModules(require('..\\store\\salary.js'), 'salary.js')
  resolveStoreModules(require('..\\store\\schedule.js'), 'schedule.js')
  resolveStoreModules(require('..\\store\\semester.js'), 'semester.js')
  resolveStoreModules(require('..\\store\\service.js'), 'service.js')
  resolveStoreModules(require('..\\store\\setting.js'), 'setting.js')
  resolveStoreModules(require('..\\store\\shift.js'), 'shift.js')
  resolveStoreModules(require('..\\store\\shiftemployee.js'), 'shiftemployee.js')
  resolveStoreModules(require('..\\store\\shiftpermission.js'), 'shiftpermission.js')
  resolveStoreModules(require('..\\store\\statusP.js'), 'statusP.js')
  resolveStoreModules(require('..\\store\\test.js'), 'test.js')
  resolveStoreModules(require('..\\store\\todaypelajaran.js'), 'todaypelajaran.js')
  resolveStoreModules(require('..\\store\\upload.js'), 'upload.js')
  resolveStoreModules(require('..\\store\\user.js'), 'user.js')
  resolveStoreModules(require('..\\store\\util.js'), 'util.js')

  // If the environment supports hot reloading...

  if (process.client && module.hot) {
    // Whenever any Vuex module is updated...
    module.hot.accept([
      '..\\store\\attendance.js',
      '..\\store\\berita.js',
      '..\\store\\checkin.js',
      '..\\store\\company.js',
      '..\\store\\coordinate.js',
      '..\\store\\cuti.js',
      '..\\store\\cutiemployee.js',
      '..\\store\\cutipermission.js',
      '..\\store\\drawer.js',
      '..\\store\\employee.js',
      '..\\store\\goverment.js',
      '..\\store\\index.js',
      '..\\store\\jadwal.js',
      '..\\store\\kelas.js',
      '..\\store\\lokasi.js',
      '..\\store\\mapel.js',
      '..\\store\\office.js',
      '..\\store\\option.js',
      '..\\store\\overtime.js',
      '..\\store\\position.js',
      '..\\store\\report.js',
      '..\\store\\salary.js',
      '..\\store\\schedule.js',
      '..\\store\\semester.js',
      '..\\store\\service.js',
      '..\\store\\setting.js',
      '..\\store\\shift.js',
      '..\\store\\shiftemployee.js',
      '..\\store\\shiftpermission.js',
      '..\\store\\statusP.js',
      '..\\store\\test.js',
      '..\\store\\todaypelajaran.js',
      '..\\store\\upload.js',
      '..\\store\\user.js',
      '..\\store\\util.js',
    ], () => {
      // Update `root.modules` with the latest definitions.
      updateModules()
      // Trigger a hot update in the store.
      window.$nuxt.$store.hotUpdate(store)
    })
  }
})()

// createStore
export const createStore = store instanceof Function ? store : () => {
  return new Vuex.Store(Object.assign({
    strict: (process.env.NODE_ENV !== 'production')
  }, store))
}

function normalizeRoot (moduleData, filePath) {
  moduleData = moduleData.default || moduleData

  if (moduleData.commit) {
    throw new Error(`[nuxt] ${filePath} should export a method that returns a Vuex instance.`)
  }

  if (typeof moduleData !== 'function') {
    // Avoid TypeError: setting a property that has only a getter when overwriting top level keys
    moduleData = Object.assign({}, moduleData)
  }
  return normalizeModule(moduleData, filePath)
}

function normalizeModule (moduleData, filePath) {
  if (moduleData.state && typeof moduleData.state !== 'function') {
    console.warn(`'state' should be a method that returns an object in ${filePath}`)

    const state = Object.assign({}, moduleData.state)
    // Avoid TypeError: setting a property that has only a getter when overwriting top level keys
    moduleData = Object.assign({}, moduleData, { state: () => state })
  }
  return moduleData
}

function resolveStoreModules (moduleData, filename) {
  moduleData = moduleData.default || moduleData
  // Remove store src + extension (./foo/index.js -> foo/index)
  const namespace = filename.replace(/\.(js|mjs)$/, '')
  const namespaces = namespace.split('/')
  let moduleName = namespaces[namespaces.length - 1]
  const filePath = `store/${filename}`

  moduleData = moduleName === 'state'
    ? normalizeState(moduleData, filePath)
    : normalizeModule(moduleData, filePath)

  // If src is a known Vuex property
  if (VUEX_PROPERTIES.includes(moduleName)) {
    const property = moduleName
    const propertyStoreModule = getStoreModule(store, namespaces, { isProperty: true })

    // Replace state since it's a function
    mergeProperty(propertyStoreModule, moduleData, property)
    return
  }

  // If file is foo/index.js, it should be saved as foo
  const isIndexModule = (moduleName === 'index')
  if (isIndexModule) {
    namespaces.pop()
    moduleName = namespaces[namespaces.length - 1]
  }

  const storeModule = getStoreModule(store, namespaces)

  for (const property of VUEX_PROPERTIES) {
    mergeProperty(storeModule, moduleData[property], property)
  }

  if (moduleData.namespaced === false) {
    delete storeModule.namespaced
  }
}

function normalizeState (moduleData, filePath) {
  if (typeof moduleData !== 'function') {
    console.warn(`${filePath} should export a method that returns an object`)
    const state = Object.assign({}, moduleData)
    return () => state
  }
  return normalizeModule(moduleData, filePath)
}

function getStoreModule (storeModule, namespaces, { isProperty = false } = {}) {
  // If ./mutations.js
  if (!namespaces.length || (isProperty && namespaces.length === 1)) {
    return storeModule
  }

  const namespace = namespaces.shift()

  storeModule.modules[namespace] = storeModule.modules[namespace] || {}
  storeModule.modules[namespace].namespaced = true
  storeModule.modules[namespace].modules = storeModule.modules[namespace].modules || {}

  return getStoreModule(storeModule.modules[namespace], namespaces, { isProperty })
}

function mergeProperty (storeModule, moduleData, property) {
  if (!moduleData) {
    return
  }

  if (property === 'state') {
    storeModule.state = moduleData || storeModule.state
  } else {
    storeModule[property] = Object.assign({}, storeModule[property], moduleData)
  }
}
