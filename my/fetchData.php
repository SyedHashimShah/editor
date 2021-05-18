<?php
// Start the session
session_start();
?>
<?php
error_reporting(0);
include "config.php";

$LimitVal = $_POST['userData'];
//$LimitVal =10;
//echo 'checking whether value is passing through ajax call or not : '.$LimitVal;
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  
     $r = $conn->prepare("SELECT table_name FROM information_schema.tables
WHERE table_schema = '$db';");
         $r->execute();
    $all = $r->fetchAll(PDO::FETCH_ASSOC);

//  var_dump($all);
$output = '<div class="data-rahat"><i id="gjs-sm-caret" class="fa fa-caret-right"></i> Data<div class="my-tables">';
?>


<?php if($all): ?>
<?php foreach ($all as $data): ?>
    
<?php 
$table = $data['table_name'];

$subdata= '';
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
      $s = $conn->prepare("SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA='$db' 
    AND TABLE_NAME='$table'");
         $s->execute();
    $sub = $s->fetchAll(PDO::FETCH_ASSOC);
  foreach($sub as $col){
      
      $colName= $col['COLUMN_NAME'];
//      getting collumn values
      $val = $conn->prepare("SELECT $colName FROM $table LIMIT $LimitVal");
     $val->execute();
    $subval = $val->fetchAll(PDO::FETCH_ASSOC);
      $dataVal='<b><u><i>'.$colName.'</i></u></b><br>'. implode('<br>', array_map(function ($entry) {
  return ($entry[key($entry)]);
}, $subval));
//      end column values
      $subdata = $subdata .'<div class="col-data" draggable="true" value="'.$dataVal.'">'.$col['COLUMN_NAME'].'</div>';
 


  }

  $output = $output.'<div class="rahat-table '.$table.'" style="padding:4px 0px;margin-left: 8px"><i id="gjs-sm-caret" class="fa fa-caret-right"></i> '.$table.'<div class="columns-data ">'.$subdata.'</div></div>';
 $subdata= '';
 
?>

<?php endforeach;
$output = $output.'</div></div>';
echo $output;

//var_dump($sub);
//echo $subdata;
?>

<?php else:
echo $output ="data not found"; ?>
<?php endif; ?>
Hello pakistan
