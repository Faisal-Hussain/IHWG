<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    'firebase' => [
        'api_key' => 'AIzaSyAFAG0STRC3knHuMsk6rs0WNbpqtsfrCJA',
        'auth_domain' => 'toontutor.firebaseapp.com',
        'database_url' => 'https://toontutor-default-rtdb.firebaseio.com/',
        'secret' => 'n6iw1beLejVZNEd5UVqtuX7bMzgWyOC2wmb4sVk8',
        'storage_bucket' => 'toontutor.appspot.com',
        'project_id' => 'toontutor',
        'messaging_sender_id' => '191310619833'
    ],

];
