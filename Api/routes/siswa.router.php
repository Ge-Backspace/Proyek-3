<?php

$router->get('/siswas', 'SiswaController@get');
$router->post('/siswa/store', 'SiswaController@store');
$router->post('/siswa/{id}/update', 'SiswaController@update');
