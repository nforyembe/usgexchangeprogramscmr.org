<?php 

class User extends Feature
{

    function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'user';
        // $this->feature_category = '';

        // For frontend... the page on which the features will be displayed
        // $this->feature_page = '';
        // $this->template_preview = '';
        // $this->template_detail = '';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'user-add.html';
        // $this->feature_update_template = 'user-update.html';

        // Define the names of the tables as on db
        // $this->feature_category_table = '';
        // $this->feature_category_content_table = '';

        $this->feature_table = 'users';
        // $this->feature_content_table = '';
        
        // Define the columns to join the feature content table to the feature table
        // $this->join_column = '';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        // $this->join_column_category = '';
        

        // Feature Columns to be included in RD Statements
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.role AS role,'
            . $this->feature_table . '.is_active AS is_active,'
            . $this->feature_table . '.username AS username,'
            . $this->feature_table . '.email AS email,'
            . $this->feature_table . '.first_name AS first_name,'
            . $this->feature_table . '.last_name AS last_name,'
            . $this->feature_table . '.profile AS profile,'
            . $this->feature_table . '.dob AS dob,'
            . $this->feature_table . '.gender AS gender,'
            . $this->feature_table . '.image AS image';

        // Columns to be included in CU statements
        $this->feature_table_columns = [
            $this->feature_table . '.role' => 'role',
            $this->feature_table . '.is_active' => 'is_active',
            $this->feature_table . '.username' => 'username',
            $this->feature_table . '.email' => 'email',
            $this->feature_table . '.dob' => 'dob',
            $this->feature_table . '.hashed_password' => 'password',
            $this->feature_table . '.first_name' => 'first_name',
            $this->feature_table . '.last_name' => 'last_name',
            $this->feature_table . '.gender' => 'gender',
            $this->feature_table . '.profile' => 'profile',
            $this->feature_table . '.image' => 'image'
        ];

        // $this->preview_template = 'user-preview.html';
        // $this->detail_template = 'user-detail.html';
        // $this->edit_template = 'user-edit.html';

    }
    

    // Fetch Site_options data and create constants from them to be used sitewide. 
    // function create_site_information_constants() 
    // {
        
    //     $site_options = parent::fetch_all_features();

    //     // Create Constants for General Site Information
    //     foreach ($site_options as $option => $values) {
            
    //         if (isset($values['name'])) defined($values['name']) or define($values['name'], $values['content']);
            
    //     }
        
    // }

}