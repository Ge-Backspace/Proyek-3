<?php

namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Helpers\Variable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AbsensiController extends Controller
{
    public function check (Request $request)
    {
        $input = $request->only('user_id');
        $validator = Validator::make($input, [
            'user_id' => 'required|numeric',
        ], Helper::messageValidation());
        if ($validator->fails()) {
            return $this->resp(Helper::generateErrorMsg($validator->errors()->getMessages()), Variable::FAILED, false, 406);
        }
        $siswa = $this->getSiswaByUserId($input['user_id']);
        $jadwal = $this->getJadwalBySiswaId($siswa->id);
        return $this->resp($jadwal);
    }
}
