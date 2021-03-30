
export const  menu = () => {
    return [
        {
            text: 'Home',
            icon: 'ni ni-shop text-primary',
            route: '/admin/beranda',
        },
        // {
        //     text: 'Employees',
        //     icon: 'el-icon-notebook-1 text-primary',
        //     route: '/admin/employees'
        // },
        // {
        //     text: 'Time Management',
        //     icon: 'el-icon-time text-primary',
        //     // route: '/admin/kegiatan',
        //     children: [
        //         {
        //             text: "Time Off",
        //             icon: 'el-icon-postcard',
        //             route: '/admin/time_management/timeoff'
        //         },
        //         {
        //             text: "Attendance",
        //             icon: 'el-icon-postcard',
        //             route: '/admin/time_management/attendance'
        //         },
        //         {
        //             text: "Calendar",
        //             icon: 'el-icon-postcard',
        //             route: '/admin/time_management/calendar'
        //         },
        //         // {
        //         //     text: "Timesheet",
        //         //     icon: 'el-icon-postcard',
        //         //     route: '/admin/time_management/timesheet'
        //         // },

        //     ]
        // },
        // {
        //     text: 'Finances',
        //     icon: 'el-icon-tickets text-primary',
        //     // route: '/admin/berita',
        //     children: [
        //         {
        //             text: "Reimbursement",
        //             icon: 'el-icon-postcard',
        //             route: '/admin/finances/reimbursement'
        //         },
        //         {
        //             text: "Cash Advance Request",
        //             icon: 'el-icon-postcard',
        //             route: '/admin/finances/cash'
        //         },
        //         {
        //           text: "Loan",
        //           icon: 'el-icon-postcard',
        //           route: '/admin/finances/loan'
        //       },
        //     ]
        // },
        // {
        //     text: 'Company',
        //     icon: 'el-icon-warning-outline text-primary',
        //     route: '/admin/company'
        // },
        {
            text: 'Jadwal Mata Pelajaran',
            icon: 'bx bx-shuffle text-primary',
            route: '/admin/jadwalMapel'
        },
        // {
        //     text: 'Permissions',
        //     icon: 'bx bx-question-mark text-primary',
        //     // route: '/admin/permission'
        //     children: [
        //       {
        //           text: "Permission Cuti",
        //           icon: 'el-icon-postcard',
        //           route: '/admin/permissions/cuti'
        //       },
        //       {
        //         text: "Permission Change Shift",
        //         icon: 'el-icon-postcard',
        //         route: '/admin/permissions/shift'
        //     },
        //     {
        //         text: "Permission Overtime",
        //         icon: 'el-icon-postcard',
        //         route: '/admin/permissions/overtime'
        //     },
        //     ]
        // },
        {
            text: 'Mata Pelajaran',
            icon: 'bx bx-money text-primary',
            route: '/admin/mapel'
        },
        {
            text: 'Report Absen',
            icon: 'el-icon-document text-primary',
            route: '/admin/absen'
        },
        {
            text: 'Master Data',
            icon: 'bx bx-data',
            // route: '/admin/berita',
            children: [
                {
                  text: "Master Semester",
                  icon: 'el-icon-postcard',
                  route: '/admin/master/masterSemester'
                },
                {
                    text: "Master Siswa",
                    icon: 'el-icon-postcard',
                    route: '/admin/master/masterSiswa'
                },
                {
                    text: "Master Kelas",
                    icon: 'el-icon-postcard',
                    route: '/admin/master/masterKelas'
                },
                {
                    text: "Master Mata Pelajaran",
                    icon: 'el-icon-postcard',
                    route: '/admin/master/masterMapel'
                },
                {
                    text: "Master Lokasi",
                    icon: 'el-icon-postcard',
                    route: '/admin/master/masterLokasi'
                },
            ]
        },
        // {
        //     text: 'Calendar',
        //     icon: 'el-icon-user text-primary',
        //     route: '/admin/users'
        // },

    ]
};
