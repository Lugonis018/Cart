<?php
session_start();

//Include Google client library 
include_once 'src/Google_Client.php';
include_once 'src/contrib/Google_Oauth2Service.php';

/*
 * Configuration and setup Google API
 */
$clientId = '438014473231-rq4pt30ehdqdu21s0cf9q4lf7kmjigjj.apps.googleusercontent.com'; //Google client ID
$clientSecret = 'nyPU6J2w2gKdALOrQACPx1M4'; //Google client secret
$redirectURL = 'http://localhost/cart/public'; //Callback URL

//Call Google API
$gClient = new Google_Client();
$gClient->setApplicationName('');
$gClient->setClientId($clientId);
$gClient->setClientSecret($clientSecret);
$gClient->setRedirectUri($redirectURL);

$google_oauthV2 = new Google_Oauth2Service($gClient);
?>