<?php

namespace App\Http\Controllers;

use App\Models\Lokasi;
use Illuminate\Http\Request;

class LokasiController extends Controller
{
    public function get(Request $request)
    {
        return $this->getPaginate(new Lokasi, $request, ['name', 'lat', 'lng']);
    }

    public function store(Request $request)
    {
        return $this->storeData(new Lokasi, [
            'name' => 'required|string',
            'lat' => 'required|string',
            'lng' => 'required|string'
        ], $request->only(['name', 'lat', 'lng']));
    }

    public function update(Request $request, $id)
    {
        return $this->updateData(Lokasi::find($id), [
            'name' => 'required|string',
            'lat' => 'required|string',
            'lng' => 'required|string'
        ], $request->only(['name', 'lat', 'lng']));
    }

    public function delete($id)
    {
        return $this->deleteData(Lokasi::find($id));
    }
}
