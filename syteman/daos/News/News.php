<?php

class News extends Feature
{

    public function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'news';
        $this->feature_category = 'news_category';

        // For front end... the page on which the features will be displayed
        $this->feature_page = 'news';
        $this->template_preview = 'news-preview.html';
        // $this->template_detail = 'news-detail.html';
        // $this->template_category_preview = 'default-feature-preview.html';
        // $this->template_category_detail = 'default-feature-view.html';

        // For backend... the CRUD files
        // $this->feature_category_add_template = 'default-feature-category-add.html';
        // $this->feature_category_update_template = 'default-feature-category-edit.html';
        $this->feature_add_template = 'news-add.html';
        // $this->feature_update_template = 'news-edit.html';

        // Define the names of the tables as on db
        $this->feature_category_table = 'news_categories';
        $this->feature_category_content_table = 'news_category_content';

        $this->feature_table = 'news';
        $this->feature_content_table = 'news_content';
        
        // Define the columns to join the feature content table to the feature table
        $this->join_column = 'news_id';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        // $this->join_column_category = '';

        
        // Feature Category Columns to be included in RD Statements
        $this->select_category_columns = $this->feature_category_table . '.id AS id,'
            . $this->feature_category_table . '.is_active AS is_active,'
            . $this->feature_category_table . '.link AS link,'
            . $this->feature_category_table . '.image AS image,'
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
            $this->feature_category_content_table . '.lang_id' => 'lang_id',
            $this->feature_category_content_table . '.title' => 'title',
            $this->feature_category_content_table . '.description' => 'description',
            $this->feature_category_content_table . '.image_caption' => 'image_caption'
        ];

        // Feature Columns for RD
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.category_id AS category_id,'
            . $this->feature_table . '.author AS author,'
            . $this->feature_table . '.is_active AS is_active,'
            . $this->feature_table . '.date AS date,'
            . $this->feature_table . '.link AS link,'
            . $this->feature_table . '.image AS image,'
            . $this->feature_content_table . '.lang_id AS lang_id,'
            . $this->feature_content_table . '.last_update AS last_update,'
            . $this->feature_content_table . '.title AS title,'
            . $this->feature_content_table . '.description AS description,'
            . $this->feature_content_table . '.content AS content,'
            . $this->feature_content_table . '.image_caption AS image_caption'
        ;

        // Define Feature columns for CU
        $this->feature_table_columns = [
            $this->feature_table . '.category_id' => 'category_id',
            $this->feature_table . '.is_active' => 'is_active',
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