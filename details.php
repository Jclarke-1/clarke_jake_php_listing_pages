<?php 

require_once __DIR__ . '/includes/scripts/database.php';

$connection = getConnection();

$id = $_GET['id'] ?? null;

if ($id === null) {
    http_response_code(404);
    echo '<a href="index.php">Go Home!</a><br>';
    exit('Error! Book not found');
}

$queryResult = mysqli_query($connection, 'SELECT * FROM books WHERE id =' . $id . ';');

$book = mysqli_fetch_assoc($queryResult);

if(! $book) {
    http_response_code(404);
    echo '<a href="index.php">Go Home!</a><br>';
    exit('Error! Book not found!');
}

$bookId = $book['id'];



?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="main.css">
    <title>Books Database</title>
</head>
<body>
    <header></header>
    <main></main>
    <footer></footer>
     <script src="main.js"></script>
</body>
</html>