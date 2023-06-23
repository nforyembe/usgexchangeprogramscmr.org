<?php 

class ProjectPlus extends Feature
{

    function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'project';
        // $this->feature_category = 'project_category';

        // For front end... the page on which the features will be displayed
        $this->feature_page = 'projects';
        $this->template_preview = 'project-preview.html';
        $this->template_detail = 'project-detail.html';
        // $this->template_category_preview = 'default-feature-preview.html';
        // $this->template_category_detail = 'default-feature-view.html';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'projectplus-add.html';
        // $this->feature_update_template = '';

        // Define the names of the tables as on db
        // $this->feature_category_table = 'project_categories';
        // $this->feature_category_content_table = 'project_category_content';

        $this->feature_table = 'projects';
        $this->feature_content_table = 'project_content';
        
        // Define the columns to join the feature content table to the feature table
        $this->join_column = 'project_id';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        // $this->join_column_category = '';

        
        // Feature Category Columns to be included in RD Statements
        // $this->select_category_columns = $this->feature_category_table . '.id AS id,'
        //     . $this->feature_category_table . '.link AS link,'
        //     . $this->feature_category_table . '.image AS image,'
        //     . $this->feature_category_content_table . '.lang_id AS lang_id,'
        //     . $this->feature_category_content_table . '.title AS title,'
        //     . $this->feature_category_content_table . '.description AS description,'
        //     . $this->feature_category_content_table . '.content AS content,'
        //     . $this->feature_category_content_table . '.image_caption AS image_caption'
        // ;

        // Feature Category Columns to be included in CU statements
        // $this->feature_category_table_columns = [
        //     $this->feature_category_table . '.is_active' => 'is_active',
        //     $this->feature_category_table . '.link' => 'link',
        //     $this->feature_category_table . '.image' => 'image'
        // ];

        // $this->feature_category_content_table_columns = [
        //     $this->feature_category_content_table . '.title' => 'title',
        //     $this->feature_category_content_table . '.description' => 'description',
        //     $this->feature_category_content_table . '.content' => 'content',
        //     $this->feature_category_content_table . '.image_caption' => 'image_caption'
        // ];

        // Feature Columns to be included in RD Statements
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.cycle AS cycle,'
            . $this->feature_table . '.link AS link,'
            . $this->feature_table . '.image AS image,'
            . $this->feature_table . '.video AS video,'
            . $this->feature_table . '.location AS location,'
            . $this->feature_table . '.date_from AS date_from,'
            . $this->feature_table . '.date_to AS date_to,'
            . $this->feature_table . '.impact AS impact,'
            . $this->feature_table . '.funding AS funding,'
            . $this->feature_table . '.communities AS communities,'
            . $this->feature_content_table . '.lang_id AS lang_id,'
            . $this->feature_content_table . '.title AS title,'
            . $this->feature_content_table . '.description AS description,'
            . $this->feature_content_table . '.content AS content,'
            . $this->feature_content_table . '.project_info AS project_info,'
            . $this->feature_content_table . '.project_background AS project_background,'
            . $this->feature_content_table . '.project_objectives AS project_objectives,'
            . $this->feature_content_table . '.project_implementation AS project_implementation,'
            . $this->feature_content_table . '.project_evaluation AS project_evaluation,'
            . $this->feature_content_table . '.image_caption AS image_caption'
        ;

        // Columns to be included in CU statements
        $this->feature_table_columns = [
            $this->feature_table . '.project_id' => 'project_id',
            $this->feature_table . '.cycle' => 'cycle',
            $this->feature_table . '.link' => 'link',
            $this->feature_table . '.image' => 'image',
            $this->feature_table . '.video' => 'video',
            $this->feature_table . '.location' => 'location',
            $this->feature_table . '.date_from' => 'date_from',
            $this->feature_table . '.date_to' => 'date_to',
            $this->feature_table . '.impact' => 'impact',
            $this->feature_table . '.funding' => 'funding',
            $this->feature_table . '.communities' => 'communities'
        ];

        $this->feature_content_table_columns = [
            $this->feature_content_table . '.title' => 'title',
            $this->feature_content_table . '.description' => 'description',
            $this->feature_content_table . '.content' => 'content',
            $this->feature_content_table . '.project_info' => 'project_info',
            $this->feature_content_table . '.project_background' => 'project_background',
            $this->feature_content_table . '.project_objectives' => 'project_objectives',
            $this->feature_content_table . '.project_implementation' => 'project_implementation',
            $this->feature_content_table . '.project_evaluation' => 'project_evaluation',
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