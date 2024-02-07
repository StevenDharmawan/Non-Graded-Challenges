<?php
session_start();

if(!isset($_SESSION['data'])) {
    $_SESSION['data'] = [];
}

if($_SERVER['REQUEST_METHOD'] == 'POST') {
    if(isset($_POST['create'])) {
        $newItem = ['id' => uniqid(), 'name' => $_POST['name']];
        array_push($_SESSION['data'], $newItem);
    }

    if(isset($_POST['update'])) {
        foreach($_SESSION['data'] as &$item) {
            if($item['id'] == $_POST['id']) {
                $item['name'] = $_POST['name'];
                break;
            }
        }
    }

    if(isset($_POST['delete'])) {
        foreach($_SESSION['data'] as $key => $item) {
            if($item['id'] == $_POST['id']) {
                unset($_SESSION['data'][$key]);
                break;
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple CRUD without Database</title>
    <script>
        function setData(id, name) {
            document.getElementById('id').value = id;
            document.getElementById('name').value = name;
        }
    </script>
</head>
<body>
    <form method="POST">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" readonly>
        <br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
        <br>
        <button type="submit" name="create">Create</button>
        <button type="submit" name="update">Update</button>
        <button type="submit" name="delete">Delete</button>
    </form>

    <h2>Data:</h2>
    <ul>
        <?php foreach($_SESSION['data'] as $item): ?>
            <li>
                ID: <?= $item['id'] ?>, Name: <?= $item['name'] ?>
                <button onclick="setData('<?= $item['id'] ?>', '<?= $item['name'] ?>')">Update</button>
                <button onclick="setData('<?= $item['id'] ?>', ''); document.querySelector('form').submit();">Delete</button>
            </li>
        <?php endforeach; ?>
    </ul>
</body>
</html>