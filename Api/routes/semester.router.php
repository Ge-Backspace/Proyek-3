<?php

$router->get('/semesters', 'SemesterController@get');
$router->post('/semester/store', 'SemesterController@store');
$router->post('/semester/{id}/update', 'SemesterController@update');
$router->delete('/semester/{id}/delete', 'SemesterController@delete');
