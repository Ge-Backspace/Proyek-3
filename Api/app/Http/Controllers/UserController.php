<?php

namespace App\Http\Controllers;

use App\Models\Siswa;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function get (Request $request)
    {
        return $this->getPaginate(
            User::join('roles as rol', 'roles.id', '=', 'users.role_id')
            ->select(DB::raw('users.*, users.id as id, role.*, role.name as role_name'))
        , $request, [
            'users.username', 'users.email', 'roles.name'
        ]);
    }

    public function add (Request $request)
    {
        $input = $request->only(['email', 'username', 'password']);
        $password = Hash::make($input['password']);
        $input = Arr::set($user, 'password', $password);
        return $this->storeData(new User, [
            'email' => 'required',
            'username' => 'required',
            'password' => 'required',
        ], $input);
    }

    public function update (Request $request, $id)
    {
        $input = $request->only(['email', 'username', 'password']);
        $password = Hash::make($input['password']);
        $input = Arr::set($user, 'password', $password);
        return $this->storeData(Siswa::find($id), [
            'email' => 'required',
            'username' => 'required',
            'password' => 'required',
        ], $input);
    }

    public function delete ($id)
    {
        return $this->deleteData(Siswa::find($id));
    }
}
