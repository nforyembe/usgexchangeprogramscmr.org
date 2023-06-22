<?php

class Blog extends Feature
{

    public function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'blog';
        $this->feature_category = 'blog_category';

        // For front end... the page on which the features will be displayed
        $this->feature_page = 'blog';
        $this->template_preview = 'blog-preview.html';
        // $this->template_detail = 'blog-detail.html';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'blog-add.html';
        // $this->feature_update_template = '';

        // Define the names of the tables as on db
        $this->feature_category_table = 'blog_categories';
        $this->feature_category_content_table = 'blog_category_content';

        $this->feature_table = 'blog_posts';
        $this->feature_content_table = 'blog_post_content';
        
        // Define the columns to join the feature content table to the feature table
        $this->join_column = 'blog_id';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        // $this->join_column_category = '';
        

        // Feature Category Columns to be included in RD Statements
        $this->select_category_columns = $this->feature_category_table . '.id AS id,'
            . $this->feature_category_table . '.link,'
            . $this->feature_category_table . '.image,'
            . $this->feature_category_content_table . '.lang_id,'
            . $this->feature_category_content_table . '.title,'
            . $this->feature_category_content_table . '.description,'
            . $this->feature_category_content_table . '.image_caption'
        ;

        // Feature Category Columns to be included in CU statements
        $this->feature_category_table_columns = [
            $this->feature_category_table . '.is_active' => 'is_active',
            $this->feature_category_table . '.link' => 'link',
            $this->feature_category_table . '.image' => 'image'
        ];

        $this->feature_category_content_table_columns = [
            $this->feature_category_content_table . '.lang_id' => 'lang-id',
            $this->feature_category_content_table . '.title' => 'title',
            $this->feature_category_content_table . '.description' => 'description',
            $this->feature_category_content_table . '.image_caption' => 'image_caption'
        ];

        // Feature Columns for RD
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.category_id,'
            . $this->feature_table . '.is_active,'
            . $this->feature_table . '.author,'
            . $this->feature_table . '.date,'
            . $this->feature_table . '.link,'
            . $this->feature_table . '.image,'
            . $this->feature_content_table . '.blog_id,'
            . $this->feature_content_table . '.last_update,'
            . $this->feature_content_table . '.lang_id,'
            . $this->feature_content_table . '.title,'
            . $this->feature_content_table . '.description,'
            . $this->feature_content_table . '.content,'
            . $this->feature_content_table . '.image_caption,'
            . $this->feature_category_content_table . '.title AS category_title'
        ;

        // Define Feature columns for CU
        $this->feature_table_columns = [
            $this->feature_table . '.category_id' => 'category_id',
            $this->feature_table . '.is_active' => 'is_active',
            $this->feature_table . '.author' => 'author',
            $this->feature_table . '.date' => 'date',   
            $this->feature_table . '.link' => 'link',
            $this->feature_table . '.image' => 'image'
        ];

        $this->feature_content_table_columns = [
            $this->feature_content_table . '.last_update' => 'last_update',
            $this->feature_content_table . '.title' => 'title',
            $this->feature_content_table . '.description' => 'description',
            $this->feature_content_table . '.content' => 'content',
            $this->feature_content_table . '.image_caption' => 'image_caption'
        ];
        
    }

}