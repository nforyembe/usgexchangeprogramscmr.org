<?php 

class SiteOption extends Feature
{

    function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'option';
        // $this->feature_category = '';

        // For frontend... the page on which the features will be displayed
        // $this->feature_page = '';
        // $this->template_preview = '';
        // $this->template_detail = '';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'site-option-add.html';
        // $this->feature_update_template = 'site-option-update.html';

        // Define the names of the tables as on db
        // $this->feature_category_table = '';
        // $this->feature_category_content_table = '';

        $this->feature_table = 'site_options';
        $this->feature_content_table = 'site_options_content';
        
        // Define the columns to join the feature content table to the feature table
        // $this->join_column = '';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        // $this->join_column_category = '';

        // Columns for RD
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.name AS name,'
            . $this->feature_table . '.image AS image,'
            . $this->feature_content_table . '.lang_id AS lang_id,'
            . $this->feature_content_table . '.title AS title,'
            . $this->feature_content_table . '.description AS description,'
            . $this->feature_content_table . '.content AS content';

        // Define columns for CU
        $this->feature_table_columns = [
            $this->feature_table . '.name' => 'name',
            $this->feature_table . '.image' => 'image'
        ];

        $this->feature_content_table_columns = [
            $this->feature_content_table . '.lang_id' => 'lang_id',
            $this->feature_content_table . '.title' => 'title',
            $this->feature_content_table . '.description' => 'description',
            $this->feature_content_table . '.content' => 'content'
        ];

    }
    

    // Fetch Site_options data and create constants from them to be used sitewide. 
    function create_site_information_constants() 
    {

        $site_options = parent::fetch_all_features();

        // Create Constants for General Site Information
        foreach ($site_options as $option => $values) {
            
            if ($values['image'] != null) defined($values['name']) or define($values['name'], $values['image']);
                else defined($values['name']) or define($values['name'], $values['content']);
            
        }
        
    }

}