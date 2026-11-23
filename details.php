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

$genreResult = mysqli_query($connection, 'SELECT * FROM books_genre WHERE book_id =' . $bookId . ';');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="main.css">
    <title>Book Archive - <?php echo $book['book_title']; ?> </title>
</head>
<body>
    <header>
        <h1><?php echo $book['book_title'];?> </h1>
    </header>
    <main>
        <h2><?php echo $book['book_author'];?> </h2>
        <ul>
            <li>
                <article>
                <img src="<?php echo $book['book_image']; ?>" alt="<?php echo $book['book_title'];?> cover">
                  <p>
                        <?php echo $book['book_synopsis'];?>
                    </p>
                   <?php while ($genre = mysqli_fetch_assoc($genreResult)) { ?>
                    <h3>
                       <?php echo $genre['genre_type'];?>
                    </h3>
                       <?php } ?>
                </article>
            </li>
           
        </ul>
    </main>
    <footer></footer>
     <script src="main.js"></script>
</body>
</html>