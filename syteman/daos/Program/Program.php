<?php 

class Program extends Feature
{

    function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'program';

        // For front end... the page on which the features will be displayed
        $this->feature_page = 'what-we-do';
        $this->template_preview = 'program-preview.html';
        // $this->template_detail = 'default-feature-view.html';
        // $this->template_category_preview = 'default-feature-preview.html';
        // $this->template_category_detail = 'default-feature-view.html';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'program-add.html';
        // $this->feature_update_template = '';

        // Define the names of the tables as on db
        $this->feature_table = 'programs';
        $this->feature_content_table = 'program_content';
        
        $this->join_column = 'program_id';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        // $this->join_column_category = '';


        // Feature Columns to be included in RD Statements
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.link AS link,'
            . $this->feature_table . '.image AS image,'
            . $this->feature_table . '.icon AS icon,'
            . $this->feature_content_table . '.lang_id AS lang_id,'
            . $this->feature_content_table . '.title AS title,'
            . $this->feature_content_table . '.description AS description,'
            . $this->feature_content_table . '.content AS content,'
            . $this->feature_content_table . '.image_caption AS image_caption'
        ;

        // Columns to be included in CU statements
        $this->feature_table_columns = [
            $this->feature_table . '.program_id' => 'program_id',
            $this->feature_table . '.name' => 'name',
            $this->feature_table . '.link' => 'link',
            $this->feature_table . '.image' => 'image'
        ];

        $this->feature_content_table_columns = [
            $this->feature_content_table . '.title' => 'title',
            $this->feature_content_table . '.description' => 'description',
            $this->feature_content_table . '.content' => 'content',
            $this->feature_content_table . '.image_caption' => 'image_caption'
        ];

    }

    
    public function add_feature_data($sql_params=null)
    {
        
        return parent::add_feature_data();

    }

    
    public function update_feature_data($sql_params=null)
    {

        return parent::update_feature_data();

    }

    
    public function delete_feature_data($sql_params=null)
    {

        return parent::delete_feature_data();

    }

}