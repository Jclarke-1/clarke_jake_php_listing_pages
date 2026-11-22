<?php 
require_once __DIR__ . '/includes/scripts/database.php';

$connection = getConnection();

$queryResult = mysqli_query($connection, 'SELECT * FROM books;');

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
    <header>
        <h1>Book Archive</h1>
    </header>
    <main>
        <h2>Books</h2>
        <ul>
            <?php while ($book = mysqli_fetch_array($queryResult)): ?>
            <li>
                <article>
                    <h3>
                        <a href="details.php?id=<?php echo $book['id']; ?>">
                            <?php echo $book['book_title']; ?>
                        </a>
                    </h3>
                    <h4>
                        <?php echo $book['book_author'];?>
                    </h4>
                    <?php if ($book['book_image']): ?>
                    <img src="<?php echo $book['book_image']; ?>" alt="<?php echo $book['book_title'];?> thumbnail">
                    <?php endif; ?>
                    <p>
                        <?php echo $book['book_description'];?>
                    </p>
                </article>
            </li>
           <?php endwhile; ?>
        </ul>
    </main>
    <footer></footer>
     <script src="main.js"></script>
</body>
</html>