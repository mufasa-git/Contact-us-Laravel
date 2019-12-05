<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMail;
use Illuminate\Support\Facades\Input;

class MailController extends Controller
{
    // public function send(Request $request)
    // {
    //     $this->validate($request, [
    //         'email' => 'required'
    //     ]);
    // 	Mail::to($request->input('email'))->send(new SendMail());
    // 	return redirect()->back()->with('success', 'Email sent successfully. Check your email.');
    // }

	$to_name = 'TO_NAME';
	$to_email = 'TO_EMAIL_ADDRESS';
	$data = array('name'=>"Hello, this is email testing", "body" => "Test mail");
	    
	Mail::send('welcome', $data, function($message) use ($to_name, $to_email) {
	    $message->to($to_email, $to_name)
	            ->subject('Artisans Web Testing Mail');
	    $message->from('FROM_EMAIL_ADDRESS','Artisans Web');
	});
}
