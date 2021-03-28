<?php

namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Helpers\Variable;
use App\Models\JadwalPelajaran;
use App\Models\Semester;
use Carbon\Carbon;
use Carbon\CarbonInterval;
use DatePeriod;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class JadwalPelajaranController extends Controller
{
    public function get (Request $request)
    {
        return $this->getPaginate(JadwalPelajaran::join('pelajarans as pel', 'pel.id', '=', 'jadwal_pelajarans.pelajaran_id')
                ->join('kelas as kel', 'kel.id', '=', 'jadwal_pelajarans.kelas_id')
                ->join('semesters as sem', 'sem.id', '=', 'jadwal_pelajarans.semester_id')
                ->select(DB::raw('pel.name as name_pelajaran, kel.name as kelas_name, sem.name as semester_name, jadwal_pelajarans.*, jadwal_pelajarans.id as id'))
        , $request, [
            'pelajarans.name', 'kelas.name', 'semesters.name'
        ]);
    }

    public function store (Request $request)
    {
        $input = $request->only('pelajaran_id', 'kelas_id', 'semester_id', 'schedule', 'date');
        $validator = Validator::make($input, [
            'pelajaran_id' => 'required|numeric',
            'kelas_id' => 'required|numeric',
            'semester_id' => 'required|numeric',
            'schedule' => 'required',
            'start_date' => 'required|date|date_format:d-m-Y',
        ], Helper::messageValidation());
        if ($validator->fails()) {
            return $this->resp(Helper::generateErrorMsg($validator->errors()->getMessages()), 'Failed Add Data', false, 406);
        }
        $date = $this->intervalDate($input['semester_id'], $input['date']);
        foreach ($date as $key => $value) {
            if (JadwalPelajaran::where('date', $value)->where('schedule', $input['schedule'])) {
                return $this->resp(null, Variable::ALLREADY_EXIST, false, 406);
            } else {
                JadwalPelajaran::create([
                    'pelajaran_id' => $input['pelajaran_id'],
                    'kelas_id' => $input['kelas_id'],
                    'semester_id' => $input['semester_id'],
                    'schedule' => $input['schedule'],
                    'date' => $value
                ]);
            }
        }
        return $this->resp();
    }

    public function update (Request $request, $id)
    {
        return $this->updateData(JadwalPelajaran::find($id), [
            'pelajaran_id' => 'required|numeric',
            'kelas_id' => 'required|numeric',
            'semester_id' => 'required|numeric',
            'schedule' => 'required',
            'date' => 'required|date|date_format:d-m-Y'
        ], $request->only(['pelajaran_id', 'kelas_id', 'semester_id', 'schedule', 'date']));
    }

    public function delete ($id)
    {
        return $this->deleteData(JadwalPelajaran::find($id));
    }

    public function intervalDate ($semester_id, $start_date)
    {
        $start_date = Carbon::parse($start_date);
        $end_date = Carbon::parse(Semester::find($semester_id)->end_date);
        $date = new DatePeriod(
            $start_date,
            CarbonInterval::week(),
            $end_date
        );
        $result_date = [];
        foreach ($date as $day) {
            $result_date[] = $day->format('d-m-Y');
        }
        return $result_date;
    }
}
