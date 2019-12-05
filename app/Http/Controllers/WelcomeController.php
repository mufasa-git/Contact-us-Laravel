<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Post;
use Mail;
use Session;
use Illuminate\Support\Facades\Route;
class WelcomeController extends Controller
{
    //
      protected $redirectTo = '/';

    public function index()
    {
    	return view('welcome');
    }

    public function postContact(Request $request) {
    	$this->validate($request, [
    		'name' => 'min:3',
    		'email' => 'required|email',
    		'message' => 'min:3'
    	]);
    	$data = array(
    		'name' => $request->name,
    		'email' => $request->email,
    		'bodyMessage' => $request->message,
    	);
    	Mail::send('emails.contact', $data, function($message) use ($data){
    		$message->from($data['email']);
    		$message->to('nanjizhao.sss@gmail.com');
    		$message->Subject($data['name']);
    	});
    //	Session::flash('success', 'Your Email has sent!');
//    	return redirect()->route('/');
    }
}
