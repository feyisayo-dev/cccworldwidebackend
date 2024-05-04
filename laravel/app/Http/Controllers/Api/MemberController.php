<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\adminController;
use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\StoreUserRequest;
use App\Models\committee;
use App\Models\committemember;
use App\Models\committememberpayment;
use App\Models\juvelineharvest;
use App\Models\member;
use App\Models\tithe;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Http\ResponseTrait\original;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Validator;

class MemberController extends Controller
{
    use HttpResponses;

    // public function login(LoginRequest $request){

    //     $member  = member::where('email', '=', $request->email)->first();

    //     if(!$member ){

    //         return $this->error(''," Email address not found! Kindly registered as a member to login ",200);
    //     }else{

    //     if ($member && Hash::check($request['password'], $member->password)) {
    //         return $this->success([
    //             $member ,
    //             'Member Login Sucessfully',
    //             'token'=>$member->createToken('API Token of '.$member ->email)->plainTextToken
    //         ]);

    //     }else{

    //         return response()->json([
    //             'status' => 500,
    //             'message' => 'Something went wrong',
    //         ], 200);
    //     }
    //     }
    // }

    public function login(LoginRequest $request)
    {

        $member = member::where('email', '=', $request->email)->first();
        if (!$member) {
            return $this->error('',
                "Email address not found! Kindly register as a member to login",
                200);
        } else {
            if ($member && Hash::check($request['password'], $member->password)) {

                $thumbnailPath = Storage::url($member->thumbnail);
                $thumnailPublicpath = URL::to($thumbnailPath);

                if ($member['role'] === 'Client') {

                    $response = [
                        'userAbilities' => [
                            [
                                'action' => 'read',
                                'subject' => 'Auth',
                            ],
                            [
                                'action' => 'read',
                                'subject' => 'AclDemo',
                            ],
                            // ... add other abilities as needed
                        ],
                        'accessToken' => $member->createToken('API Token of ' . $member->email)->plainTextToken,
                        'userData' => [
                            // $member
                            'id' => $member->id,
                            'fullName' => $member->sname, // Adjust the attribute names accordingly
                            'UserId' => $member->UserId,
                            'avatar' => $thumnailPublicpath,
                            'email' => $member->email,
                            'role' => $member->role,
                            'parishcode' => $member->parishcode,
                            'parishname' => $member->parishname,
                            // ... add other user data as needed
                        ],
                    ];
                } else {
                    $response = [
                        'userAbilities' => [
                            [
                                'action' => 'manage',
                                'subject' => 'all',
                            ],
                            // ... add other abilities as needed
                        ],
                        'accessToken' => $member->createToken('API Token of ' . $member->email)->plainTextToken,
                        'userData' => [
                            // $member
                            'id' => $member->id,
                            'fullName' => $member->sname . ' ' . $member->fname, // Adjust the attribute names accordingly
                            'UserId' => $member->UserId,
                            'avatar' => $thumnailPublicpath,
                            'email' => $member->email,
                            'role' => $member->role,
                            'parishcode' => $member->parishcode,
                            'parishname' => $member->parishname,
                            // ... add other user data as needed
                        ],
                    ];
                }
                return response()->json($response);
            } else {
                $response = [
                    'status' => 'false', // or 'error' based on your preference
                    'message' => 'Invalid credentials',
                ];

                return response()->json($response,
                    401);
            }

        }
    }

    public function Addmember(StoreUserRequest $request)
    {

        $fetchparish = adminController::FetchAllParishes($request->parishcode);

        $decode_Parish = adminController::decodeParishName($fetchparish);

        $parishName = $decode_Parish['parishname'];

        $append_sender = $from = $parishName;
        $body = 'Welcome to ' . $parishName . ', We are happy to see you worship the Lord with us , God will meet you at your point of need. Amen';
        $api_token = 'Bw3uqEgd4AF7c6A7Gv5BGWJTTfCP5V9psAs1xM8rGPd59eWSNqYy0QSJSJZ9';
        $direct_refund = 'direct-hosted';
        $to = $request->mobile;
        $member = validator($request->all());
        $ParismemberCount = member::where('parishcode', $request->parishcode)->count();

        if ($ParismemberCount == 0) {
            $ParismemberCount = 1;
            $num_padded = sprintf("%02d", $ParismemberCount);
        } elseif ($ParismemberCount < 10) {
            $ParismemberCount = $ParismemberCount + 1;
            $num_padded = sprintf("%02d", $ParismemberCount);
        } else {
            $num_padded = $ParismemberCount + 1;
        }

        if ($request->hasFile('thumbnail')) {

            $fileUploaded = $request->file('thumbnail');
            $memberNewPic = $request->parishcode . $num_padded . '.' . $fileUploaded->getClientOriginalExtension();
            $thumbnailPath = $fileUploaded->storeAs('thumbnails', $memberNewPic, 'public');

            //    Store new profile image

            $baseUrl = config('app.url') . '/laravel/storage/app/public/' . $thumbnailPath;
        } else {
            $thumbnailPath = ""; // Or provide a default image path
        }

        $member = member::create([
            'UserId' => $request->parishcode . $num_padded,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'sname' => $request->sname,
            'fname' => $request->fname,
            'mname' => $request->mname,
            'Gender' => $request->Gender,
            'dob' => $request->dob,
            'mobile' => $request->mobile,
            'Altmobile' => $request->Altmobile,
            'Residence' => $request->address,
            'Country' => $request->Country,
            'State' => $request->State,
            'City' => $request->City,
            'Title' => $request->Title,
            'dot' => $request->dot,
            'MStatus' => $request->MStatus,
            'ministry' => $request->ministry,
            'Status' => $request->Status,
            'thumbnail' => $thumbnailPath,
            'parishcode' => $request->parishcode,
            'parishname' => $parishName,
            'role' => 'Client',
        ]);

        if ($member) {

            $sendRegistrationSms = adminController::sendSmsViaApp($from, $to, $body, $api_token, $append_sender, $direct_refund);

            return response()->json([
                'data' => $member,
                'sms' => $sendRegistrationSms,
                'Member created sucessfully',
                // 'token'=>$member->createToken('API Token of '.$member->email)->plainTextToken
            ]);

        } else {
            return response()->json([
                'status' => 500,
                'message' => 'Something went wrong user registration not sucessful',
            ], 200);
        }

    }

    public function fetchAllMembers()
    {

        $members = member::with('children')->get();
        $memberCount = $members->count();
        $page = 1;
        $pageSize = 10;
        $totalPages = ceil($memberCount / $pageSize);

        if ($members->count() > 0) {

            return response()->json([
                'status' => 200,
                'message' => 'Record fetched successfully',
                'usersDetails' => $members->toArray(),
                'users' => array_map(function ($member) {
                    if (empty($member['thumbnail'])) {
                        $thumnailPublicpath = ' ';
                    } else {

                        $thumbnailPath = Storage::url($member['thumbnail']);
                        $thumnailPublicpath = URL::to($thumbnailPath);
                    }
                    return [
                        'id' => $member['id'],
                        'fullName' => $member['sname'] . ' ' . $member['fname'], // Adjust the attribute names accordingly
                        'gender' => $member['Gender'],
                        'avatar' => $thumnailPublicpath,
                        'email' => $member['email'],
                        'mobile' => $member['mobile'],
                        'role' => $member['role'],
                        // Add other user data as needed
                    ];
                }, $members->toArray()),

                // 'users' => $members,
                // 'usersDetails' => array_map(function ($member) {
                //     return [
                //         'id' => $member->id,
                //         'fullName' => $member->fullName, // Adjust the attribute names accordingly
                //         'username' => $member->username,
                //         'avatar' => $member->avatarPublicPath,
                //         'email' => $member->email,
                //         'role' => $member->role,
                //         // Add other user data as needed
                //     ];
                // }, $members),
                // 'users' => [
                //     // $member
                //     'id' => $members->id,
                //     // 'fullName' => $fullName, // Adjust the attribute names accordingly
                //     // 'username' => $members->username,
                //     'avatar' =>$thumnailPublicpath,
                //     'email' => $members->email,
                //     'role' => $members->role,
                //     // ... add other user data as needed
                // ],
                'totalUsers' => $memberCount,
                'totalPages' => $totalPages,
                'page' => $page,

            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'No records found!',
                'member_count' => 0,
                'total_pages' => 0,
            ], 404);
        }

    }

    public static function GetMember($UserId)
    {
        $member = Member::with('children')
            ->where('UserId', '=', $UserId)
            ->get();

        if ($member) {
            return response()->json([
                'status' => 200,
                'message' => 'Record fetched successfully',
                'member' => $member,
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User not found',
            ], 404);
        }

    }

    public function updateMember(Request $request, String $UserId)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email |max:191',
            'sname' => 'required|string|max:191',
            'fname' => 'required|string|max:191',
            'mname' => 'required|string|max:191',
            'Gender' => 'required|string|max:191',
            'dob' => 'required|string|max:191',
            'mobile' => 'required|string|max:191',
            'Altmobile' => 'required|string|max:191',
            'Residence' => 'required|string|max:191',
            'Country' => 'required|string|max:191',
            'State' => 'required|string|max:191',
            'City' => 'required|string|max:191',
            'Title' => 'required|string|max:191',
            'dot' => 'required|string|max:191',
            'MStatus' => 'required|string|max:191',
            'ministry' => 'required|string|max:191',
            'Status' => 'required|string|max:191',
            'thumbnail' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'error' => $validator->messages(),
            ], 422);

        } else {

            if ($request->hasFile('thumbnail')) {
                $file = $request->file('thumbnail');
                $Thumbnail = $UserId . '.' . $file->getClientOriginalExtension();
                $thumbnailPath = $file->storeAs('thumbnails', $Thumbnail, 'public');
            } else {
                $thumbnailPath = null; // Or provide a default image path
            }

            $fetchparish = adminController::FetchAllParishes($request->parishcode)->original['Allparish'];
            $parishNames = implode(', ', array_column($fetchparish, 'parishname'));

            $member = validator($request->all());

            $member = member::where('UserId', '=', $UserId)->first();

            if ($member) {
                $member->update([
                    // 'UserId' => $request->UserId,
                    'email' => $request->email,
                    // 'password' => $request->password,
                    'sname' => $request->sname,
                    'fname' => $request->fname,
                    'mname' => $request->mname,
                    'Gender' => $request->Gender,
                    'dob' => $request->dob,
                    'mobile' => $request->mobile,
                    'Altmobile' => $request->Altmobile,
                    'Residence' => $request->Residence,
                    'Country' => $request->Country,
                    'State' => $request->State,
                    'City' => $request->City,
                    'Title' => $request->Title,
                    'dot' => $request->dot,
                    'MStatus' => $request->MStatus,
                    'ministry' => $request->ministry,
                    'Status' => $request->Status,
                    'thumbnail' => $thumbnailPath,
                    'parishcode' => $request->parishcode,
                    'parishname' => $parishNames,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'Member information updated Sucessfully !',
                    'member' => $member,
                ], 200);

            } else {

                return response()->json([
                    'status' => 500,
                    'message' => 'Update failed as user is not found',
                ], 200);

            }
        }

    }

    public function deleteMember($UserId)
    {

        $member = member::where('UserId', '=', $UserId)->first();
        if ($member) {

            $member->delete();
            return response()->json([
                'status' => 200,
                'message' => 'Member deleted  successfully',
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User/Member not found',
            ], 404);
        }

    }

    public function AddNewTithe(Request $request)
    {

        $validator = Validator::make($request->all(), [
            //validator used in input data(Add New Parish)-copy and paste
            'UserId' => 'required|string|max:191',
            'pymtdate' => 'required|string|max:191',
            'Amount' => 'required|string|max:191',
            'pymtImg' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            // we dont have to add picode bc we will generate it ourselve
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'error' => $validator->messages(),
            ], 422);

        } else {

            $member = member::where('UserId', $request->UserId)->get();

            if ($request->hasFile('pymtImg')) {

                $fileUploaded = $request->file('pymtImg');
                $paymentImg = $request->pymtdate . '' . $request->UserId . '.' . $fileUploaded->getClientOriginalExtension();
                $pymtImgPath = $fileUploaded->storeAs('pymtImgs', $paymentImg, 'public');
            } else {
                $pymtImgPath = ""; // Or provide a default image path
            }
            if (!$member) {
                return response()->json([
                    'status' => 500,
                    'message' => 'Member does not exist',
                ], 200);
            } else {

                $Surname = $member[0]['sname'];
                $FirstName = $member[0]['fname'];
                $MiddleName = $member[0]['mname'];
                $pariscode = $member[0]['parishcode'];
                $parisname = $member[0]['parishname'];

                $tithe = tithe::create([
                    'UserId' => $request->UserId,
                    'FullName' => $Surname . ' ' . $FirstName . ' ' . $MiddleName,
                    'pymtdate' => $request->pymtdate,
                    'Amount' => $request->Amount,
                    'parishcode' => $pariscode,
                    'parishname' => $parisname,
                    'pymtImg' => $pymtImgPath,
                ]);

            }

            if ($tithe) {

                return response()->json([
                    'status' => 200,
                    'message' => ' Tithe paid sucessfully',
                    'tithe' => $tithe,
                ], 200);
            } else {

                return response()->json([
                    'status' => 500,
                    'message' => 'Something went wrong ' . ' tithe not created',
                ], 200);
            }

        }
    }

    public function GetATithe($UserId)
    {
        $tithe = tithe::where('UserId', '=', $UserId)->first();
        if ($tithe) {
            return response()->json([
                'status' => 200,
                'message' => $UserId . ' Record fetched successfully',
                'tithe ' => $tithe,
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User not found',
            ], 404);
        }

    }

    public function GetAllParishTithe($parishcode)
    {
        $tithe = tithe::where('parishcode', '=', $parishcode)->get();
        if ($tithe) {
            return response()->json([
                'status' => 200,
                'message' => $parishcode . ' Record fetched successfully',
                'tithe ' => $tithe,
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User not found',
            ], 404);
        }

    }

    public function UpdateTithe(Request $request, String $UserId)
    {

        $validator = Validator::make($request->all(), [
            //validator used in input data(tithe)-copy and paste
            //'UserId'       => 'required|string|max:191',
            'pymtdate' => 'required|string|max:191',
            'Amount' => 'required|string|max:191',
            'pymtImg' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            //'sname' => 'required|string|max:191',
            //'fname' => 'required|string|max:191',
            //'mname' => 'required|string|max:191',
            //'parishcode'  =>'required|string|max:191',
            //'parishname' =>'required|string|max:191',

            // we dont have to add userId bc we will generate it ourselve
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'error' => $validator->messages(),
            ], 422);

        } else {

            if ($request->hasFile('pymtImg')) {
                $file = $request->file('pymtImg');
                $pymtImg = $request->pymtdate . '' . $UserId . '.' . $file->getClientOriginalExtension();
                $pymtImgPath = $file->storeAs('pymtImgs', $pymtImg, 'public');
            } else {
                $pymtImgPath = null; // Or provide a default image path
            }

            $fetchparish = adminController::FetchAllParishes($request->parishcode)->original['Allparish'];
            $parishNames = implode(', ', array_column($fetchparish, 'parishname'));

            $tithe = validator($request->all());

            $tithe = tithe::where('UserId', '=', $UserId)->first();

            if ($tithe) {
                $tithe->update([
                    //'UserId'       => $request->UserId,
                    //'sname'  =>$request->sname,
                    //'fname'  =>$request->fname,
                    //'mname'  =>$request->mname,
                    'pymtdate' => $request->pymtdate,
                    'Amount' => $request->Amount,
                    //'parishcode'     =>$request->pariscode,
                    //'parishname'        =>$request->parisname,
                    'pymtImg' => $pymtImgPath,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'Tithe information updated Sucessfully !',
                    'tithe' => $tithe,
                ], 200);

            } else {

                return response()->json([
                    'status' => 500,
                    'message' => 'Update failed as user is not found',
                ], 200);

            }
        }

    }

    public function DeleteTithe($UserId)
    {

        $tithe = tithe::where('UserId', '=', $UserId)->first();
        if ($tithe) {

            $tithe->delete();
            return response()->json([
                'status' => 200,
                'message' => 'tithe deleted  successfully',
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User/tithe not found',
            ], 404);
        }

    }

    public function AddNewJuvelineHarvest(Request $request)
    {

        $validator = Validator::make($request->all(), [
            //validator used in input data(Add New Parish)-copy and paste
            'UserId' => 'required|string|max:191',
            'pymtdate' => 'required|string|max:191',
            'Amount' => 'required|string|max:191',
            'pymtImg' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            // we dont have to add picode bc we will generate it ourselve
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'error' => $validator->messages(),
            ], 422);

        } else {

            $member = member::where('UserId', $request->UserId)->get();

            if ($request->hasFile('pymtImg')) {

                $fileUploaded = $request->file('pymtImg');
                $jhpaymentImg = $request->pymtdate . '' . $request->UserId . '.' . $fileUploaded->getClientOriginalExtension();
                $pymtImgPath = $fileUploaded->storeAs('jharvestpymtImgs', $jhpaymentImg, 'public');
            } else {
                $pymtImgPath = ""; // Or provide a default image path
            }
            if (!$member) {
                return response()->json([
                    'status' => 500,
                    'message' => 'Member does not exist',
                ], 200);
            } else {

                $Surname = $member[0]['sname'];
                $FirstName = $member[0]['fname'];
                $MiddleName = $member[0]['mname'];
                $pariscode = $member[0]['parishcode'];
                $parisname = $member[0]['parishname'];

                $juvelineharvest = juvelineharvest::create([
                    'UserId' => $request->UserId,
                    'FullName' => $Surname . ' ' . $FirstName . ' ' . $MiddleName,
                    'pymtdate' => $request->pymtdate,
                    'Amount' => $request->Amount,
                    'parishcode' => $pariscode,
                    'parishname' => $parisname,
                    'pymtImg' => $pymtImgPath,
                ]);
            }

            if ($juvelineharvest) {

                return response()->json([
                    'status' => 200,
                    'message' => ' juvelineharvest paid sucessfully',
                    'juvelineharvest' => $juvelineharvest,
                ], 200);
            } else {

                return response()->json([
                    'status' => 500,
                    'message' => 'Something went wrong ' . ' juvelineharvest not created',
                ], 200);
            }

        }
    }

    public function GetAllParishJuvelineDue($parishcode)
    {
        $juvelineharvest = juvelineharvest::where('parishcode', '=', $parishcode)->get();
        if ($juvelineharvest) {
            return response()->json([
                'status' => 200,
                'message' => $parishcode . ' Record fetched successfully',
                'juvelineharvest ' => $juvelineharvest,
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User not found',
            ], 404);
        }

    }

    public function GetAJuvelineDue($UserId)
    {
        $juvelineharvest = juvelineharvest::where('UserId', '=', $UserId)->first();
        if ($juvelineharvest) {
            return response()->json([
                'status' => 200,
                'message' => $UserId . ' Record fetched successfully',
                'juvelineharvest ' => $juvelineharvest,
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User not found',
            ], 404);
        }

    }

    public function UpdateJuvelineDue(Request $request, String $UserId)
    {

        $validator = Validator::make($request->all(), [
            //validator used in input data(tithe)-copy and paste
            //'UserId'       => 'required|string|max:191',
            'pymtdate' => 'required|string|max:191',
            'Amount' => 'required|string|max:191',
            'pymtImg' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            //'sname' => 'required|string|max:191',
            //'fname' => 'required|string|max:191',
            //'mname' => 'required|string|max:191',
            //'parishcode'  =>'required|string|max:191',
            //'parishname' =>'required|string|max:191',

            // we dont have to add userId bc we will generate it ourselve
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'error' => $validator->messages(),
            ], 422);

        } else {

            if ($request->hasFile('pymtImg')) {
                $file = $request->file('pymtImg');
                $jhpaymentImg = $request->pymtdate . '' . $UserId . '.' . $file->getClientOriginalExtension();
                $jhpaymentImgPath = $file->storeAs('jhpaymentImgs', $jhpaymentImg, 'public');
            } else {
                $jhpaymentImgPath = null; // Or provide a default image path
            }

            $fetchparish = adminController::FetchAllParishes($request->parishcode)->original['Allparish'];
            $parishNames = implode(', ', array_column($fetchparish, 'parishname'));

            $juvelineharvest = validator($request->all());

            $juvelineharvest = juvelineharvest::where('UserId', '=', $UserId)->first();

            if ($juvelineharvest) {
                $juvelineharvest->update([
                    //'UserId'       => $request->UserId,
                    //'sname'  =>$request->sname,
                    //'fname'  =>$request->fname,
                    //'mname'  =>$request->mname,
                    'pymtdate' => $request->pymtdate,
                    'Amount' => $request->Amount,
                    //'parishcode'     =>$request->pariscode,
                    //'parishname'        =>$request->parisname,
                    'pymtImg' => $jhpaymentImgPath,
                ]);
                return response()->json([
                    'status' => 200,
                    'message' => 'juvelineharvest information updated Sucessfully !',
                    'juvelineharvest' => $juvelineharvest,
                ], 200);

            } else {

                return response()->json([
                    'status' => 500,
                    'message' => 'Update failed as user is not found',
                ], 200);

            }
        }

    }

    public function DeleteJuvelineDue($UserId)
    {

        $juvelineharvest = juvelineharvest::where('UserId', '=', $UserId)->first();
        if ($juvelineharvest) {

            $juvelineharvest->delete();
            return response()->json([
                'status' => 200,
                'message' => 'juvelineharvest deleted  successfully',
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User/juvelineharvest not found',
            ], 404);
        }

    }

//     public function searchAllMembers(Request $request)
// {
//     $searchQuery = $request->input('q');

//     $query = Member::with('children');

//     // Apply search filter if a search query is provided
//     if ($searchQuery) {
//         $query->where(function ($subquery) use ($searchQuery) {
//             $subquery->where('sname', 'like', '%' . $searchQuery . '%')
//                      ->orWhere('fname', 'like', '%' . $searchQuery . '%')
//                      ->orWhere('email', 'like', '%' . $searchQuery . '%');
//             // Add additional columns as needed for searching
//         });
//     }

//     $members = $query->get();
//     $memberCount = $members->count();
//     $page = 1;
//     $pageSize = 10;
//     $totalPages = ceil($memberCount / $pageSize);

//     if ($members->count() > 0) {
//         return response()->json([
//             'status' => 200,
//             'message' => 'Record fetched successfully',
//             'usersDetails' => $members->toArray(),
//             'users' => array_map(function ($member) {
//                 // ... (your existing transformation logic)
//             }, $members->toArray()),
//             'totalUsers' => $memberCount,
//             'totalPages' => $totalPages,
//             'page' => $page,
//         ], 200);
//     } else {
//         return response()->json([
//             'status' => 404,
//             'message' => 'No records found!',
//             'member_count' => 0,
//             'total_pages' => 0,
//         ], 404);
//     }
// }

    // public function logout()
    // {
    //     Auth::user()->currentAccessToken()->delete();

    //     return $this->success([
    //         'message' => 'You have succesfully been logged out and your token has been removed'
    //     ]);
    // }

    public function addCommitteePayment(Request $request)
    {


        $validator = Validator::make($request->all(), [
            'committeRefno' => 'required|string|max:191',
            'memberId' => 'required|string|max:191',
            'amount' => 'required|string|max:191',
            'paymentdate' => 'required|string|max:191',
            // 'receiptupload' => 'required|string|max:191',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'error' => $validator->messages(),
            ], 422);
        } else {
            $fullName = " ";
            $parishcode = "";
            $parishname = "";
            $roleName = " ";
            //get committe Name
            $committee = committee::where('committeRefno', $request->committeRefno)->first();
            $committeeName = $committee['committeName'];

            $getcommitteeMember = CommitteMember::where('memberId', $request->memberId)
                ->where('committeRefno', $request->committeRefno)
                ->first();

            if ($getcommitteeMember) {
                $fullName = $getcommitteeMember['memberName']; //paidby
                $parishcode = $committee['parishcode'];
                $parishname = $committee['parishname'];
                $roleName = $getcommitteeMember['roleName'];

            } else {

                //Non committee member details-all other member of the parish contribution
                $getMember = MemberController::GetMember($request->memberId); //GetMember function is from Get member controller

                if ($getMember) {
                    //decode details
                    $decodeMemberName = adminController::decodeMemberName($getMember);

                    $fullName = $decodeMemberName['sname'] . ' ' . $decodeMemberName['fname'] . ' ' . $decodeMemberName['mname']; //paidby
                    $parishcode = $decodeMemberName['parishcode'];
                    $parishname = $decodeMemberName['parishname'];
                    $roleName = "Non-committe Member";
                }
            }
            $createCommitteePayment = committememberpayment::create([
                'committeRefno' => $request->committeRefno,
                'committename' => $committeeName,
                'UserId' => $request->memberId,
                'paidfor' => '',
                'paidby' => $fullName,
                'parishcode' => $parishcode,
                'parishname' => $parishname,
                'amount' => $request->amount,
                'receipt' => '',
                'roleName' => $roleName,
                'paymentdate' => $request->paymentdate,
            ]);

            if ($createCommitteePayment) {
                return response()->json([
                    'status' => 200,
                    'message' => 'Payment Uploaded successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 500,
                    'message' => 'Payment not uploaded successfully',
                ], 500);
            }
        }
    }

    public function GetACommitteeMemberPayment($userId)
    {

        $payments = committememberpayment::where('UserId', $userId)->get();

        if ($payments) {
            return response()->json([
                'status' => 200,
                'message' => ' Record fetched successfully',
                'data' => $payments,
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User not found',
            ], 404);
        }

    }

    public function GetMemberPymtforACommitee($UserId, $committeRefno)
    {

        $payments = committememberpayment::where('UserId', $UserId)->where('committeRefno', $committeRefno)->get();

        if (($payments)) {
            return response()->json([
                'status' => 200,
                'message' => ' Record fetched successfully',
                'data' => $payments,
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User not found',
            ], 404);

        }

    }
    public function GetACommitteeNamePayment($committeRefno)
    {
        $allData = committememberpayment::where('committeRefno', '=', 'NIG0120240422182901')->get();
        //$allData = committeepayment::where('committeRefno', '=', $committeRefno)->get();
        return $allData;
        if ($allData) {
            return response()->json([
                'status' => 200,
                'message' => ' Record fetched successfully',
            ], 200);
        } else {
            return response()->json([
                'status' => 404,
                'message' => 'User not found',
            ], 404);
        }

    }

    public function changeCommitteePayment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            //validator used in input data-copy and paste
            'oldcommitteRefno' => 'required|string|max:191',
            'oldmemberId' => 'required|string|max:191',
            'committeRefno' => 'required|string|max:191',
            'memberId' => 'required|string|max:191',

        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'error' => $validator->messages(),
            ], 422);
        }

        $getNewMemberDetails = MemberController::GetMember($request->new_member_id); //GetMember function is from Get member controller

        $decodeMemberName = adminController::decodeMemberName($getNewMemberDetails); // decodeMemberName function is down down

        $fullName = $decodeMemberName['sname'] . ' ' . $decodeMemberName['fname'] . ' ' . $decodeMemberName['mname'];
        $title = $decodeMemberName['Title'];
        $gender = $decodeMemberName['Gender'];
        $committename = $decodeMemberName['committename'];

        $getOldcommitteeMemberPayment = committememberpayment::where('UserId', $request->memberId)->where('committeRefno', $request->committeRefno)->first();

        if ($getOldcommitteeMemberPayment && $getNewMemberDetails) {
            // Update the old committee member details with the new member details
            $getOldcommitteeMemberPayment->update([
                'paidfor' => $fullName,
                'UserId' => $request->new_member_id,
                "committename" => $committename,
                // Add other fields that you want to update
            ]);
        }
        if ($getOldcommitteeMemberPayment) {
            return response()->json([
                'status' => 200,
                'message' => 'Message Change will be change based on Parochail Chairman Approval',
                'data' => $getOldcommitteeMemberPayment,
            ], 200);
        }
    }

}
