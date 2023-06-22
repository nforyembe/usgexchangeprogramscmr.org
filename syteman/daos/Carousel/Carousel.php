<?php 

class Carousel extends Feature
{

    function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'carousel';
        $this->feature_category = 'carousel_category';

        // For front end... the page on which the features will be displayed
        // $this->feature_page = '';
        // $this->template_preview = '';
        // $this->template_detail = '';
        // $this->template_category_preview = '';
        // $this->template_category_detail = '';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'carousel-add.html';
        // $this->feature_update_template = '';

        // Define the names of the tables as on db
        $this->feature_category_table = 'carousel_categories';
        $this->feature_category_content_table = 'carousel_category_content';
        $this->feature_table = 'carousel';
        $this->feature_content_table = 'carousel_content';

        // Feature Category Columns to be included in RD Statements
        $this->select_category_columns = $this->feature_category_table . '.id AS id,'
            . $this->feature_category_table . '.link AS link,'
            . $this->feature_category_table . '.image AS image,'
            . $this->feature_category_table . '.is_active AS is_active,'
            . $this->feature_category_content_table . '.lang_id AS lang_id,'
            . $this->feature_category_content_table . '.title AS title,'
            . $this->feature_category_content_table . '.description AS description,'
            . $this->feature_category_content_table . '.image_caption AS image_caption'
        ;

        // Feature Category Columns to be included in CU statements
        $this->feature_category_table_columns = [
            $this->feature_category_table . '.link' => 'link',
            $this->feature_category_table . '.image' => 'image',
            $this->feature_category_table . '.is_active' => 'is_active'
        ];

        $this->feature_category_content_table_columns = [
            $this->feature_category_content_table . '.title' => 'title',
            $this->feature_category_content_table . '.description' => 'description',
            $this->feature_category_content_table . '.image_caption' => 'image_caption'
        ];


        // Feature Columns to be included in RD Statements
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.category_id AS category_id,'
            . $this->feature_table . '.is_active AS is_active,'
            . $this->feature_table . '.link AS link,'
            . $this->feature_table . '.image AS image,'
            . $this->feature_content_table . '.lang_id AS lang_id,'
            . $this->feature_content_table . '.title AS title,'
            . $this->feature_content_table . '.content AS content,'
            . $this->feature_content_table . '.image_caption AS image_caption'
        ;

        // Columns to be included in CU statements
        $this->feature_table_columns = [
            $this->feature_table . '.category_id' => 'category_id',
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

}