<?php

require_once 'models/Book.php';
require_once 'models/Status.php';
require_once 'lib/Connection.php';
/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-10
 * Time: 20:44
 */
class BookService
{

    public function getAllBooks()
    {
        $sql = "SELECT * FROM ksiazki";
        $connection = Connection::getConnection();

        $result = $connection->query($sql);
        $arrayOfBooks = Array();

        if($result->num_rows > 0)
        {
            while ($row = $result->fetch_row())
            {
                $book = new Book(
                    $row[0],
                    $row[1],
                    $row[2],
                    $row[3]);

                array_push($arrayOfBooks,$book->toArray());
            }
        }
        else {
            echo "brak książek";
        }

        $connection->close();

        return $arrayOfBooks;

    }

    public function getBook($id)
    {
        $sql = "SELECT `id`,`tytul`,`tresc`,`okladka` FROM ksiazki WHERE id = " . $id;
        $connection = Connection::getConnection();
        //$connection = new mysqli("localhost","root","","projekt");


        $result = $connection->query($sql);
        $ret = null;
        if($result->num_rows >0) {
            while ($row = $result->fetch_row()) {
                $book = new Book(
                    $row[0],
                    $row[1],
                    $row[2],
                    $row[3]);

                $ret = $book->toArray();
                echo json_encode($ret);
            }
        }

        $connection->close();
        return $ret;

    }


    public function addBook($book)
    {
        $sql = "INSERT INTO ksiazki (`tytul`,`tresc`,`okladka`) VALUES (?,?,?)";
        $connection = Connection::getConnection();
        $stmt = $connection->prepare($sql);


        $stmt->bind_param("sss",$book["tytul"],$book["tresc"],$book["okladka"]);

        $status = null;
        $ret = null;
        if($stmt->execute())
        {
            $status = new Status(1,"Dodano poprawnie!");
            $ret = $status->toArray();

        }
        else
        {
            $status = new Status(0,"Wystąpił błąd. Spróbuj ponownie lub skontaktuj się z administratorem");
            $ret = $status->toArray();

        }

        $stmt->close();
        $connection->close();
        return $ret;

    }

    public function deleteBook($id)
    {
        $sql = "DELETE FROM ksiazki WHERE id = ".$id;
        $connection = Connection::getConnection();
        $status = null;
        if($connection->query($sql))
        {
            $status = new Status(1,"Element usunięto poprawnie");

        }
        else
        {
            $status = new Status(0,"Wystąpił błąd. Spróbuj ponownie lub skontaktuj się z administratorem");

        }
        $connection->close();
        return $status->toArray();
    }

    public function updateBook($book)
    {
        $sql = "UPDATE ksiazki SET tytul=?,tresc=?,okladka=? where id=?";
        $connection = Connection::getConnection();
        $stmt = $connection->prepare($sql);

        $stmt->bind_param("sssi",$book["tytul"],$book["tresc"],$book["okladka"],$book["id"]);


        if($stmt->execute())
        {
            $status = new Status(1,"Uaktualniono poprawnie!");
            $ret = $status->toArray();
        }
        else
        {
            $status = new Status(0,"Wystąpił błąd. Spróbuj ponownie lub skontaktuj się z administratorem");
            $ret = $status->toArray();
        }

        $stmt->close();
        $connection->close();
        return $ret;
    }


}