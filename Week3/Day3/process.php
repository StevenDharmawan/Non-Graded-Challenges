<?php
$name = $_REQUEST['nama'];
$alamat = $_REQUEST['alamat'];
if($alamat == "Bintaro"){
    echo "dekat";
} else {
    echo "jauh";
}
echo $name;
?>
