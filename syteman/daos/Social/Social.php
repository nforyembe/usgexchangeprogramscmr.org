<?php 

class Social extends Feature
{

    function __construct()
    {

        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'social';

        // For front end... the page on which the features will be displayed
        $this->feature_page = 'test_features';
        $this->template_preview = 'social-links-preview.html';
        // $this->template_detail = 'partner-detail.html';
        // $this->template_category_preview = 'default-feature-preview.html';
        // $this->template_category_detail = 'default-feature-view.html';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'social-add.html';
        // $this->feature_update_template = '';

        // Define the names of the tables as on db
        $this->feature_table = 'social_networks';


        // Feature Columns to be included in RD Statements
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.is_active AS is_active,'
            . $this->feature_table . '.link AS link,'
            . $this->feature_table . '.title AS title,'
            . $this->feature_table . '.url AS url,'
            . $this->feature_table . '.icon AS icon,'
            . $this->feature_table . '.image AS image'
        ;

        // Columns to be included in CU statements
        $this->feature_table_columns = [
            $this->feature_table . '.is_active' => 'is_active',
            $this->feature_table . '.link' => 'link',
            $this->feature_table . '.title' => 'title',
            $this->feature_table . '.url' => 'url',
            $this->feature_table . '.icon' => 'icon',
            $this->feature_table . '.image' => 'image'
        ];

    }

}