import Vue from 'vue'
import Router from 'vue-router'
import { normalizeURL, decode } from '@nuxt/ufo'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _5e562964 = () => interopDefault(import('..\\pages\\company_check.vue' /* webpackChunkName: "pages/company_check" */))
const _09b8cca4 = () => interopDefault(import('..\\pages\\LandingPage.vue' /* webpackChunkName: "pages/LandingPage" */))
const _ac7f631e = () => interopDefault(import('..\\pages\\login.vue' /* webpackChunkName: "pages/login" */))
const _36134cb1 = () => interopDefault(import('..\\pages\\profile.vue' /* webpackChunkName: "pages/profile" */))
const _3f8d2e6a = () => interopDefault(import('..\\pages\\register.vue' /* webpackChunkName: "pages/register" */))
const _45aae08e = () => interopDefault(import('..\\pages\\register_account.vue' /* webpackChunkName: "pages/register_account" */))
const _e986cbee = () => interopDefault(import('..\\pages\\register_company.vue' /* webpackChunkName: "pages/register_company" */))
const _af44e6fe = () => interopDefault(import('..\\pages\\reset-password.vue' /* webpackChunkName: "pages/reset-password" */))
const _403bf73a = () => interopDefault(import('..\\pages\\test.vue' /* webpackChunkName: "pages/test" */))
const _3e90d524 = () => interopDefault(import('..\\pages\\admin\\absen\\index.vue' /* webpackChunkName: "pages/admin/absen/index" */))
const _9162e99c = () => interopDefault(import('..\\pages\\admin\\beranda.vue' /* webpackChunkName: "pages/admin/beranda" */))
const _09acedfe = () => interopDefault(import('..\\pages\\admin\\berita.vue' /* webpackChunkName: "pages/admin/berita" */))
const _2d789d2a = () => interopDefault(import('..\\pages\\admin\\company1.vue' /* webpackChunkName: "pages/admin/company1" */))
const _92484732 = () => interopDefault(import('..\\pages\\admin\\informasi.vue' /* webpackChunkName: "pages/admin/informasi" */))
const _3515429b = () => interopDefault(import('..\\pages\\admin\\jadwalMapel\\index.vue' /* webpackChunkName: "pages/admin/jadwalMapel/index" */))
const _b3d2411a = () => interopDefault(import('..\\pages\\admin\\kegiatan.vue' /* webpackChunkName: "pages/admin/kegiatan" */))
const _64b5ea06 = () => interopDefault(import('..\\pages\\admin\\mapel\\index.vue' /* webpackChunkName: "pages/admin/mapel/index" */))
const _4f1e0aa6 = () => interopDefault(import('..\\pages\\admin\\permission.vue' /* webpackChunkName: "pages/admin/permission" */))
const _4e295ebe = () => interopDefault(import('..\\pages\\admin\\salary.vue' /* webpackChunkName: "pages/admin/salary" */))
const _7984a0fb = () => interopDefault(import('..\\pages\\admin\\shift.vue' /* webpackChunkName: "pages/admin/shift" */))
const _189f6b29 = () => interopDefault(import('..\\pages\\admin\\test.vue' /* webpackChunkName: "pages/admin/test" */))
const _598d8f81 = () => interopDefault(import('..\\pages\\admin\\users.vue' /* webpackChunkName: "pages/admin/users" */))
const _4bfd7e20 = () => interopDefault(import('..\\pages\\admin\\master\\masterAbsen.vue' /* webpackChunkName: "pages/admin/master/masterAbsen" */))
const _10e023a0 = () => interopDefault(import('..\\pages\\admin\\master\\masterJadwal.vue' /* webpackChunkName: "pages/admin/master/masterJadwal" */))
const _934e117a = () => interopDefault(import('..\\pages\\admin\\master\\MasterJadwalMapel.vue' /* webpackChunkName: "pages/admin/master/MasterJadwalMapel" */))
const _04f66de7 = () => interopDefault(import('..\\pages\\admin\\master\\masterJurusan.vue' /* webpackChunkName: "pages/admin/master/masterJurusan" */))
const _637891d9 = () => interopDefault(import('..\\pages\\admin\\master\\masterKelas.vue' /* webpackChunkName: "pages/admin/master/masterKelas" */))
const _65ccf9aa = () => interopDefault(import('..\\pages\\admin\\master\\masterLokasi.vue' /* webpackChunkName: "pages/admin/master/masterLokasi" */))
const _72f33150 = () => interopDefault(import('..\\pages\\admin\\master\\masterMapel.vue' /* webpackChunkName: "pages/admin/master/masterMapel" */))
const _0ca362b2 = () => interopDefault(import('..\\pages\\admin\\master\\masterSekolah.vue' /* webpackChunkName: "pages/admin/master/masterSekolah" */))
const _3bf952bc = () => interopDefault(import('..\\pages\\admin\\master\\masterSiswa.vue' /* webpackChunkName: "pages/admin/master/masterSiswa" */))
const _3fcea94c = () => interopDefault(import('..\\pages\\index.vue' /* webpackChunkName: "pages/index" */))

// TODO: remove in Nuxt 3
const emptyFn = () => {}
const originalPush = Router.prototype.push
Router.prototype.push = function push (location, onComplete = emptyFn, onAbort) {
  return originalPush.call(this, location, onComplete, onAbort)
}

Vue.use(Router)

export const routerOptions = {
  mode: 'history',
  base: '/',
  linkActiveClass: 'nuxt-link-active',
  linkExactActiveClass: 'nuxt-link-exact-active',
  scrollBehavior,

  routes: [{
    path: "/company_check",
    component: _5e562964,
    name: "company_check"
  }, {
    path: "/LandingPage",
    component: _09b8cca4,
    name: "LandingPage"
  }, {
    path: "/login",
    component: _ac7f631e,
    name: "login"
  }, {
    path: "/profile",
    component: _36134cb1,
    name: "profile"
  }, {
    path: "/register",
    component: _3f8d2e6a,
    name: "register"
  }, {
    path: "/register_account",
    component: _45aae08e,
    name: "register_account"
  }, {
    path: "/register_company",
    component: _e986cbee,
    name: "register_company"
  }, {
    path: "/reset-password",
    component: _af44e6fe,
    name: "reset-password"
  }, {
    path: "/test",
    component: _403bf73a,
    name: "test"
  }, {
    path: "/admin/absen",
    component: _3e90d524,
    name: "admin-absen"
  }, {
    path: "/admin/beranda",
    component: _9162e99c,
    name: "admin-beranda"
  }, {
    path: "/admin/berita",
    component: _09acedfe,
    name: "admin-berita"
  }, {
    path: "/admin/company1",
    component: _2d789d2a,
    name: "admin-company1"
  }, {
    path: "/admin/informasi",
    component: _92484732,
    name: "admin-informasi"
  }, {
    path: "/admin/jadwalMapel",
    component: _3515429b,
    name: "admin-jadwalMapel"
  }, {
    path: "/admin/kegiatan",
    component: _b3d2411a,
    name: "admin-kegiatan"
  }, {
    path: "/admin/mapel",
    component: _64b5ea06,
    name: "admin-mapel"
  }, {
    path: "/admin/permission",
    component: _4f1e0aa6,
    name: "admin-permission"
  }, {
    path: "/admin/salary",
    component: _4e295ebe,
    name: "admin-salary"
  }, {
    path: "/admin/shift",
    component: _7984a0fb,
    name: "admin-shift"
  }, {
    path: "/admin/test",
    component: _189f6b29,
    name: "admin-test"
  }, {
    path: "/admin/users",
    component: _598d8f81,
    name: "admin-users"
  }, {
    path: "/admin/master/masterAbsen",
    component: _4bfd7e20,
    name: "admin-master-masterAbsen"
  }, {
    path: "/admin/master/masterJadwal",
    component: _10e023a0,
    name: "admin-master-masterJadwal"
  }, {
    path: "/admin/master/MasterJadwalMapel",
    component: _934e117a,
    name: "admin-master-MasterJadwalMapel"
  }, {
    path: "/admin/master/masterJurusan",
    component: _04f66de7,
    name: "admin-master-masterJurusan"
  }, {
    path: "/admin/master/masterKelas",
    component: _637891d9,
    name: "admin-master-masterKelas"
  }, {
    path: "/admin/master/masterLokasi",
    component: _65ccf9aa,
    name: "admin-master-masterLokasi"
  }, {
    path: "/admin/master/masterMapel",
    component: _72f33150,
    name: "admin-master-masterMapel"
  }, {
    path: "/admin/master/masterSekolah",
    component: _0ca362b2,
    name: "admin-master-masterSekolah"
  }, {
    path: "/admin/master/masterSiswa",
    component: _3bf952bc,
    name: "admin-master-masterSiswa"
  }, {
    path: "/",
    component: _3fcea94c,
    name: "index"
  }],

  fallback: false
}

function decodeObj(obj) {
  for (const key in obj) {
    if (typeof obj[key] === 'string') {
      obj[key] = decode(obj[key])
    }
  }
}

export function createRouter () {
  const router = new Router(routerOptions)

  const resolve = router.resolve.bind(router)
  router.resolve = (to, current, append) => {
    if (typeof to === 'string') {
      to = normalizeURL(to)
    }
    const r = resolve(to, current, append)
    if (r && r.resolved && r.resolved.query) {
      decodeObj(r.resolved.query)
    }
    return r
  }

  return router
}
