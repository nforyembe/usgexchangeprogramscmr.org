<?php

return [
    'PATH_TO_THEMES' => ROOT_DIR . '/content/themes/',
    'REL_PATH_TO_THEMES' => '/content/themes/',

    'PATH_TO_THEME' => ROOT_DIR . '/content/themes/' . ((defined('THEME') && !is_null(THEME)) ? (THEME != '' ? THEME: 'default') : 'default') . '/',
    'REL_PATH_TO_THEME' => '/content/themes/' . ((defined('THEME') && !is_null(THEME)) ? (THEME != '' ? THEME: 'default') : 'default') . '/',

    'PATH_TO_DAOS' => ROOT_DIR . '/daos/',    
    'REL_PATH_TO_DAOS' => '/daos/',

    'PATH_TO_LIBRARY' => (defined('PROJECT_NAME') ? PROJECT_NAME : '') . '/content/library/',
    'REL_PATH_TO_LIBRARY' => '/content/library/',

    'PATH_TO_IMAGES' => (defined('PROJECT_NAME') ? PROJECT_NAME : '') . '/content/library/images/',
    'REL_PATH_TO_IMAGES' => '/content/library/images/', 

    'PATH_TO_ICONS' => (defined('PROJECT_NAME') ? PROJECT_NAME : '') . '/content/library/icons/',
    'REL_PATH_TO_ICONS' => '/content/library/icons/', 

    'PATH_TO_DOCUMENTS' => (defined('PROJECT_NAME') ? PROJECT_NAME : '') . '/content/library/documents/',
    'REL_PATH_TO_DOCUMENTS' => '/content/library/documents/',
    
    'PATH_TO_VIDS' => (defined('PROJECT_NAME') ? PROJECT_NAME : '') . '/content/library/videos/',
    'REL_PATH_TO_VIDS' => '/content/library/videos/',

    /** As related to syteman **/
    'PATH_TO_SYM_THEME' => ROOT_DIR . '/syteman/content/themes/default/',
    'REL_PATH_TO_SYM_THEME' => '/syteman/content/themes/default/',
    
    'PATH_TO_SYM_IMAGES' => (defined('PROJECT_NAME') ? PROJECT_NAME : '') . '/syteman/content/library/images/',
    'PATH_TO_SYM_ICONS' => (defined('PROJECT_NAME') ? PROJECT_NAME : '') . '/syteman/content/library/icons/',
    'PATH_TO_SYM_DOCS' => (defined('PROJECT_NAME') ? PROJECT_NAME : '') . '/syteman/content/library/documents/',
    'PATH_TO_SYM_VIDS' => (defined('PROJECT_NAME') ? PROJECT_NAME : '') . '/syteman/content/library/videos/',
];