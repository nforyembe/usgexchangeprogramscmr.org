<?php

class Gallery extends Feature
{

    public function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'gallery';
        $this->feature_category = 'gallery_album';

        // For front end... the page on which the features will be displayed
        $this->feature_page = 'gallery';
        $this->template_preview = 'gallery-images-preview.html';
        // $this->template_detail = 'default-feature-view.html';
        $this->category_template_preview = 'gallery-album-preview.html';
        // $this->category_template_detail = 'default-feature-view.html';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'gallery-add.html';
        // $this->feature_update_template = '';

        // Define the names of the tables as on db
        $this->feature_category_table = 'gallery_albums';
        $this->feature_category_content_table = 'gallery_album_content';

        $this->feature_table = 'gallery';
        $this->feature_content_table = 'gallery_content';
        
        // Define the columns to join the feature content table to the feature table
        $this->join_column = 'gallery_id';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        $this->join_column_category = 'album_id';


        // Feature Category Columns to be included in RD Statements
        $this->select_category_columns = $this->feature_category_table . '.id AS id,'
            . $this->feature_category_table . '.type,'
            . $this->feature_category_table . '.is_active,'
            . $this->feature_category_table . '.link,'
            . $this->feature_category_table . '.image,'
            . $this->feature_category_content_table . '.lang_id,'
            . $this->feature_category_content_table . '.title,'
            . $this->feature_category_content_table . '.description,'
            . $this->feature_category_content_table . '.image_caption'
        ;

        // Feature Category Columns to be included in CU statements
        $this->feature_category_table_columns = [
            $this->feature_category_table . '.type' => 'type',
            $this->feature_category_table . '.is_active' => 'is_active',
            $this->feature_category_table . '.link' => 'link',
            $this->feature_category_table . '.image' => 'image'
        ];

        $this->feature_category_content_table_columns = [
            $this->feature_category_content_table . '.album_id' => 'category_id',
            $this->feature_category_content_table . '.lang_id' => 'lang_id',
            $this->feature_category_content_table . '.title' => 'title',
            $this->feature_category_content_table . '.description' => 'description',
            $this->feature_category_content_table . '.image_caption' => 'image_caption'
        ];

        // Feature Columns for RD
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.album_id,'
            . $this->feature_table . '.is_active,'
            . $this->feature_table . '.image,'
            . $this->feature_table . '.image_tags,'
            . $this->feature_content_table . '.lang_id,'
            . $this->feature_content_table . '.title,'
            . $this->feature_content_table . '.image_caption'
        ;

        // Define Feature columns for CU
        $this->feature_table_columns = [
            $this->feature_table . '.album_id' => 'category_id',
            $this->feature_table . '.is_active' => 'is_active',
            // $this->feature_table . '.link' => 'link',
            $this->feature_table . '.image' => 'image',
            $this->feature_table . '.image_tags' => 'image_tags',
        ];

        $this->feature_content_table_columns = [
            $this->feature_content_table . '.gallery_id' => 'gallery_id',
            $this->feature_content_table . '.title' => 'title',
            $this->feature_content_table . '.image_caption' => 'image_caption'
        ];

        
        // Define SYM templates
        // $this->preview_template = 'user-preview.html';
        // $this->detail_template = 'user-detail.html';
        // $this->edit_template = 'user-edit.html';
        
    }

}