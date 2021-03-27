<?php

namespace App\Http\Controllers;

use App\Models\Kelas;
use Illuminate\Http\Request;

class KelasController extends Controller
{
    public function get(Request $request)
    {
        return $this->getPaginate(new Kelas, $request, ['name']);
    }

    public function store(Request $request)
    {
        return $this->storeData(new Kelas, ['name' => 'required|string'], $request->only(['name']));
    }

    public function update(Request $request, $id)
    {
        return $this->updateData(Kelas::find($id), ['name' => 'required|string'], $request->only(['name']));
    }

    public function delete($id)
    {
        return $this->deleteData(Kelas::find($id));
    }
}
