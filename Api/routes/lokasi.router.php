<?php

$router->get('/lokasis', 'LokasiController@get');
$router->post('/lokasi/store', 'LokasiController@store');
$router->post('/lokasi/{id}/update', 'LokasiController@update');
$router->delete('/lokasi/{id}/delete', 'LokasiController@delete');
