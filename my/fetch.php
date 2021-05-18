<?php
// Start the session
session_start();
?>
<?php
error_reporting(0);
include "config.php";



// echo $_POST['userData'];
$userData = $_POST['userData'];

$arr= explode(',',$userData);
$table = null;
$column = null;
$name = null;
if (isset($arr[0])) {
   $table = $arr[0];
}
if (isset($arr[1])) {
   $column = $arr[1];
}
if (isset($arr[2])) {
   $name = $arr[2];
}

/*
 $table = $arr[0];
 $column = $arr[1];
 $name = $arr[2];
 */
 
//  var_dump($arr);

// echo strlen($table)."---".strlen($column)."---".strlen($name);
$price = 0;
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  
// $r = $conn->prepare("SELECT * FROM $table WHERE name = '$name'");
 if(strlen($name)){
     $r = $conn->prepare("SELECT * FROM $table WHERE name = '$name'");
         $r->execute();
    $all = $r->fetchAll(PDO::FETCH_ASSOC);
 }
 else{
      $r = $conn->prepare("SELECT * FROM $table");   
          $r->execute();
    $all = $r->fetchAll(PDO::FETCH_ASSOC);
 }
 // $r = $conn->prepare("SELECT * FROM $table"); 

//  var_dump($all);

?>
<?php
 if(strlen($column)){
     $output = '<table class="table"><thead>
    <tr>
      <th scope="col">'.ucfirst($column).'</th>
    </tr>
  </thead>
  <tbody>';

 
 }
 else{
     
     $output = '<table class="table"><thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Qty</th>
      <th scope="col">Price</th>
      <th scope="col">Discount(%)</th>
      <th scope="col">Discounted Price</th>
    </tr>
  </thead>
  <tbody>';
     
 }
 ?>

<?php if($all): ?>
<?php foreach ($all as $data): ?>
    
<?php 

$discountedPrice = ($data['price']*$data['qty']) - (($data['price']*$data['qty']*$data['discount'])/100);

$price = $price+ $discountedPrice;
 if(strlen($column)){
  
  $colVal = preg_replace('/[^\d\s]/', '',$column);
  if ($column=='price'){
      $output= $output.'<tr><td>'.$data[$column]*$data['qty']."</td></tr>"; 
  }
  else{
      $output= $output.'<tr><td>'.$data[$column]."</td></tr>"; 
  }
    
    
 }
 else{
 
     
     $output= $output.'<tr><td>'.$data['id']."</td><td>".$data['name']."</td><td>".$data['qty']."</td><td>".$data['price']*$data['qty']."</td><td>".$data['discount']."</td><td>".$discountedPrice."</td></tr>";
 }
 
?>

<?php endforeach; ?>


<?php
echo $output.'</tbody></table>';
if((strlen($column)) && ($column!='price')){

}
else{
    echo "<hr></hr>";
echo "<span style='padding:0px 25px'>Total  Price: </span>".$price;
}
?>
<?php else:
echo $output ="data not found"; ?>
<?php endif; ?>


