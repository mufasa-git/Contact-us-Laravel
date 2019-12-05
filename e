[33mcommit 024dc8f303b5d1f0577c2d1dce778447393f3ea3[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: simba-git <lionk5236@gmail.com>
Date:   Thu Dec 5 10:21:56 2019 +0800

    first commit

[1mdiff --git a/app/Http/Controllers/MailController.php b/app/Http/Controllers/MailController.php[m
[1mindex d88d807..4358e50 100644[m
[1m--- a/app/Http/Controllers/MailController.php[m
[1m+++ b/app/Http/Controllers/MailController.php[m
[36m@@ -9,12 +9,22 @@[m [muse Illuminate\Support\Facades\Input;[m
 [m
 class MailController extends Controller[m
 {[m
[31m-    public function send(Request $request)[m
[31m-    {[m
[31m-        $this->validate($request, [[m
[31m-            'email' => 'required'[m
[31m-        ]);[m
[31m-    	Mail::to($request->input('email'))->send(new SendMail());[m
[31m-    	return redirect()->back()->with('success', 'Email sent successfully. Check your email.');[m
[31m-    }[m
[32m+[m[32m    // public function send(Request $request)[m
[32m+[m[32m    // {[m
[32m+[m[32m    //     $this->validate($request, [[m
[32m+[m[32m    //         'email' => 'required'[m
[32m+[m[32m    //     ]);[m
[32m+[m[32m    // 	Mail::to($request->input('email'))->send(new SendMail());[m
[32m+[m[32m    // 	return redirect()->back()->with('success', 'Email sent successfully. Check your email.');[m
[32m+[m[32m    // }[m
[32m+[m
[32m+[m	[32m$to_name = 'TO_NAME';[m
[32m+[m	[32m$to_email = 'TO_EMAIL_ADDRESS';[m
[32m+[m	[32m$data = array('name'=>"Hello, this is email testing", "body" => "Test mail");[m
[32m+[m[41m	    [m
[32m+[m	[32mMail::send('welcome', $data, function($message) use ($to_name, $to_email) {[m
[32m+[m	[32m    $message->to($to_email, $to_name)[m
[32m+[m	[32m            ->subject('Artisans Web Testing Mail');[m
[32m+[m	[32m    $message->from('FROM_EMAIL_ADDRESS','Artisans Web');[m
[32m+[m	[32m});[m
 }[m
[1mdiff --git a/app/Http/Kernel.php b/app/Http/Kernel.php[m
[1mindex 3439540..96916a4 100644[m
[1m--- a/app/Http/Kernel.php[m
[1m+++ b/app/Http/Kernel.php[m
[36m@@ -59,5 +59,6 @@[m [mclass Kernel extends HttpKernel[m
         'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,[m
         'signed' => \Illuminate\Routing\Middleware\ValidateSignature::class,[m
         'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,[m
[32m+[m[32m        'cors' => \App\Http\Middleware\Cors::class,[m
     ];[m
 }[m
[1mdiff --git a/app/Providers/AuthServiceProvider.php b/app/Providers/AuthServiceProvider.php[m
[1mindex 9784b1a..6a0d4ea 100644[m
[1m--- a/app/Providers/AuthServiceProvider.php[m
[1m+++ b/app/Providers/AuthServiceProvider.php[m
[36m@@ -2,6 +2,7 @@[m
 [m
 namespace App\Providers;[m
 [m
[32m+[m[32muse Laravel\Passport\Passport;[m
 use Illuminate\Support\Facades\Gate;[m
 use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;[m
 [m
[1mdiff --git a/composer.json b/composer.json[m
[1mindex 65bf8b4..43c5567 100644[m
[1m--- a/composer.json[m
[1m+++ b/composer.json[m
[36m@@ -8,6 +8,7 @@[m
         "php": "^7.1.3",[m
         "fideloper/proxy": "^4.0",[m
         "laravel/framework": "5.6.*",[m
[32m+[m[32m        "laravel/passport": "~4.0",[m
         "laravel/tinker": "^1.0"[m
     },[m
     "require-dev": {[m
[1mdiff --git a/composer.lock b/composer.lock[m
[1mindex bc3abf2..a83b33f 100644[m
[1m--- a/composer.lock[m
[1m+++ b/composer.lock[m
[36m@@ -1,11 +1,74 @@[m
 {[m
     "_readme": [[m
         "This file locks the dependencies of your project to a known state",[m
[31m-        "Read more about it at https://getcomposer.org/doc/01-basic-usage.md#composer-lock-the-lock-file",[m
[32m+[m[32m        "Read more about it at https://getcomposer.org/doc/01-basic-usage.md#installing-dependencies",[m
         "This file is @generated automatically"[m
     ],[m
[31m-    "content-hash": "d5bca48e56bbf3a25645858fcab9c285",[m
[32m+[m[32m    "content-hash": "c07471c250bd085d23c3ce6360469447",[m
     "packages": [[m
[32m+[m[32m        {[m
[32m+[m[32m            "name": "defuse/php-encryption",[m
[32m+[m[32m            "version": "v2.2.1",[m
[32m+[m[32m            "source": {[m
[32m+[m[32m                "type": "git",[m
[32m+[m[32m                "url": "https://github.com/defuse/php-encryption.git",[m
[32m+[m[32m                "reference": "0f407c43b953d571421e0020ba92082ed5fb7620"[m
[32m+[m[32m            },[m
[32m+[m[32m            "dist": {[m
[32m+[m[32m                "type": "zip",[m
[32m+[m[32m                "url": "https://api.github.com/repos/defuse/php-encryption/zipball/0f407c43b953d571421e0020ba92082ed5fb7620",[m
[32m+[m[32m                "reference": "0f407c43b953d571421e0020ba92082ed5fb7620",[m
[32m+[m[32m                "shasum": ""[m
[32m+[m[32m            },[m
[32m+[m[32m            "require": {[m
[32m+[m[32m                "ext-openssl": "*",[m
[32m+[m[32m                "paragonie/random_compat": ">= 2",[m
[32m+[m[32m                "php": ">=5.4.0"[m
[32m+[m[32m            },[m
[32m+[m[32m            "require-dev": {[m
[32m+[m[32m                "nikic/php-parser": "^2.0|^3.0|^4.0",[m
[32m+[m[32m                "phpunit/phpunit": "^4|^5"[m
[32m+[m[32m            },[m
[32m+[m[32m            "bin": [[m
[32m+[m[32m                "bin/generate-defuse-key"[m
[32m+[m[32m            ],[m
[32m+[m[32m            "type": "library",[m
[32m+[m[32m            "autoload": {[m
[32m+[m[32m                "psr-4": {[m
[32m+[m[32m                    "Defuse\\Crypto\\": "src"[m
[32m+[m[32m                }[m
[32m+[m[32m            },[m
[32m+[m[32m            "notification-url": "https://packagist.org/downloads/",[m
[32m+[m[32m            "license": [[m
[32m+[m[32m                "MIT"[m
[32m+[m[32m            ],[m
[32m+[m[32m            "authors": [[m
[32m+[m[32m                {[m
[32m+[m[32m                    "name": "Taylor Hornby",[m
[32m+[m[32m                    "email": "taylor@defuse.ca",[m
[32m+[m[32m                    "homepage": "https://defuse.ca/"[m
[32m+[m[32m                },[m
[32m+[m[32m                {[m
[32m+[m[32m                    "name": "Scott Arciszewski",[m
[32m+[m[32m                    "email": "info@paragonie.com",[m
[32m+[m[32m                    "homepage": "https://paragonie.com"[m
[32m+[m[32m                }[m
[32m+[m[32m            ],[m
[32m+[m[32m            "description": "Secure PHP Encryption Library",[m
[32m+[m[32m            "keywords": [[m
[32m+[m[32m                "aes",[m
[32m+[m[32m                "authenticated encryption",[m
[32m+[m[32m                "cipher",[m
[32m+[m[32m                "crypto",[m
[32m+[m[32m                "cryptography",[m
[32m+[m[32m                "encrypt",[m
[32m+[m[32m                "encryption",[m
[32m+[m[32m                "openssl",[m
[32m+[m[32m                "security",[m
[32m+[m[32m                "symmetric key cryptography"[m
[32m+[m[32m            ],[m
[32m+[m[32m            "time": "2018-07-24T23:27:56+00:00"[m
[32m+[m[32m        },[m
         {[m
             "name": "dnoegel/php-xdg-base-dir",[m
             "version": "0.1",[m
[36m@@ -366,6 +429,240 @@[m
             ],[m
             "time": "2018-02-07T20:20:57+00:00"[m
         },[m
[32m+[m[32m        {[m
[32m+[m[32m            "name": "firebase/php-jwt",[m
[32m+[m[32m            "version": "v5.0.0",[m
[32m+[m[32m            "source": {[m
[32m+[m[32m                "type": "git",[m
[32m+[m[32m                "url": "https://github.com/firebase/php-jwt.git",[m
[32m+[m[32m                "reference": "9984a4d3a32ae7673d6971ea00bae9d0a1abba0e"[m
[32m+[m[32m            },[m
[32m+[m[32m            "dist": {[m
[32m+[m[32m                "type": "zip",[m
[32m+[m[32m                "url": "https://api.github.com/repos/firebase/php-jwt/zipball/9984a4d3a32ae7673d6971ea00bae9d0a1a