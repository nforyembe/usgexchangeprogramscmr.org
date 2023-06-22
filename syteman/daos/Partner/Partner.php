<?php 

class Partner extends Feature
{

    function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'partner';

        // For front end... the page on which the features will be displayed
        $this->feature_page = 'partners';
        $this->template_preview = 'partner-preview.html';
        // $this->template_detail = 'partner-detail.html';
        // $this->template_category_preview = 'default-feature-preview.html';
        // $this->template_category_detail = 'default-feature-view.html';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'partner-add.html';
        // $this->feature_update_template = '';

        // Define the names of the tables as on db
        $this->feature_table = 'partners';

        // Define the columns to join the feature content table to the feature table
        // $this->join_column = '';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        // $this->join_column_category = '';


        // Feature Columns to be included in RD Statements
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.is_active AS is_active,'
            . $this->feature_table . '.priority AS priority,'
            . $this->feature_table . '.link AS link,'
            . $this->feature_table . '.image AS image,'
            . $this->feature_table . '.url AS url,'
            . $this->feature_table . '.title AS title,'
            . $this->feature_table . '.description AS description'
        ;

        // Columns to be included in CU statements
        $this->feature_table_columns = [
            $this->feature_table . '.is_active' => 'is_active',
            $this->feature_table . '.priority' => 'priority',
            $this->feature_table . '.link' => 'link',
            $this->feature_table . '.image' => 'image',
            $this->feature_table . '.url' => 'url',
            $this->feature_table . '.title' => 'title',
            $this->feature_table . '.description' => 'description'
        ];

    }

}