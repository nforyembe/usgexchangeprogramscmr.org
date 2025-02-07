<?php 

class Auth {
    
    function __construct()
    {}


    static function admin_logged_in() 
	{

		return isset($_SESSION['adminid']);

	}


	static function authenticate_admin()
	{
		
		if(!Auth::admin_logged_in()) Run::redirect_to('login.php');
		
	}


	static function check_authentication() 
	{

		if(Auth::admin_logged_in()) Run::redirect_to('index.php');

	}


	static function do_login() 
	{

		if (isset($_POST['login'])) {

			$fp = new FormProcess;

			$login = $fp->do_login();
				
			// var_dump($login); die;

			if ($login != null) {

				$_SESSION['first_name'] = $login['first_name'];
				$_SESSION['last_name'] = $login['last_name'];
				$_SESSION['email'] = $login['email'];
				$_SESSION['adminid'] = $login['id'];
				
				Run::redirect_to('index.php');

			} else return 'Username and Password was not Found';

		}

	}



	static function authenticate_user()
	{

		if(!Auth::user_logged_in()) Run::redirect_to(BASE_URL . '/login');
		
	}
	

    static function user_logged_in() 
	{

		return isset($_SESSION['userid']);

	}


	static function check_user_authentication() 
	{

		if(Auth::user_logged_in()) Run::redirect_to(BASE_URL . '/account');

	}


	static function login_user() 
	{

		$fp = new FormProcess;

		$login = $fp->login_user();
			
		// var_dump($login); die;

		if ($login != null) {

			// Set Sessions for User info
			$_SESSION['userid'] = $login['id'];
			$_SESSION['first_name'] = $login['first_name'];
			$_SESSION['last_name'] = $login['last_name'];
			$_SESSION['email'] = $login['email'];

			Run::redirect_to(BASE_URL . '/account');

		} else return 'Username and Password was not Found';

	}


	static function do_logout()
	{

		// Four steps to closing a session (i.e. logging out)

		// 1. Find the session

		// 2. Unset all the session variables
		$_SESSION = array();

		// 3. Destroy the session cookie
		if(isset($_COOKIE[session_name()])) {
			setcookie(session_name(), '', time()-42000, '/');
		}

		// 4. Destroy the session
		session_destroy();

		Run::set_flash_message(['feedback' => 'You\'ve been successfully logged out']);

		// Redirect to Login
		Run::redirect_to((defined('BASE_URL') ? BASE_URL : $_SERVER['HTTP_REFERER']) . '?logged_out');

	}

}