<?php

$router->get('/pelajarans', 'PelajaranController@get');
$router->post('/pelajaran/store', 'PelajaranController@store');
$router->post('/pelajaran/{id}/update', 'PelajaranController@update');
$router->delete('/pelajaran/{id}/delete', 'PelajaranController@delete');
