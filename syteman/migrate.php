<?php

// Include the autoload register
require_once 'autoload.php';


// Include a Sessions file 
include_once 'sessions.php';


// Authenticate
Auth::authenticate_admin();


// Require an options file which basically acts like a setup for the entire site... 
// fetches information about the website from the db
// and creates constants for use throughout the site. 
// also creates handy server and directory constants
require_once '../options.php';


// Initialize pageBuilder object
$page = new PageBuilder;


// Pull up the Header
$page -> do_sym_header();

	echo '<div class="container mt-4"><div class="row justify-content-center"><div class="col-10">';
	// Batch Insert
		// Initialize the DB object 
		$db = new Db;

		// Locate and fetch from the Data File
		$file = 'migration/insert_data';
		$open_file = fopen($file, 'r');

		$data = array();
		while(!feof($open_file)) {
			
			$line = fgets($open_file);
			$clean = explode('>', $line);
			// var_dump($clean);

			array_push($data, [
				'title' => !empty(trim($clean[0])) ? (trim($clean[0])) : null, 
				'url' => !empty(trim($clean[1])) ? (trim($clean[1])) : null,
				'image' => !empty(trim($clean[2])) ? (trim($clean[2])) : null
			]);

		}
		// var_dump($data);

		// Define SQL Params
		$params = [
			'table_name' => 'team',
			'columns' => ['title' => 'title', 'url' => 'url', 'image' => 'image']
		];

		foreach($data as $entry) {
			
			$params['values'] = [
				'title' => $entry['title'], 
				'url' => $entry['url'],
				'image' => $entry['image']
			];

			// $feedback[] = $db->insert_data_into_table($params);

		}

		if (isset($feedback)) 
			foreach ($feedback as $line) echo $line['message'] . '<br>';
	
	echo '</div></div></div>';




// Pull up the Foot
$page -> do_sym_footer();


// Close the DB Connection
$db_connect = null;