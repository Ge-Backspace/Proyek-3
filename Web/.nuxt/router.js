import Vue from 'vue'
import Router from 'vue-router'
import { normalizeURL, decode } from '@nuxt/ufo'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _37815832 = () => interopDefault(import('..\\pages\\company_check.vue' /* webpackChunkName: "pages/company_check" */))
const _53115487 = () => interopDefault(import('..\\pages\\LandingPage.vue' /* webpackChunkName: "pages/LandingPage" */))
const _ec353fec = () => interopDefault(import('..\\pages\\login.vue' /* webpackChunkName: "pages/login" */))
const _bd8b47ec = () => interopDefault(import('..\\pages\\profile.vue' /* webpackChunkName: "pages/profile" */))
const _4c1776dc = () => interopDefault(import('..\\pages\\register.vue' /* webpackChunkName: "pages/register" */))
const _490cb480 = () => interopDefault(import('..\\pages\\register_account.vue' /* webpackChunkName: "pages/register_account" */))
const _11c28260 = () => interopDefault(import('..\\pages\\register_company.vue' /* webpackChunkName: "pages/register_company" */))
const _02403708 = () => interopDefault(import('..\\pages\\reset-password.vue' /* webpackChunkName: "pages/reset-password" */))
const _9a5c62fe = () => interopDefault(import('..\\pages\\test.vue' /* webpackChunkName: "pages/test" */))
const _624d6747 = () => interopDefault(import('..\\pages\\admin\\absen\\index.vue' /* webpackChunkName: "pages/admin/absen/index" */))
const _113135b9 = () => interopDefault(import('..\\pages\\admin\\beranda.vue' /* webpackChunkName: "pages/admin/beranda" */))
const _1d175697 = () => interopDefault(import('..\\pages\\admin\\berita.vue' /* webpackChunkName: "pages/admin/berita" */))
const _68935078 = () => interopDefault(import('..\\pages\\admin\\company1.vue' /* webpackChunkName: "pages/admin/company1" */))
const _22be012e = () => interopDefault(import('..\\pages\\admin\\informasi.vue' /* webpackChunkName: "pages/admin/informasi" */))
const _40728db4 = () => interopDefault(import('..\\pages\\admin\\jadwalMapel\\index.vue' /* webpackChunkName: "pages/admin/jadwalMapel/index" */))
const _eeecf468 = () => interopDefault(import('..\\pages\\admin\\kegiatan.vue' /* webpackChunkName: "pages/admin/kegiatan" */))
const _33688842 = () => interopDefault(import('..\\pages\\admin\\mapel\\index.vue' /* webpackChunkName: "pages/admin/mapel/index" */))
const _5f807ebf = () => interopDefault(import('..\\pages\\admin\\permission.vue' /* webpackChunkName: "pages/admin/permission" */))
const _27548d8c = () => interopDefault(import('..\\pages\\admin\\salary.vue' /* webpackChunkName: "pages/admin/salary" */))
const _1f4e4142 = () => interopDefault(import('..\\pages\\admin\\shift.vue' /* webpackChunkName: "pages/admin/shift" */))
const _708d2602 = () => interopDefault(import('..\\pages\\admin\\test.vue' /* webpackChunkName: "pages/admin/test" */))
const _0151a070 = () => interopDefault(import('..\\pages\\admin\\users.vue' /* webpackChunkName: "pages/admin/users" */))
const _be7251ee = () => interopDefault(import('..\\pages\\admin\\master\\masterJadwal.vue' /* webpackChunkName: "pages/admin/master/masterJadwal" */))
const _9502a3ec = () => interopDefault(import('..\\pages\\admin\\master\\MasterJadwalMapel.vue' /* webpackChunkName: "pages/admin/master/MasterJadwalMapel" */))
const _fac6bfa4 = () => interopDefault(import('..\\pages\\admin\\master\\masterJurusan.vue' /* webpackChunkName: "pages/admin/master/masterJurusan" */))
const _7876ac40 = () => interopDefault(import('..\\pages\\admin\\master\\masterKelas.vue' /* webpackChunkName: "pages/admin/master/masterKelas" */))
const _0f03e283 = () => interopDefault(import('..\\pages\\admin\\master\\masterLokasi.vue' /* webpackChunkName: "pages/admin/master/masterLokasi" */))
const _26d27f5f = () => interopDefault(import('..\\pages\\admin\\master\\masterMapel.vue' /* webpackChunkName: "pages/admin/master/masterMapel" */))
const _eb6cd60e = () => interopDefault(import('..\\pages\\admin\\master\\masterSekolah.vue' /* webpackChunkName: "pages/admin/master/masterSekolah" */))
const _c0e593e8 = () => interopDefault(import('..\\pages\\admin\\master\\masterSemester.vue' /* webpackChunkName: "pages/admin/master/masterSemester" */))
const _c7752a7a = () => interopDefault(import('..\\pages\\admin\\master\\masterSiswa.vue' /* webpackChunkName: "pages/admin/master/masterSiswa" */))
const _7f84861a = () => interopDefault(import('..\\pages\\index.vue' /* webpackChunkName: "pages/index" */))

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
    component: _37815832,
    name: "company_check"
  }, {
    path: "/LandingPage",
    component: _53115487,
    name: "LandingPage"
  }, {
    path: "/login",
    component: _ec353fec,
    name: "login"
  }, {
    path: "/profile",
    component: _bd8b47ec,
    name: "profile"
  }, {
    path: "/register",
    component: _4c1776dc,
    name: "register"
  }, {
    path: "/register_account",
    component: _490cb480,
    name: "register_account"
  }, {
    path: "/register_company",
    component: _11c28260,
    name: "register_company"
  }, {
    path: "/reset-password",
    component: _02403708,
    name: "reset-password"
  }, {
    path: "/test",
    component: _9a5c62fe,
    name: "test"
  }, {
    path: "/admin/absen",
    component: _624d6747,
    name: "admin-absen"
  }, {
    path: "/admin/beranda",
    component: _113135b9,
    name: "admin-beranda"
  }, {
    path: "/admin/berita",
    component: _1d175697,
    name: "admin-berita"
  }, {
    path: "/admin/company1",
    component: _68935078,
    name: "admin-company1"
  }, {
    path: "/admin/informasi",
    component: _22be012e,
    name: "admin-informasi"
  }, {
    path: "/admin/jadwalMapel",
    component: _40728db4,
    name: "admin-jadwalMapel"
  }, {
    path: "/admin/kegiatan",
    component: _eeecf468,
    name: "admin-kegiatan"
  }, {
    path: "/admin/mapel",
    component: _33688842,
    name: "admin-mapel"
  }, {
    path: "/admin/permission",
    component: _5f807ebf,
    name: "admin-permission"
  }, {
    path: "/admin/salary",
    component: _27548d8c,
    name: "admin-salary"
  }, {
    path: "/admin/shift",
    component: _1f4e4142,
    name: "admin-shift"
  }, {
    path: "/admin/test",
    component: _708d2602,
    name: "admin-test"
  }, {
    path: "/admin/users",
    component: _0151a070,
    name: "admin-users"
  }, {
    path: "/admin/master/masterJadwal",
    component: _be7251ee,
    name: "admin-master-masterJadwal"
  }, {
    path: "/admin/master/MasterJadwalMapel",
    component: _9502a3ec,
    name: "admin-master-MasterJadwalMapel"
  }, {
    path: "/admin/master/masterJurusan",
    component: _fac6bfa4,
    name: "admin-master-masterJurusan"
  }, {
    path: "/admin/master/masterKelas",
    component: _7876ac40,
    name: "admin-master-masterKelas"
  }, {
    path: "/admin/master/masterLokasi",
    component: _0f03e283,
    name: "admin-master-masterLokasi"
  }, {
    path: "/admin/master/masterMapel",
    component: _26d27f5f,
    name: "admin-master-masterMapel"
  }, {
    path: "/admin/master/masterSekolah",
    component: _eb6cd60e,
    name: "admin-master-masterSekolah"
  }, {
    path: "/admin/master/masterSemester",
    component: _c0e593e8,
    name: "admin-master-masterSemester"
  }, {
    path: "/admin/master/masterSiswa",
    component: _c7752a7a,
    name: "admin-master-masterSiswa"
  }, {
    path: "/",
    component: _7f84861a,
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
