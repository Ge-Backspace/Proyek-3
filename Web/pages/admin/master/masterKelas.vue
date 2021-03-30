<template>
  <div>
    <div class="header bg-warning pb-6">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <h1 class="heading">Master Kelas</h1>
        </div>
      </div>
    </div>
    <div class="container-fluid mt--5">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="col-md-12">
              <vs-button
                warn
                style="float: right"
                :loading="globalLoader"
                gradient
                @click="exportData('pdf')"
                >Download PDF</vs-button
              >
              &nbsp;
              <vs-button
                success
                style="float: right"
                :loading="globalLoader"
                gradient
                @click="exportData('excel')"
                >Download Excel</vs-button
              >
            </div>
          </div>
          <el-card v-loading="getLoader" style="margin-top: 40px">
            <div class="row" style="margin-bottom:20px">
              <div class="col-md-2">
                <vs-button
                  success
                  style="float: right"
                  :loading="globalLoader"
                  gradient
                  @click="
                  importDialog = true
                  titleDialog = 'Import Master Shift'
                  "
                  >Import Excel</vs-button
                >
              </div>
              <div class="col-md-3 offset-md-7">
                <el-input
                  placeholder="Cari"
                  v-model="search"
                  @change="searchData()"
                  size="mini"
                >
                  <i slot="prefix" class="el-input__icon el-icon-search"></i>
                </el-input>
              </div>
            </div>
            <vs-table striped>
              <template #thead>
                <vs-tr>
                  <vs-th>Kelas</vs-th>
                  <vs-th>Action</vs-th>
                </vs-tr>
              </template>
              <template #tbody>
                <vs-tr :key="i" v-for="(tr, i) in getKelas.data" :data="tr">
                  <vs-td>
                    {{ tr.name }}
                  </vs-td>
                  <vs-td>
                    <el-tooltip content="Edit" placement="top-start" effect="dark">
                      <el-button size="mini" @click="edit(tr)" icon="fa fa-edit"></el-button>
                    </el-tooltip>

                    <el-tooltip content="Delete" placement="top-start" effect="dark">
                      <el-button size="mini" type="primary" @click="deleteKelas(tr.id)" icon="fa fa-trash">
                      </el-button>
                    </el-tooltip>
                  </vs-td>
                </vs-tr>
              </template>
              <template #footer>
                <vs-row>
                  <vs-col w="2">
                    <small>Total : {{getKelas.total}} Data</small>
                  </vs-col>
                  <vs-col w="10">
                    <vs-pagination v-model="page" :length="Math.ceil(getKelas.total / table.max)" />
                  </vs-col>
                </vs-row>
              </template>
            </vs-table>
          </el-card>
        </div>
      </div>
    </div>

    <!-- Floating Button -->
    <el-tooltip class="item" effect="dark" content="Add New Kelas" placement="top-start">
      <a class="float" @click="kelasDialog = true; titleDialog = 'Tambah Kelas'">
        <i class="el-icon-plus my-float"></i>
      </a>
    </el-tooltip>
    <!-- End floating button -->

    <vs-dialog v-model="kelasDialog" :width="$store.state.drawer.mode === 'mobile' ? '80%' : '60%'"
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
              <vs-button block border @click="kelasDialog = false; resetForm()">Batal</vs-button>
            </vs-col>
          </vs-row>
          <div>&nbsp;</div>
        </div>
      </template>
    </vs-dialog>
    <vs-dialog
      v-model="importDialog"
      :width="$store.state.drawer.mode === 'mobile' ? '80%' : '60%'"
      @close="resetForm()"
    >
      <template #header>
        <h1 class="not-margin">
          {{ titleDialog }}
        </h1>
      </template>
      <div class="con-form">
        <vs-col
          vs-type="flex"
          vs-justify="center"
          vs-align="center"
          w="6"
          style="padding: 5px"
        >
          <label>Import Kelas</label>
          <vs-input<input type="file" id="file" ref="file"/>
        </vs-col>
        <vs-col
          vs-type="flex"
          vs-justify="center"
          vs-align="center"
          w="6"
          style="padding: 5px"
        >
          <vs-button
            color="primary"
            gradient
            :active="active == 6"
            @click="active = 6"
          >
            <i class="bx bx-file-blank"></i> download templates
          </vs-button>
        </vs-col>
      </div>

      <template #footer>
        <div class="footer-dialog">
          <vs-row>
            <vs-col w="6" style="padding: 5px">
              <vs-button
                block
                :loading="btnLoader"
                @click="onSubmit('update')"
                v-if="isUpdate"
                >Update</vs-button
              >
              <vs-button
                block
                :loading="btnLoader"
                @click="importData()"
                v-else
                >Simpan</vs-button
              >
            </vs-col>
            <vs-col w="6" style="padding: 5px">
              <vs-button
                block
                border
                @click="
                  importDialog = false;
                  resetForm();
                "
                >Batal</vs-button
              >
            </vs-col>
          </vs-row>
          <div>&nbsp;</div>
        </div>
      </template>
    </vs-dialog>
  </div>
</template>

<script>
  import {
    mapMutations,
    mapGetters
  } from 'vuex';

  import {
    config
  } from '../../../global.config'

  export default {
    layout: 'admin',
    components: {

    },
    data() {
      return {
        api_url: config.baseApiUrl,
        table: {
          max: 10
        },
        active: '',
        page: 1,
        titleDialog: 'Edit Kelas',
        search: '',
        isUpdate: false,
        kelasDialog: false,
        importDialog: false,
        btnLoader: false,
        form: {
          id: '',
          name: '',
        }
      }
    },
    mounted() {
      this.$store.dispatch('kelas/getAll', {
        //
      });
    },
    methods: {
      searchData(){
        this.$store.dispatch('kelas/getAll', {
          search: this.search,
        });
      },
      edit(data) {
        // console.log(moment(data.schedule_in,"HH:mm:ss").format("HH:mm"))
        this.form.id = data.id
        this.form.name = data.name
        this.kelasDialog = true
        this.titleDialog = 'Edit Kelas Data'
        this.isUpdate = true
      },
      resetForm() {
        this.form = {
          id: '',
          name: '',
        }
        this.isUpdate = false
      },
      handleCurrentChange(val) {
        this.$store.commit('kelas/setPage', val)
        this.$store.dispatch('kelas/getAll', {
          //
        });
      },
      onSubmit(type = 'store') {
        this.btnLoader = true
        let formData = new FormData()
        // formData.append("id", this.form.id)
        formData.append("name", this.form.name)
        let url = "/kelas/store";
        if (type == 'update') {
          url = `/kelas/${this.form.id}/update`
        }

        this.$axios.post(url, formData).then(resp => {
          if (resp.data.success) {
            this.$notify.success({
              title: 'Success',
              message: `Berhasil ${type == 'store' ? 'Menambah' : 'Mengubah'} Kelas`
            })
            this.resetForm()
            this.kelasDialog = false
            this.$store.dispatch('kelas/getAll', {
              //
            });
          }
        }).finally(() => {
          this.btnLoader = false
          this.$store.dispatch('kelas/getAll', {
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
      deleteKelas(id) {
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
            this.$axios.delete(`/kelas/${id}/delete`).then(resp => {
              if (resp.data.success) {
                this.$notify.success({
                  title: 'Success',
                  message: 'Berhasil Menghapus Data'
                })
                this.kelasDialog = false
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
      // formatTime(time){
      //   return moment(time, "HH:mm:ss").format('HH:mm');
      // }
    },
    computed: {
      ...mapGetters('kelas', [
        'getKelas',
        'getLoader'
      ])
    },
    watch: {
      getKelas(newValue, oldValue) {

      },
      search(newValue, oldValue) {
        this.$store.dispatch('kelas/getAll', {
          search: newValue
        });
      },
      page(newValue, oldValue) {
        this.$store.commit('kelas/setPage', newValue)
        this.$store.dispatch('kelas/getAll', {
          //
        });
      }
    },
  }

</script>

<style lang="scss" scoped>
  .heading {
    color: white;
    font-size: 25px;
    font-weight: bold;
  }

</style>
