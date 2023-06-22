<?php

class Menu extends Feature {

    public function __construct() 
    {
        
        parent::__construct();

        // Define a name for the feature and it's category
        $this->feature = 'nav_link';
        $this->feature_category = 'navs';

        // For front end... the page on which the features will be displayed
        // $this->feature_page = '';
        // $this->template_preview = '';
        // $this->template_detail = '';
        // $this->template_category_preview = '';
        // $this->template_category_detail = '';

        // For backend... the CRUD files
        // $this->feature_category_add_template = '';
        // $this->feature_category_update_template = '';
        $this->feature_add_template = 'menu-add.html';
        // $this->feature_update_template = '';

        // Define the names of the tables as on db
        $this->feature_category_table = 'navs';

        $this->feature_table = 'nav_links';
        $this->feature_content_table = 'nav_link_content';

        // Define the columns to join the feature content table to the feature table
        $this->join_column = 'nav_link_id';
        // ...and (if category_id was not used), the column to join the feature to the corresponding category content table, in the case of a categorized feature
        $this->join_column_category = 'nav_id';

        // Feature Category Columns to be included in RD Statements
        $this->select_category_columns = $this->feature_category_table . '.id AS id,'
            . $this->feature_category_table . '.title AS title,'
            . $this->feature_category_table . '.description AS description'
        ;

        // Feature Category Columns to be included in CU statements
        $this->feature_category_table_columns = [
            $this->feature_category_table . '.title' => 'title',
            $this->feature_category_table . '.description' => 'description'
        ];


        // Feature Columns to be included in RD Statements
        $this->select_columns = $this->feature_table . '.id AS id,'
            . $this->feature_table . '.nav_id AS nav_id,'
            . $this->feature_table . '.position AS position,'
            . $this->feature_table . '.parent AS parent,'
            . $this->feature_table . '.link_type AS link_type,'
            . $this->feature_table . '.link AS link,'
            . $this->feature_table . '.url AS url,'
            . $this->feature_table . '.image AS image,'
            . $this->feature_table . '.icon AS icon,'
            . $this->feature_table . '.is_active AS is_active,'
            . $this->feature_content_table . '.lang_id AS lang_id,'
            . $this->feature_content_table . '.title AS title,'
            . $this->feature_content_table . '.description AS description'
        ;

        // Columns to be included in CU statements
        $this->feature_table_columns = [
            $this->feature_table . '.nav_id' => 'category_id',
            $this->feature_table . '.position' => 'position',
            $this->feature_table . '.parent' => 'parent',
            $this->feature_table . '.link_type' => 'link_type',
            $this->feature_table . '.link' => 'link',
            $this->feature_table . '.url' => 'url',
            $this->feature_table . '.image' => 'image',
            $this->feature_table . '.icon' => 'icon',
            $this->feature_table . '.is_active' => 'is_active'
        ];

        $this->feature_content_table_columns = [
            $this->feature_content_table . '.title' => 'title',
            $this->feature_content_table . '.description' => 'description'
        ];

    }


    public function select_navigation() 
    {
        
        // Write Method to select which Nav to display.

    }
    

    public function get_navigation($nav=null) 
    {
        
        $sql_params['table_name'] = $this->feature_table;
        $sql_params['columns'] = $this->select_columns;
        $sql_params['join'] = [
            $this->feature_content_table => $this->feature_table . '.id=' . $this->feature_content_table . '.nav_link_id'
        ];
        $sql_params['condition'] = $this->feature_table . '.parent IS NULL AND ' . $this->feature_table . '.is_active=1' . (isset($nav) ? ' AND nav_id=' . $nav : '');
        $sql_params['sort'] = 'position ASC';

        $nav_links = parent::select_data($sql_params);

        // var_dump($nav_links);

        foreach ($nav_links as $link) {
            
            $sql_params['condition'] = $this->feature_table . '.parent=' . $link['id'] . ' AND ' . $this->feature_table . '.is_active=1'; 

            $link['sub_links'] = parent::select_data($sql_params);

            $nav_links_with_sub[] = $link;

        }

        // var_dump($nav_links_with_sub);
        
        return $nav_links_with_sub;

    }

}