<template>
  <div>
    <div class="header bg-warning pb-6">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <h1 class="heading">Jadwal Mata Pelajaran</h1>
        </div>
      </div>
    </div>
    <div class="container-fluid mt--6">
      <div class="row">
        <div class="col-md-12">
          <br />
          <el-card>
            <div slot="header" class="clearfix">
              <div class="row">
                <div class="col-md-4">
                  <span class="demonstration">Pilih Semester</span>
                  <br />
                  <el-date-picker
                    v-model="date"
                    type="month"
                    placeholder="Select Month"
                    size="mini"
                    @change="searchData(date)"
                  >
                  </el-date-picker>
                </div>
                <div class="col-md-3">
                  <span>Pilih Kelas</span>
                  <br />
                  <el-select
                    v-model="select"
                    slot="prepend"
                    placeholder="All"
                    size="mini"
                    style="width: 180px"
                  >
                    <el-option label="1" value="1"></el-option>
                    <el-option label="2" value="2"></el-option>
                    <el-option label="3" value="3"></el-option>
                  </el-select>
                </div>
                <div class="col-md-3 mt-3" style="">
                  <vs-button
                    primary
                    relief
                    size="small"
                    :active="active == 5"
                    @click="active = 5"
                    style="width: 150px"
                  >
                    <i class="bx bx-check"></i> Lihat
                  </vs-button>
                </div>
              </div>

              <!-- <el-button style="float: right; padding: 3px 0" type="text">Operation button</el-button> -->
            </div>
            <div class="row" style="margin-bottom: 20px">
              <div class="col-md-3">
                <span>search</span>
                <el-input
                  placeholder="Cari"
                  v-model="search"
                  @change="searchData()"
                  size="mini"
                >
                  <i slot="prefix" class="el-input__icon el-icon-search"></i>
                </el-input>
              </div>
              <div class="col-md-2 offset-md-4">
                <span>Download File</span>
                <br />
                <vs-button
                  success
                  relief
                  size="small"
                  :active="active == 5"
                  @click="active = 5"
                  style="width: 150px"
                >
                  <i class="el el-icon-document"></i> Export Excel
                </vs-button>
              </div>
            </div>
            <p style="font-weight: bold" class="text-center">
              {{ month(getReportAttendance.data.start_date) }}
            </p>
            <vs-table striped>
              <template #thead>
                <vs-tr>
                  <vs-th>Mata Pelajaran</vs-th>
                  <vs-th>Kelas</vs-th>
                  <vs-th>Semester</vs-th>
                  <vs-th>Mulai</vs-th>
                  <vs-th>Selesai</vs-th>
                  <vs-th>Tanggal</vs-th>
                  <vs-th>Action</vs-th>
                </vs-tr>
              </template>
              <template #tbody>
                <vs-tr :key="i" v-for="(tr, i) in getJadwal.data" :data="tr">
                  <vs-td>
                    {{ tr.name_pelajaran }}
                  </vs-td>
                  <vs-td>
                    {{ tr.kelas_name }}
                  </vs-td>
                  <vs-td>
                    {{ tr.semester_name }}
                  </vs-td>
                  <vs-td>
                    {{ tr.schedule_in }}
                  </vs-td>
                  <vs-td>
                    {{ tr.schedule_out }}
                  </vs-td>
                  <vs-td>
                    {{ tr.date }}
                  </vs-td>
                  <vs-td>
                    <el-tooltip content="Edit" placement="top-start" effect="dark">
                      <el-button size="mini" @click="edit(tr)" icon="fa fa-edit"></el-button>
                    </el-tooltip>

                    <el-tooltip content="Delete" placement="top-start" effect="dark">
                      <el-button size="mini" type="primary" @click="deleteJadwal(tr.id)" icon="fa fa-trash">
                      </el-button>
                    </el-tooltip>
                  </vs-td>
                </vs-tr>
              </template>
              <template #footer>
                <vs-row>
                  <vs-col w="2">
                    <small>Total : {{getJadwal.total}} Data</small>
                  </vs-col>
                  <vs-col w="10">
                    <vs-pagination v-model="page" :length="Math.ceil(getJadwal.total / table.max)" />
                  </vs-col>
                </vs-row>
              </template>
            </vs-table>
          </el-card>
        </div>
      </div>
    </div>
    <el-tooltip class="item" effect="dark" content="Add New Kelas" placement="top-start">
      <a class="float" @click="jadwalDialog = true; titleDialog = 'Tambah Kelas'">
        <i class="el-icon-plus my-float"></i>
      </a>
    </el-tooltip>
    <!-- End floating button -->

    <vs-dialog v-model="jadwalDialog" :width="$store.state.drawer.mode === 'mobile' ? '80%' : '60%'"
      @close="resetForm()">
      <template #header>
        <h1 class="not-margin">
          {{titleDialog}}
        </h1>
      </template>
      <div class="con-form">
        <vs-row>
          <vs-col vs-type="flex" vs-justify="center" vs-align="center" w="6" style="padding:5px">
            <label>Nama Kelas</label>
            <vs-input type="text" v-model="form.name" placeholder="Masukkan Nama Kelas"></vs-input>
          </vs-col>
        </vs-row>
      </div>

      <template #footer>
        <div class="footer-dialog">
          <vs-row>
            <vs-col w="6" style="padding:5px">
              <vs-button block :loading="btnLoader" @click="onSubmit('update')" v-if="isUpdate">Update</vs-button>
              <vs-button block :loading="btnLoader" @click="onSubmit('store')" v-else>Simpan</vs-button>
            </vs-col>
            <vs-col w="6" style="padding:5px">
              <vs-button block border @click="jadwalDialog = false; resetForm()">Batal</vs-button>
            </vs-col>
          </vs-row>
          <div>&nbsp;</div>
        </div>
      </template>
    </vs-dialog>
  </div>
</template>

<script>
import { mapMutations, mapGetters } from "vuex";
import * as moment from "moment";
import { config } from "../../../global.config";

export default {
  layout: "admin",
  components: {},
  data() {
      return {
        api_url: config.baseApiUrl,
        table: {
          max: 10
        },
        active: '',
        page: 1,
        titleDialog: 'Edit Jadwal Mata Pelajaran',
        search: '',
        isUpdate: false,
        jadwalDialog: false,
        btnLoader: false,
        form: {
          id: '',
          name_pelajaran: '',
          kelas_name: '',
          semester_name: '',
          schedule_in: '',
          schedule_out: '',
          date: ''
        }
      }
    },
    mounted() {
      this.$store.dispatch('jadwal/getAll', {
        //
      });
    },
    methods: {
      searchData(){
        this.$store.dispatch('jadwal/getAll', {
          search: this.search,
        });
      },
      edit(data) {
        // console.log(moment(data.schedule_in,"HH:mm:ss").format("HH:mm"))
        this.form.id = data.id
        this.form.name_pelajaran = data.name_pelajaran
        this.form.kelas_name = data.kelas_name
        this.form.semester_name = data.semester_name
        this.form.schedule_in = data.schedule_in
        this.form.schedule_out = data.schedule_out
        this.form.date = data.date
        this.jadwalDialog = true
        this.titleDialog = 'Edit Jadwal Mata Pelajaran'
        this.isUpdate = true
      },
      resetForm() {
        this.form = {
          id: '',
          name_pelajaran: '',
          kelas_name: '',
          semester_name: '',
          schedule_in: '',
          schedule_out: '',
          date: ''
        }
        this.isUpdate = false
      },
      handleCurrentChange(val) {
        this.$store.commit('jadwal/setPage', val)
        this.$store.dispatch('jadwal/getAll', {
          //
        });
      },
      onSubmit(type = 'store') {
        this.btnLoader = true
        let formData = new FormData()
        formData.append("name_pelajaran", this.form.name_pelajaran)
        formData.append("kelas_name", this.form.kelas_name)
        formData.append("semester_name", this.form.name)
        formData.append("schedule_in", this.form.schedule_in)
        formData.append("schedule_out", this.form.schedule_out)
        formData.append("date", this.form.date)
        let url = "/jadwal/store";
        if (type == 'update') {
          url = `/jadwal/${this.form.id}/update`
        }

        this.$axios.post(url, formData).then(resp => {
          if (resp.data.success) {
            this.$notify.success({
              title: 'Success',
              message: `Berhasil ${type == 'store' ? 'Menambah' : 'Mengubah'} Jadwal Mapel`
            })
            this.resetForm()
            this.jadwalDialog = false
            this.$store.dispatch('jadwal/getAll', {
              //
            });
          }
        }).finally(() => {
          this.btnLoader = false
          this.$store.dispatch('jadwal/getAll', {
            //
          })
        }).catch(err => {
          let error = err.response.data.data
          if (error) {
            this.showErrorField(error)
          } else {
            this.$notify.error({
              title: 'Error',
              message: err.response.data.message
            })
          }
        })
      },
      deleteJadwal(id) {
        console.log(id)
        this.$swal({
          title: 'PERINGATAN!!!',
          text: "Apakah anda yakin ingin menghapus data yang dipilih ?",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Ya!',
          cancelButtonText: 'No!'
        }).then((result) => {
          if (result.isConfirmed) {
            this.$axios.delete(`/jadwal/${id}/delete`).then(resp => {
              if (resp.data.success) {
                this.$notify.success({
                  title: 'Success',
                  message: 'Berhasil Menghapus Data'
                })
                this.jadwalDialog = false
                this.$store.dispatch('kelas/getAll', {
                  defaultPage: true,
                });
              }
            }).finally(() => {
              //
            }).catch(err => {
              this.$notify.error({
                title: 'Error',
                message: err.response.data.message
              })
            })
          }
        })
      },
  computed: {
    ...mapGetters("jadwal", ["getJadwal", "getLoader"]),
  },
  watch: {},
    }
};
</script>

<style lang="scss" scoped>
.heading {
  color: white;
  font-size: 25px;
  font-weight: bold;
}
</style>
