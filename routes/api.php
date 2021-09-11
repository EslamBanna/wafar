<?php

use App\Http\Controllers\Controller;
use App\Http\Controllers\User\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

define('DOMAIN','http://localhost:8000/');

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'user'], function () {

    Route::post('/get-user-data', [UserController::class, 'index']);
    Route::post('/create-user', [UserController::class, 'createUser']);
    Route::post('/update-user-info', [UserController::class, 'updateUserInfo']);
    Route::post('/get-all-services', [UserController::class, 'getAllServices']);
    Route::post('/get-all-resturants', [UserController::class, 'getAllResturants']);
    Route::post('/get-resturant-categories', [UserController::class, 'getResturantCategories']);
    Route::post('/get-resturant-foods', [UserController::class, 'getResturantFoods']);
    Route::post('/get-categorie-foods', [UserController::class, 'getCategorieFoods']);
    Route::get('/get-all-discoutns', [UserController::class, 'getAllDiscounts']);


});


Route::get('/docs',[UserController::class,'documentaionAPIS']);
