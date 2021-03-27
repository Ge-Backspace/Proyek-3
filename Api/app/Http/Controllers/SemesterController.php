<?php

namespace App\Http\Controllers;

use App\Models\Semester;
use Illuminate\Http\Request;

class SemesterController extends Controller
{
    public function get (Request $request)
    {
        return $this->getPaginate(new Semester, $request, [
            'name', 'start_date', 'end_date'
        ]);
    }

    public function store (Request $request)
    {
        return $this->storeData(new Semester, [
            'name' => 'required|string',
            'start_date' => 'required|date|date_format:d-m-Y',
            'end_date' => 'required|date|date_format:d-m-Y'
        ], $request->only([
            'name', 'start_date', 'end_date'
        ]));
    }

    public function update (Request $request, $id)
    {
        return $this->updateData(Semester::find($id), [
            'name' => 'required|string',
            'start_date' => 'required|date|date_format:d-m-Y',
            'end_date' => 'required|date|date_format:d-m-Y'
        ], $request->only([
            'name', 'start_date', 'end_date'
        ]));
    }

    public function delete ($id)
    {
        return $this->deleteData(Semester::find($id));
    }
}
