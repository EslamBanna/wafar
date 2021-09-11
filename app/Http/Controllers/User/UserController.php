<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User\Discount;
use App\Models\User\Food;
use App\Models\User\FoodCategorie;
use App\Models\User\Resturant;
use App\Models\User\Service;
use App\Models\User\User;
use App\Traits\GeneralTrait;
use Illuminate\Http\Request;
use Validator;

class UserController extends Controller
{

    use GeneralTrait;

    function documentaionAPIS()
    {
        return view('swagger.index');
    }
    public function index(Request $request)
    {
        try {
            $user = User::find($request->id);
            if (!$user) {
                return $this->returnError('201', 'fail');
            }
            if ($user->isVerified == 1) {
                $user['isVerified'] = true;
            } else {
                $user['isVerified'] = false;
            }
            return $this->returnData('data', $user, 'success');
        } catch (\Exception $e) {
            return $this->returnError('200', 'fail');
        }
    }


    public function createUser(Request $request)
    {
        try {
            $rules = [
                'email' => 'required|email|unique:users,email',
                'id' => 'required|max:50',
                'name' => 'required|max:255',
                'phone' => 'required',

            ];
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                $code = $this->returnCodeAccordingToInput($validator);
                return $this->returnValidationError($code, $validator);
            }

            $file_name = '';
            if ($request->hasFile('photo')) {
                $file_name  = $this->saveImage($request->photo, 'user');
            }
            User::create([
                'id' => $request->id,
                'email' => $request->email,
                'name' => $request->name,
                'phone' => $request->phone,
                'photo' => $file_name,
            ]);

            return $this->returnSuccessMessage('success');
        } catch (\Exception $e) {
            return $this->returnError('200', 'fail');
        }
    }

    public function updateUserInfo(Request $request)
    {
        try {

            $user = User::find($request->id);
            if (!$user) {
                return $this->returnError('201', 'fail');
            }

            if ($request->hasFile('photo')) {

                $file_name = $this->saveImage($request->photo, 'user');
                $data = $request->except('id', 'photo');
                $data['photo'] = $file_name;
            } else {
                $data = $request->except('id');
            }


            if ($request->isVerified == true) {
                $data['isVerified'] = 1;
            } else if ($request->isVerified == false) {
                $data['isVerified'] = 0;
            }


            $user->update($data);
            return $this->returnSuccessMessage('success');
        } catch (\Exception $e) {
            return $this->returnError('200', 'fail');
        }
    }

    public function getAllServices(Request $request)
    {
        try {
            $services = Service::paginate($request->paginateCount);
            return $this->returnData('data', $services, 'success');
        } catch (\Exception $e) {
            return $this->returnError('200', 'fail');
        }
    }

    public function getAllResturants(Request $request)
    {
        try {
            $resturants = Resturant::with('resturantCategorie')->paginate($request->paginateCount);
            return $this->returnData('data', $resturants, 'success');
        } catch (\Exception $e) {
            return $this->returnError('200', 'fail');
        }
    }

    public function getResturantCategories(Request $request)
    {
        try {

            $resturant = Resturant::find($request->resturantId);
            if (!$resturant) {
                return $this->returnError('201', 'fail');
            }
            $ResturantCategories = $resturant->resturantCategorie;
            return $this->returnData('data', $ResturantCategories, 'success');
        } catch (\Exception $e) {
            return $this->returnError('200', 'fail');
        }
    }

    public function getResturantFoods(Request $request)
    {
        try {
            $resturant = Resturant::find($request->resturantId);
            if (!$resturant) {
                return $this->returnError('201', 'fail');
            }
            $ResturantFoods = Food::with(['discount' => function ($q) {
                $q->select('id as discount_id', 'related_object', 'type', 'value')->orderBy('id', 'desc');
            }])->with(['categorie' => function ($q) {
                $q->select('id', 'name', 'photo');
            }])->select('id', 'categorie_id', 'rate', 'name', 'photo', 'price', 'icon', 'ingredients', 'calorie', 'cookTime', 'description')->where('resturant_id', $request->resturantId)->paginate($request->paginateCount);
            return $this->returnData('data', $ResturantFoods, 'success');
        } catch (\Exception $e) {
            return $this->returnError('200', $e->getMessage());
        }
    }


    public function getCategorieFoods(Request $request)
    {
        try {
            $categories = FoodCategorie::find($request->categorieId);
            if (!$categories) {
                return $this->returnError('201', 'fail');
            }
            $ResturantFoods = Food::with(['discount' => function ($q) {
                $q->select('id as discount_id', 'related_object', 'type', 'value')->orderBy('id', 'desc');
            }])->select('id', 'name', 'photo', 'rate', 'price', 'icon', 'ingredients', 'calorie', 'cookTime', 'description')->where('categorie_id', $request->categorieId)->paginate($request->paginateCount);
            return $this->returnData('data', $ResturantFoods, 'success');
        } catch (\Exception $e) {
            return $this->returnError('200', 'fail');
        }
    }


    public function getAllDiscounts()
    {
        try {
            $discounts = Discount::with('services')->select('id', 'related_object', 'service_id', 'type', 'value', 'created_at')
                ->orderBy('related_object')
                ->latest()
                ->get();

            $currentFlag = $discounts[0]['related_object'];
            $data[0] = $discounts[0];
            if ($discounts[0]['service_id'] == 1) {
                $food = Food::find($discounts[0]['related_object']);
                $data[0]['food'] = $food;
                $data[0]['food']['categorie'] = $food->categorie;
                $data[0]['food']['resturant'] = $food->resturant;
            }
            $coun = 1;

            for ($i = 1; $i < count($discounts); $i++) {
                if ($discounts[$i]['related_object'] > $currentFlag) {
                    $data[$coun] = $discounts[$i];
                    $currentFlag = $discounts[$i]['related_object'];
                    if ($discounts[$i]['service_id'] == 1) {
                        $food = Food::find($discounts[$i]['related_object']);
                        $data[$coun]['food'] = $food;
                        $data[$coun]['food']['categorie'] = $food->categorie;
                        $data[$coun]['food']['resturant'] = $food->resturant;
                    }
                    $coun++;
                }
            }
            return $this->returnData('discounts', $data, 'success');
        } catch (\Exception $e) {
            return $this->returnError('201', 'fail');
        }
    }
}
