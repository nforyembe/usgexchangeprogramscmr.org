<?php 

class ThemeLayout extends Feature
{

    function __construct()
    {

        parent::__construct();

        $this->feature = 'theme_layout';
        $this->feature_category = 'theme';

        // For frontend... the page on which the features will be displayed
        // $this->feature_page = '';
        // $this->template_preview = '';
        // $this->template_detail = '';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'theme-layout-add.html';
        // $this->feature_update_template = 'theme-layout-update.html';
        
        $this->feature_category_table = 'themes';
        $this->feature_table = 'theme_layouts';

        $this->join_column = 'theme_id';

        // Feature Category Columns to be included in RD Statements
        $this->select_category_columns = $this->feature_category_table . '.id AS id,'
            . $this->feature_category_table . '.link AS link,'
            . $this->feature_category_table . '.title AS title,'
            . $this->feature_category_table . '.description AS description,'
            . $this->feature_category_table . '.image AS image'
        ;

        // Feature Category Columns to be included in CU statements
        $this->feature_category_table_columns = [
            $this->feature_category_table . '.link' => 'link',
            $this->feature_category_table . '.title' => 'title',
            $this->feature_category_table . '.description' => 'description',
            $this->feature_category_table . '.image' => 'image'
        ];


        // Feature Columns to be included in RD Statements
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.theme_id AS category_id,'
            . $this->feature_table . '.link AS link,'
            . $this->feature_table . '.title AS title,'
            . $this->feature_table . '.description AS description,'
            . $this->feature_table . '.filename AS filename'
        ;

        // Columns to be included in CU statements
        $this->feature_table_columns = [
            $this->feature_table . '.theme_id' => 'category_id',
            $this->feature_table . '.link' => 'link',
            $this->feature_table . '.title' => 'title',
            $this->feature_table . '.description' => 'description',
            $this->feature_table . '.filename' => 'filename'
        ];

    }

}