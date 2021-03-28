<?php

namespace App\Http\Controllers;

use App\Models\Pelajaran;
use Illuminate\Http\Request;

class PelajaranController extends Controller
{
    public function get(Request $request)
    {
        return $this->getPaginate(new Pelajaran, $request, ['name']);
    }

    public function store(Request $request)
    {
        return $this->storeData(new Pelajaran, ['name' => 'required|string'], $request->only(['name']));
    }

    public function update(Request $request, $id)
    {
        return $this->updateData(Pelajaran::find($id), ['name' => 'required|string'], $request->only(['name']));
    }

    public function delete($id)
    {
        return $this->deleteData(Pelajaran::find($id));
    }
}
