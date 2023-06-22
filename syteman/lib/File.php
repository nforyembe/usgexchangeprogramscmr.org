<?php

class File {

     function __construct() 
     {}


     static function upload_file($file_info, $file_name, $destination=null)
     {

          return move_uploaded_file($file_info['tmp_name'], '../' . (($destination != null) ? $destination : REL_PATH_TO_LIBRARY) . '/' . $file_name);

     }


     static function name_file($ext, $prefix=null) 
     {

          return substr(($prefix != null ? $prefix . '-' : ''), 0, 25) . time() . '.' . $ext;

     }


     static function check_if_file_is_submitted() 
     {

          $submission = 0;
          foreach ($_FILES as $file) $submission += $file['size'];

          if ($submission > 0) return true;
               else return false;
          
     }


     static function type_of_file($file)
     {
          switch ($file) {

               case 'image/png':
               case 'image/PNG':
               case 'image/jpeg':
               case 'image/jpg':
               case 'image/JPEG':
               case 'image/JPG':               
               case 'image/svg+xml':               
               case 'image/gif':
               case 'image/GIF':
                    $type = 'image';
                    break;

               case 'application/pdf':               
               case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
               case 'application/msword':
               case 'application/vnd.ms-excel':
               case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet': 
               case 'application/vnd.ms-powerpoint': 
               case 'application/vnd.openxmlformats-officedocument.presentationml.presentation': 
               case 'application/rtf': 
                    $type = 'document'; 
                    break;
               
               case 'audio/mpeg': 
               case 'audio/x-wav': 
                    $type = 'audio'; 
                    break;
               
               case 'video/mp4': 
               case 'video/webm': 
               case 'video/x-m4v': 
               case 'video/quicktime': 
               case 'video/x-flv': 
               case 'video/x-msvideo': 
               case 'video/x-ms-wmv': 
                    $type = 'video'; 
                    break;
               
               default: 
                    $type = false;
                    break;

          }

          return $type;

     }


     static function file_directory($file)
     {
          switch ($file) {

               case 'image':
                    $directory = REL_PATH_TO_IMAGES;
                    break;

               case 'document': 
                    $directory = REL_PATH_TO_DOCUMENTS; 
                    break;
               
               case 'audio': 
                    $directory = REL_PATH_TO_AUDIOS; 
                    break;
               
               case 'video': 
                    $directory = REL_PATH_TO_VIDE0S; 
                    break;
               
               default: 
                    $directory = false;
                    break;

          }

          return $directory;

     }


     static function validate_file_type($file, $group)
     {

          switch ($group) {

               case 'image': 
                    $ext = self::validate_image_extension($file); 
                    break;
               
               case 'video': 
                    $ext = self::validate_video_extension($file); 
                    break;

               case 'document':
                    $ext = self::validate_document_extension($file); 
                    break;
               
               default: 
                    $ext = false;
                    break;

          }

          return $ext;

     }


     static function validate_image_extension($file)
     {

          if ($file != '') {

               switch($file['type']) {
                    
                    case 'image/png':
                    case 'image/PNG':
                         $ext = 'png';
                         break;

                    case 'image/jpeg':
                    case 'image/jpg':
                    case 'image/JPEG':
                    case 'image/JPG':
                         $ext = 'jpg';
                         break;
                    
                    case 'image/svg+xml':
                         $ext = 'svg';
                         break;
                    
                    case 'image/gif':
                    case 'image/GIF':
                         $ext = 'gif';
                         break;
                    
                    default:
                         $ext = false;
                         break;

               }

          } else {
          
               $ext = false;
          
          }

          return $ext;

     }


     static function validate_document_extension($file)
     {

          if ($file != '') {

               switch($file['type']) {
                    
                    case 'application/pdf':
                         $ext = 'pdf';
                         break;
                    
                    case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
                         $ext = 'docx';
                         break;

                    case 'application/msword':
                         $ext = 'doc';
                         break;
                    
                    case 'application/vnd.ms-excel': 
                         $ext = 'xls'; 
                         break;

                    case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet': 
                         $ext = 'xlsx'; 
                         break;

                    case 'application/vnd.ms-powerpoint': 
                         $ext = 'ppt'; 
                         break;

                    case 'application/vnd.openxmlformats-officedocument.presentationml.presentation': 
                         $ext = 'pptx'; 
                         break;

                    case 'application/rtf': 
                         $ext = 'rtf'; 
                         break;
                    
                    default:
                         $ext = false;
                         break;

               }

          } else {
          
               $ext = false;
          
          }

          return $ext;

     }

}