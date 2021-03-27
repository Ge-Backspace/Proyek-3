<?php

namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Models\Siswa;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class SiswaController extends Controller
{
    public function get (Request $request)
    {
        $result = Siswa::join('kelas as kel', 'kel.id', '=', 'siswas.kelas_id')
            ->select(DB::raw('kel.id as kelas_id, kel.name as kelas_name, siswas.*'))
            ->orderBy('siswas.id', 'DESC');
        return $this->getPaginate($result, $request, [
            'siswas.name', 'siswas.nis', 'kel.name'
        ]);
    }

    public function store (Request $request)
    {
        $filterInput = $request->only([
            'email', 'username', 'password', 'aktif',
            'name', 'nis', 'kelas_id'
        ]);
        $validator = Validator::make($filterInput, [
            'email' => 'required',
            'username' => 'required',
            'password' => 'required',
            'aktif' => 'required|boolean',
            'name' => 'required|string',
            'nis' => 'required|string',
            'kelas_id' => 'required|numeric',
        ], Helper::messageValidation());
        if ($validator->fails()) {
            return $this->resp(Helper::generateErrorMsg($validator->errors()->getMessages()), 'Failed Add Data', false, 406);
        }
        $user = $request->only(['email', 'username', 'password', 'aktif']);
        $password = Hash::make($user['password']);
        $user = Arr::set($user, 'password', $password);
        $user = User::create($user);
        if (!$user) {
            return $this->resp(Helper::generateErrorMsg($validator->errors()->getMessages()), 'Failed Add Data', false, 406);
        }
        $input = $request->only('name', 'nis', 'kelas_id');
        $input = Arr::add($input, 'user_id', $user->id);
        return $this->storeData(new Siswa, [
            'user_id' => 'required|numeric'
        ], $input);
    }

    public function update (Request $request, $id)
    {
        $model = Siswa::find($id);
        $input = $request->only([
            'name', 'nis', 'kelas_id'
        ]);
        return $this->updateData($model, [
            'name' => 'required|string',
            'nis' => 'required|string',
            'kelas_id' => 'required|numeric',
        ], $input);
    }

    public function delete($id)
    {
        $model = Siswa::find($id);
        return $this->deleteData($model);
    }
}
