<?php

class FormProcess extends Db {
    
    function __construct() 
    {

        // Figure out method to handle form 
        if (isset($_POST['submit'])) {

            switch ($_POST['submit']) {

                case 'Send Message':
                    $this->process_contact_form();
                    break;

                case 'Subscribe':
                    $this->process_newsletter_subscribe();
                    break;
                
                case 'Create Account':
                    // $this->register_user();
                    break;
                
                case 'Login':
                    // AUTH::login_user();
                    break;

                default: 
                    break; 
                    
            }

        }
        
    }


    public function check_and_assign_post_value($input, $error_message=null, &$error_container=null) {

        if ($error_message != null) {

            if ($this->validate_empty_post_variable($input, $error_message, $error_container)) {
                return $_POST[$input];
            }

        } else {
            return $this->clean_input($input);
        }

    }
    

    // Checks if get_magic_quotes is enabled or uses addslashes to escape special characters 
    public function clean_input($input) {

        return htmlspecialchars(trim(stripslashes($_POST[$input])));

    }

    
    // checks if a certain name is being posted and returns true or false.
    public function is_post_variable_set($name) {
        return isset($_POST[$name]);
    }


    // checks if a certain namee posted is empty and returns true 
    // or passes the error message to an error container
    public function validate_empty_post_variable($name, $error_message, &$error_container) {

        if (!self::is_post_variable_set($name) || (self::is_post_variable_set($name) && empty($_POST[$name]))) {

            $error_container[] = $error_message;
            return false;

        }

        return true;

    }


    static function create_link_from_form_input($prefix=null)
    {
        
        if (isset($_POST['link']) && $_POST['link'] != '') {

            $link = Run::create_link_from_string($_POST['link']);

        } else {

            if (isset($_POST['title']) && $_POST['title'] != '') $link = Run::create_link_from_string($_POST['title']);
                elseif (isset($_POST['name']) && $_POST['name'] != '') $link = Run::create_link_from_string($_POST['name']);
                    else $link = false; // uniqid($prefix . (!is_null($prefix) ? '-' : ''));
                    
        }

        return $link;

    }


    // sends a passed data by email with the default PHP mail function
    public function send_with_mail($to, $subject, $message, $headers, &$status=null) {

        if (isset($status)) {
            
            if (@mail($to, $subject, $message, $headers)) $status['send_status'] = true;
                else $status['send_status'] = false;
            
        } else {
            @mail($to, $subject, $message, $headers);
        }

    }


    // Uses a predefined service (like mailgun or sendgrid) to send data by email.
    public function send_with_service($service, $from, $to, $subject, $message, $headers) {}


    // Handles various types of multimedia form submissions (images, files, videos, etc)
    public function handle_multimedia($value) {}


    function process_contact_form() {

        $vldt = new Validate;
        
        if(isset($_POST['contact'])) {
            
            $errors = $progress = $submitted = $form_feedback = array();

            if (!defined('DEVELOPMENT')) {

                // if (isset($_SESSION['captcha_code'])) {
                    
                //     if (isset($_POST['captcha'])) {
                            
                //         if($_POST['captcha'] != $_SESSION['captcha_code']) {
                //             $errors[] = 'Wrong Captcha!!!';
                //         }
                        
                //     } else {

                //         $errors[] = 'No captcha verification was sent';
                        
                //     }

                // } else {
                    
                //     $errors[] = 'Captcha verification is not active';
                    
                // }

            }

            $submitted['names'] = $_COOKIE['names'] = $this->check_and_assign_post_value('names', 'Names cannot be empty', $errors);
            $submitted['email'] = $_COOKIE['email'] = $this->check_and_assign_post_value('email', 'Email cannot be empty', $errors);
            $submitted['subject'] = $_COOKIE['subject'] = $this->check_and_assign_post_value('subject', 'Subject cannot be empty', $errors);
            $submitted['message'] = $_COOKIE['message'] = $this->check_and_assign_post_value('message', 'Message cannot be empty', $errors);
            
            if(empty($errors)) {

                // Send the Data by Email to form owner
                $email_header = "From: " . $submitted['email'] . "\n"
                    . "Reply-To: " . $submitted['email'] 
                    . "\n" . "MIME-Version: 1.0\r\n" 
                    . "Content-Type: text/html; charset=ISO-8859-1\r\n";

                $email_subject = $submitted['subject'] . " from " 
                    . (defined('ORG_ACRONYM') ? ORG_ACRONYM : "") 
                    . " Contact Form";

                $email_message = '<p>' . nl2br($submitted['message']) . '</p>' . $submitted['names'] . ', ' . $submitted['email'];
                
                $email_send_to = defined('ORG_EMAIL') ? ORG_EMAIL : 'webmaster@yems.group';

                $this->send_with_mail($email_send_to, $email_subject, $email_message, $email_header, $progress);
                
                if ($progress['send_status'] == true) {
                    
                    $form_feedback[] = 'Thank you for writing to us, Someone from our Team will reply to your message soon.</p> Please keep visiting our website';
                    
                    // Insert the Data into DB
                    // Initialize the db object 
                    $db = new Db;
                    
                    // Indicate the columns=>values to be inserted
                    $insert_columns = [
                        'names' => 'names', 
                        'email' => 'email', 
                        'subject' => 'subject', 
                        'message' => 'message'
                    ];
                    $insert_values = [
                        'names' => $submitted['names'], 
                        'email' => $submitted['email'], 
                        'subject' => $submitted['subject'], 
                        'message' => $submitted['message']
                    ];

                    $params = [
                        'table_name' => 'contact_form_messages',
                        'columns' => $insert_columns,
                        'values' => $insert_values
                    ];
                    
                    $insert_data_into_db = $db -> insert_data_into_table($params); 
                    
                    // Check if Insert succeeds and log.
                    if ($insert_data_into_db['status'] == false) {
                        
                        // Log the error to a logfile.
                        $log = new Log;
                        $log -> app_log_message('error', 'Problem saving contact form submission to DB ->  ' . $insert_data_into_db['error']);

                    }

                    // ...and then destroy the cookies
                    // Find a Cleaner way of doing this
                    foreach ($submitted as $key=>$value) {

                        if (isset($_COOKIE[$key])) {

                            unset($_COOKIE[$key]);
                            setcookie($key, '', time() - 3600, '/'); // empty value and old timestamp

                        }

                    }

                } else {

                    $form_feedback[] = 'Ooops!! For some reason your submission was not received, Please Try again.' 
                        . (defined('ORG_EMAIL') ? ' <strong>If this persists, please contact us directly at ' . ORG_EMAIL . '</strong>' : '' );

                }

                if ($form_feedback) Run::set_flash_message(['feedback' => $form_feedback]);
                if ($progress) Run::set_flash_message(['progress' => $progress]);

            } else {

                Run::set_flash_message(['error' => $errors]);
                Run::set_flash_message(['submitted' => $submitted]);

            }
            
            Run::redirect_to($_SERVER['HTTP_REFERER']);

        }

    }


    function process_newsletter_subscribe() {

        $vldt = new Validate;

        if(isset($_POST['subscribe'])) {
            $errors = $progress = $submitted = $form_feedback = array();

            $submitted['first_name'] = $_COOKIE['first_name'] = $this->check_and_assign_post_value('first_name', 'First Name cannot be empty', $errors);
            $submitted['email'] = $_COOKIE['email'] = $this->check_and_assign_post_value('email', 'Email cannot be empty', $errors);
            
            if(empty($errors)) {
                    
                // Insert the Data into DB
                // Initialize the db object 
                $db = new Db;
                
                // Indicate the columns=>values to be inserted
                $insert_columns = ['first_name' => 'first_name', 'email' => 'email'];
                $insert_values = ['first_name' => $submitted['first_name'], 'email' => $submitted['email']];

                $params = [
                    'table_name' => 'email_subscriptions',
                    'columns' => $insert_columns,
                    'values' => $insert_values
                ];
                
                $insert_data_into_db = $db -> insert_data_into_table($params); 
                
                // Check if Insert succeeds and log.
                if ($insert_data_into_db['status'] == false) {
            
                    // var_dump($insert_data_into_db); die;

                    $form_feedback[] = 'Ooops!! For some reason your email could not be added, Please Try again.<br><strong>[' . $insert_data_into_db['message'] . ']</strong><br>' . (defined('ORG_EMAIL') ? ' If this persists, please contact us directly at ' . ORG_EMAIL . '' : '' );
                    
                    // Log the error to a logfile.
                    $log = new Log;
                    $log -> app_log_message('error', 'Problem saving Email to DB ->  ' . $insert_data_into_db['error']);

                } else {

                    $form_feedback[] = 'Yayy!! your email was successfully added to our DB';

                }

                // ...and then destroy the cookies
                // Find a Cleaner way of doing this
                foreach ($submitted as $key=>$value) {

                    if (isset($_COOKIE[$key])) {

                        unset($_COOKIE[$key]);
                        setcookie($key, '', time() - 3600, '/'); // empty value and old timestamp

                    }

                }

                if ($form_feedback) Run::set_flash_message(['feedback' => $form_feedback]);
                if ($progress) Run::set_flash_message(['progress' => $progress]);

            } else {

                Run::set_flash_message(['error' => $errors]);
                Run::set_flash_message(['submitted' => $submitted]);

            }
            
            Run::redirect_to($_SERVER['HTTP_REFERER']);

        }

    }


    function do_login() {
        
        $errors = $progress = $submitted = $form_feedback = array();

        // if (!defined('DEVELOPMENT')) {

        //     if (isset($_SESSION['captcha_code'])) {
                
        //         if (isset($_POST['captcha'])) {
                        
        //             if($_POST['captcha'] != $_SESSION['captcha_code']) {
        //                 $errors[] = 'Wrong Captcha!!!';
        //             }
                    
        //         } else {

        //             $errors[] = 'No captcha verification was sent';
                    
        //         }

        //     } else {
                
        //         $errors[] = 'Captcha verification is not active';
                
        //     }

        // }

        $submitted['username'] = $_COOKIE['username'] = $this->check_and_assign_post_value('username', 'username cannot be empty', $errors);
        $submitted['password'] = $_COOKIE['password'] = $this->check_and_assign_post_value('password', 'password cannot be empty', $errors);
        
        if(empty($errors)) {
            
            $db = new Db;
            $user = new User;

            $params = [
                'table_name' => $user->feature_table,
                'columns' => $user->select_columns,
                'condition' => $user->feature_table . '.username="' . $submitted['username'] . '" OR ' . $user->feature_table . '.email="' . $submitted['username'] . '" AND ' . $user->feature_table . '.hashed_password="' . sha1($submitted['password']) . '" AND ' . $user->feature_table . '.role<2'
            ];

            $user_exists = $user->fetch_data_for_this_feature(null, $params);

            // var_dump($user_exists); die;

            // Check if Insert succeeds and log.
            if (isset($user_exists['error'])) {
                
                Run::set_flash_message(['error' => 'Username and Password was not Found']);
                return null;

            } else return $user_exists[0];
            
        } else return null;

    }


    function do_user_login() {
        Auth::login_user();
    }

    function do_logout() {
        Auth::do_logout();
    }


    function register_user() {
            
        $errors = $progress = $submitted = $form_feedback = array();

        // if (!defined('DEVELOPMENT')) {

        //     if (isset($_SESSION['captcha_code'])) {
                
        //         if (isset($_POST['captcha'])) {
                        
        //             if($_POST['captcha'] != $_SESSION['captcha_code']) {
        //                 $errors[] = 'Wrong Captcha!!!';
        //             }
                    
        //         } else {

        //             $errors[] = 'No captcha verification was sent';
                    
        //         }

        //     } else {
                
        //         $errors[] = 'Captcha verification is not active';
                
        //     }

        // }

        $user = new User;

        $submitted['first_name'] = $_COOKIE['first_name'] = $this->check_and_assign_post_value('first_name', 'First Name cannot be empty', $errors);
        $submitted['last_name'] = $_COOKIE['last_name'] = $this->check_and_assign_post_value('last_name', 'Last Name cannot be empty', $errors);
        $submitted['dob'] = $_COOKIE['dob'] = $this->check_and_assign_post_value('dob');
        $submitted['gender'] = $_COOKIE['gender'] = $this->check_and_assign_post_value('gender', 'You must indicate a Gender', $errors);
        $submitted['email'] = $_COOKIE['email'] = $this->check_and_assign_post_value('email', 'Email cannot be empty', $errors);
        $submitted['password'] = $this->check_and_assign_post_value('password', 'Password cannot be empty', $errors);

        if(empty($errors)) {

            // $db = new Db;
            $user = new User;

            $params = [
                'table_name' => $user->feature_table,
                'columns' => 'id',
                'condition' => $user->feature_table . '.email="' . $submitted['email'] . '"'
            ];

            $user_exists = $user->confirm_feature_exists(null, $params);

            // Check if User with email exists.
            if ($user_exists) {
                
                // User with email already exists.                    
                Run::set_flash_message(['error' => 'Ooops! That Email is already Registered. <a href="' . BASE_URL . '/login">Please Sign In instead</a>']);
                // return null;            

            } else {
                
                $register_user = $user->add_feature_data(null, 'submit');
                // var_dump($register_user);
                
                // Check if Insert succeeds and log.
                if ($register_user['status'] == true) {

                    // ...and then destroy the cookies
                    // Find a Cleaner way of doing this
                    foreach ($submitted as $key=>$value) {

                        if (isset($_COOKIE[$key])) {

                            unset($_COOKIE[$key]);
                            setcookie($key, '', time() - 3600, '/'); // empty value and old timestamp

                        }

                    }

                    // Send the Data by Email to form owner
                    $email_header = "From: info@mezampdi.com\n"
                        . "Reply-To: info@mezampdi.com\n"
                        . "MIME-Version: 1.0\r\n" 
                        . "Content-Type: text/html; charset=ISO-8859-1\r\n";

                    $email_subject = "Welcome to the " . ORG_ACRONYM . " Family";

                    $email_message = '<p>Hi ' . $submitted['first_name'] . '<br> Thank you for joining the ' . ORG_ACRONYM . 'Family';
                    
                    $email_send_to = $submitted['email'];

                    $this->send_with_mail($email_send_to, $email_subject, $email_message, $email_header, $progress);
                
                    if ($progress['send_status'] == true) {
                        
                        $form_feedback[] = 'Thank you for Joining the ' . ORG_ACRONYM . 'Family <br>Your Account has been created. <br>You will receive an email from us shortly confirming this.';

                    } else {

                        $form_feedback[] = 'Your Account has been created, but we could not send you a confirmation email.' 
                            . (defined('ORG_EMAIL') ? ' <strong>Please contact us directly at ' . ORG_EMAIL . '</strong> if you face any difficulties with your account.' : '' );

                    }

                    // Login the User
                    Auth::login_user();

                    Run::redirect_to(BASE_URL . '/account');

                } else {
                    
                    // Log the error to a logfile.
                    // Get the Correct Error code.
                    $log = new Log;
                    if (isset($register_user['error']))
                        foreach ($register_user['error'] as $error) $log -> app_log_message('error', 'Problem adding new user to DB ->  ' . $error);

                    // Could not Add User.
                    Run::set_flash_message(['error' => 'Ooops! We could not add your Account at the moment, Please try again']);

                }

                if ($form_feedback) Run::set_flash_message(['feedback' => $form_feedback]);
                if ($progress) Run::set_flash_message(['progress' => $progress]);

            }
            
        } else {
    
            Run::set_flash_message(['error' => $errors]);
            Run::set_flash_message(['submitted' => $submitted]);

        }

    }


    function login_user() {
        
        $errors = $progress = $submitted = $form_feedback = array();

        $submitted['email'] = $_COOKIE['email'] = $this->check_and_assign_post_value('email', 'email cannot be empty', $errors);
        $submitted['password'] = $_COOKIE['password'] = $this->check_and_assign_post_value('password', 'password cannot be empty', $errors);
        
        if(empty($errors)) {
            
            $db = new Db;
            $user = new User;

            $params = [
                'table_name' => $user->feature_table,
                'columns' => $user->select_columns,
                'condition' => $user->feature_table . '.email="' . $submitted['email'] . '" AND ' . $user->feature_table . '.hashed_password="' . sha1($submitted['password']) . '"'
            ];

            $user_exists = $user->fetch_data_for_this_feature(null, $params);
            // var_dump($user_exists);

            // Check if Insert succeeds and log.
            if (isset($user_exists['error'])) {

                Run::set_flash_message(['error' => 'email and Password was not Found']);
                return null;

            } else return $user_exists[0];                
            
        } else return null;

    }

}