<?php

$router->get('/kelas', 'KelasController@get');
$router->post('/kelas/store', 'KelasController@store');
$router->post('/kelas/{id}/update', 'KelasController@update');
$router->delete('/Kelas/{id}/delete', 'KelasController@delete');
