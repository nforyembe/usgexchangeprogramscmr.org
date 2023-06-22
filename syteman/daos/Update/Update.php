<?php

class Update extends Feature
{

    public function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'update';
        $this->feature_category = 'update_category';

        // For front end... the page on which the features will be displayed
        // $this->feature_page = 'news';
        // $this->template_preview = 'news-preview.html';
        // $this->template_detail = 'news-detail.html';
        // $this->category_template_preview = 'news-category-preview.html';
        // $this->category_template_detail = 'news-category-detail.html';
        
        // Define the names of the tables as on db
        $this->feature_category_table = 'update_categories';
        $this->feature_category_content_table = 'update_category_content';

        $this->feature_table = 'updates';
        $this->feature_content_table = 'update_content';
        
        // Define the columns to join the feature content table to the feature table
        $this->join_column = 'news_id';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        // $this->join_column_category = 'category_id';

        // Feature Category Columns to be included in RD Statements
        $this->select_category_columns = $this->feature_category_table . '.id AS id,'
            . $this->feature_category_table . '.status,'
            . $this->feature_category_table . '.link,'
            . $this->feature_category_table . '.image,'
            . $this->feature_category_content_table . '.lang_id,'
            . $this->feature_category_content_table . '.title,'
            . $this->feature_category_content_table . '.description,'
            . $this->feature_category_content_table . '.image_caption'
        ;

        // Feature Category Columns to be included in CU statements
        $this->feature_category_table_columns = [
            $this->feature_category_table . '.link' => 'link',
            $this->feature_category_table . '.image' => 'image',
            $this->feature_category_table . '.status' => 'status'
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
            . $this->feature_table . '.status,'
            . $this->feature_table . '.date,'
            . $this->feature_table . '.link,'
            . $this->feature_table . '.image,'
            . $this->feature_content_table . '.update_id,'
            . $this->feature_content_table . '.lang_id,'
            . $this->feature_content_table . '.last_update,'
            . $this->feature_content_table . '.title,'
            . $this->feature_content_table . '.description,'
            . $this->feature_content_table . '.content,'
            . $this->feature_content_table . '.image_caption'
        ;

        // Define Feature columns for CU
        $this->feature_table_columns = [
            $this->feature_table . '.category_id' => 'category_id',
            $this->feature_table . '.status' => 'status',
            $this->feature_table . '.date' => 'date',
            $this->feature_table . '.link' => 'link',
            $this->feature_table . '.image' => 'image'
        ];

        $this->feature_content_table_columns = [
            $this->feature_content_table . '.last_update' => 'last-update',
            $this->feature_content_table . '.title' => 'title',
            $this->feature_content_table . '.description' => 'description',
            $this->feature_content_table . '.content' => 'content',
            $this->feature_content_table . '.image_caption' => 'image_caption'
        ];
        
    }

}