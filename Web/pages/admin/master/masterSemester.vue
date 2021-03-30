<template>
  <div>
    <div class="header bg-warning pb-6">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <h1 class="heading">Master Data Absen</h1>
        </div>
      </div>
    </div>
    <div class="container-fluid mt--5">
      <div class="row">
        <div class="col-md-12">
          <el-card v-loading="getLoader" style="margin-top: 80px">
            <div class="row" style="margin-bottom: 20px">

              <div class="col-md-3 offset-md-9">
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
                  <vs-th>Name</vs-th>
                  <vs-th>Start Date</vs-th>
                  <vs-th>End Date</vs-th>
                  <vs-th>Action</vs-th>
                </vs-tr>
              </template>
              <template #tbody>
                <vs-tr :key="i" v-for="(tr, i) in getSemester.data" :data="tr">
                  <vs-td>
                    {{ tr.name }}
                  </vs-td>
                  <vs-td>
                    {{ tr.start_date }}
                  </vs-td>
                  <vs-td>
                    {{ tr.end_date }}
                  </vs-td>
                  <vs-td>
                    <el-tooltip
                      content="Edit"
                      placement="top-start"
                      effect="dark"
                    >
                      <el-button
                        size="mini"
                        @click="
                        edit(tr),
                        request = false"
                        icon="fa fa-edit"
                      ></el-button>
                    </el-tooltip>

                    <el-tooltip
                      content="Delete"
                      placement="top-start"
                      effect="dark"
                    >
                      <el-button
                        size="mini"
                        type="primary"
                        @click="deleteSemester(tr.id)"
                        icon="fa fa-trash"
                      >
                      </el-button>
                    </el-tooltip>
                  </vs-td>
                </vs-tr>
              </template>
              <template #footer>
                <vs-row>
                  <vs-col w="2">
                    <small>Total : {{ getSemester.total }} Data</small>
                  </vs-col>
                  <vs-col w="10">
                    <vs-pagination
                      v-model="page"
                      :length="Math.ceil(getSemester.total / table.max)"
                    />
                  </vs-col>
                </vs-row>
              </template>
            </vs-table>
          </el-card>
        </div>
      </div>
    </div>

    <!-- Floating Button -->
    <el-tooltip
      class="item"
      effect="dark"
      content="Tambah Semester Baru"
      placement="top-start"
    >
      <a
        class="float"
        @click="
          request = true;
          semesterDialog = true;
          titleDialog = 'Tambah Semester';
        "
      >
        <i class="el-icon-plus my-float"></i>
      </a>
    </el-tooltip>
    <!-- End floating button-->
    <vs-dialog v-model="semesterDialog" :width="$store.state.drawer.mode === 'mobile' ? '80%' : '60%'"
      @close="resetForm()">
      <template #header>
        <h1 class="not-margin">
          {{titleDialog}}
        </h1>
      </template>
      <div class="con-form">
        <vs-row>
          <vs-col vs-type="flex" vs-justify="center" vs-align="center" w="12" style="padding:5px">
            <label>Nama Semester</label>
            <vs-input type="text" v-model="form.name" placeholder="Masukkan Semester"></vs-input>
          </vs-col>
          <vs-col vs-type="flex" vs-justify="center" vs-align="center" w="6" style="padding:5px">
            <label>Start Date</label>
            <vs-input type="date" v-model="form.start_date"></vs-input>
          </vs-col>
          <vs-col vs-type="flex" vs-justify="center" vs-align="center" w="6" style="padding:5px">
            <label>End Date</label>
            <vs-input type="date" v-model="form.end_date"></vs-input>
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
              <vs-button block border @click="semesterDialog = false; resetForm()">Batal</vs-button>
            </vs-col>
          </vs-row>
          <div>&nbsp;</div>
        </div>
      </template>
    </vs-dialog>
  </div>
</template>

<script>
import moment from 'moment';
import { mapMutations, mapGetters } from "vuex";

export default {
  layout: "admin",
  data() {
    return {
      table: {
        max: 10,
      },
      request: false,
      error: {},
      active: "",
      option: [],
      page: 1,
      current_page: 1,
      titleDialog: "Tambah Semester",
      semesterDialog: false,
      search: '',
      // company_id: JSON.parse(JSON.stringify(this.$auth.user.company_id)),
      isUpdate: false,
      btnLoader: false,
      form: {
        name: '',
        start_date: '',
        end_date: '',

      },
    };
  },
  mounted() {
    // this.company_id = JSON.parse(JSON.stringify(this.$auth.user.company_id));
    this.$store.dispatch("semester/getAll", {
      //
    });
    // this.$store.dispatch("coordinate/getLocation", { company_id: this.company_id });
  },
  methods: {
    searchData() {
      this.$store.dispatch("semester/getAll", {
        search: this.search,
      });
    },
    edit(data) {
      this.form.id = data.id;
      this.form.name = data.name;
      this.form.start_date = data.start_date;
      this.form.end_date = data.end_date;
      this.semesterDialog = true;
      this.titleDialog = "Edit Semester";
      this.isUpdate = true;
    },
    resetForm() {
      this.form = {
        name: '',
        start_date: '',
        end_date: '',
      };
      this.isUpdate = false;
    },
    handleCurrentChange(val) {
      this.$store.commit("semester/setPage", val);
      this.$store.dispatch("semester/getAll", {
        //
      });
    },
    onSubmit(type = "store") {
      this.btnLoader = true;
      let formData = new FormData();
      formData.append("name", this.form.name);
      formData.append("start_date", this.form.start_date);
      formData.append("end_date", this.form.end_date);
      let url = "/semester/store";
      if (type == "update") {
        url = `/semester/${this.form.id}/update`;
      }
      this.$axios
        .post(url, formData)
        .then((resp) => {
          if (resp.data.success) {
            this.$notify.success({
              title: "Success",
              message: `Berhasil ${
                type == "store" ? "Menambah" : "Mengubah"
              } Semester`,
            });
            this.resetForm();
            this.semesterDialog = false;
            this.$store.dispatch("semester/getAll", {
              //
            });
          }
        })
        .finally(() => {
          this.btnLoader = false;
        })
        .catch((err) => {
          let error = err.response.data.data;
          if (error) {
            this.showErrorField(error);
          } else {
            this.$notify.error({
              title: "Error",
              message: err.response.data.message,
            });
          }
        });
    },
    deleteSemester(id) {
      this.$swal({
        title: "Perhatian!",
        text: "Apakah anda yakin ingin menghapus data ini?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Ya",
        cancelButtonText: "Batal",
      }).then((result) => {
        if (result.isConfirmed) {
          this.$axios
            .delete(`/semester/${id}/delete`)
            .then((resp) => {
              if (resp.data.success) {
                this.$notify.success({
                  title: "Success",
                  message: "Berhasil Menghapus Data",
                });
                this.semesterDialog = false;
                this.$store.dispatch("semester/getAll", {
                  // company_id: this.company_id,
                  defaultPage: true,
                });
              }
            })
            .finally(() => {
              //
            })
            .catch((err) => {
              this.$notify.error({
                title: "Error",
                message: err.response.data.message,
              });
            });
        }
      });
    },
    // updateCoordinates(location) {
    //   this.form.lat = location.latLng.lat(),
    //   this.form.lng = location.latLng.lng()
    // },
    // markers (location) {
    //   return {lat: Number(location.lat), lng: Number(location.lng)}
    // },
    // markersDefault(location){
    //   return {lat: Number(-6.200000), lng: Number(106.816666) }
    // },
    // check(test) {
    //   console.log(test)
    // }
  },
  computed: {
    ...mapGetters("semester", [
      "getSemester",
      "getLoader"
    ])
  },
  watch: {
    getOffices(newValue, oldValue){
      //
    },
    // lat(newValue, oldValue) {
    //   this.form.lat = newValue
    // },
    // lng(newValue, oldValue) {
    //   this.form.lng = newValue
    // },
  },
};
</script>

<style lang="scss" scoped>
.heading {
  color: white;
  font-size: 25px;
  font-weight: bold;
}
</style>
