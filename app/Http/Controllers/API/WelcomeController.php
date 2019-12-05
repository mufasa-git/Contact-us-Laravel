<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Post;
use Mail;
use Illuminate\Support\Facades\Auth; 

use Session;

use Validator;
class WelcomeController extends Controller
{
    //
      protected $redirectTo = '/';
    public $successStatus = 200;
    public function index()
    {
    	return view('welcome');
    }

    public function postContact(Request $request) {

        $data = Validator::make($request->all(), [ 
            'name' => 'required', 
            'email' => 'required|email', 
            'message' => 'required',
        ]);

    	if ($data->fails()) {
    		return response()->json(['success'=>false, 'error'=>$data->errors()], 401);
    	}
    	// Mail::send('emails.contact', $data, function($message) use ($data){
    	// 	// $message->from($data['email']);
    	// 	// $message->to('lionk5236@gmail.com');
    	// 	// $message->Subject($data['name']);
    	// });
        $data = []; // Empty array
        $data['bodyMessage'] = $request->message;
        $data['email'] = $request->email;

        Mail::send('emails.contact', $data, function($message)
        {
            $message->to('lionk5236@gmail.com', 'Jon Doe')->subject('jhjj');
        });
      	return response()->json(['success'=>true], $this->successStatus);
    
       
    }
}
