<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Http\Livewire\ShopComponent;

class MailController extends Controller
{
    public function sendEmail() {
        $details = [
            'title' => 'Mail from Romeo the Great',
            'body' => 'This is a test email from Romeo the Great.'
        ];

        Mail::to('rumyoonomicon@gmail.com')->send(new \App\Mail\TestMail($details));
        return "Email sent successfully";
    }
}
