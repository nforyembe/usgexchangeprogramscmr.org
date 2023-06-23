<?php 

class Resource extends Feature
{

    function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'resource';
        $this->feature_category = 'resource_category';

        // For front end... the page on which the features will be displayed
        $this->feature_page = 'resources';
        $this->template_preview = 'resource-preview.html';
        $this->template_detail = 'resource-view.html';
        $this->template_category_preview = 'resource-category-preview.html';
        // $this->template_category_detail = 'resource-view.html';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'resource-add.html';
        // $this->feature_update_template = '';

        // Define the names of the tables as on db
        $this->feature_category_table = 'resource_categories';
        $this->feature_category_content_table = 'resource_category_content';

        $this->feature_table = 'resources';
        $this->feature_content_table = 'resource_content';
        
        // Define the columns to join the feature content table to the feature table
        $this->join_column = 'resource_id';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        // $this->join_column_category = '';

        // Feature Category Columns to be included in RD Statements
        $this->select_category_columns = $this->feature_category_table . '.id AS id,'
            . $this->feature_category_table . '.link AS link,'
            . $this->feature_category_table . '.image AS image,'
            . $this->feature_category_content_table . '.lang_id AS lang_id,'
            . $this->feature_category_content_table . '.title AS title,'
            . $this->feature_category_content_table . '.description AS description,'
            . $this->feature_category_content_table . '.content AS content,'
            . $this->feature_category_content_table . '.image_caption AS image_caption'
        ;

        // Feature Category Columns to be included in CU statements
        $this->feature_category_table_columns = [
            $this->feature_category_table . '.is_active' => 'is_active',
            $this->feature_category_table . '.link' => 'link',
            $this->feature_category_table . '.image' => 'image'
        ];

        $this->feature_category_content_table_columns = [
            $this->feature_category_content_table . '.title' => 'title',
            $this->feature_category_content_table . '.description' => 'description',
            $this->feature_category_content_table . '.content' => 'content',
            $this->feature_category_content_table . '.image_caption' => 'image_caption'
        ];


        // Feature Columns to be included in RD Statements
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.category_id AS category_id,'
            . $this->feature_table . '.is_active AS is_active,'
            . $this->feature_table . '.link AS link,'
            . $this->feature_table . '.date AS date,'
            . $this->feature_table . '.image AS image,'
            . $this->feature_content_table . '.lang_id AS lang_id,'
            . $this->feature_content_table . '.title AS title,'
            . $this->feature_content_table . '.description AS description,'
            . $this->feature_content_table . '.content AS content,'
            . $this->feature_content_table . '.file_name AS file_name,'
            . $this->feature_content_table . '.file_type AS file_type,'
            . $this->feature_content_table . '.image_caption AS image_caption,'
            . $this->feature_category_content_table . '.title AS category_title'
        ;

        // Columns to be included in CU statements
        $this->feature_table_columns = [
            $this->feature_table . '.category_id' => 'category_id',
            $this->feature_table . '.is_active' => 'is_active',
            $this->feature_table . '.name' => 'name',
            $this->feature_table . '.link' => 'link',
            $this->feature_table . '.image' => 'image'
        ];

        $this->feature_content_table_columns = [
            $this->feature_content_table . '.title' => 'title',
            $this->feature_content_table . '.description' => 'description',
            $this->feature_content_table . '.content' => 'content',
            $this->feature_content_table . '.image_caption' => 'image_caption',
            $this->feature_content_table . '.file_name' => 'file_name',
            $this->feature_content_table . '.file_type' => 'file_type'
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