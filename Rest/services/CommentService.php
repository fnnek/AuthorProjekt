<?php

require_once "models/Comment.php";
/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-13
 * Time: 17:36
 */
class CommentService
{
    public function getCommentToEntry($id_wpisu)
    {
        $sql = "SELECT * FROM komentarze WHERE id_wpisu=".$id_wpisu;
        $connection = Connection::getConnection();

        $result = $connection->query($sql);

        $commentArray = array();

        if($result->num_rows > 0)
        {
            while ($row = $result->fetch_row())
            {
                $comment = new Comment(
                    $row[0],
                    $row[1],
                    $row[2],
                    $row[4],
                    $row[3]
                );

                array_push($commentArray,$comment->toArray());
            }
        }
        $connection->close();
        return $commentArray;
    }

    public function addComment($comment)
    {
        $sql = "INSERT INTO `komentarze` (`id_wpisu`,`autor`, `data`, `tresc`) VALUES (?, ?, ?, ?)";
        $connection = Connection::getConnection();

        $stmt = $connection->prepare($sql);

        $stmt->bind_param("ssss",$comment["id_wpisu"],$comment["autor"],$comment["data"],$comment["tresc"]);

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

    public function deleteComment($id)
    {
        $sql = "UPDATE komentarze SET tresc=\"Komentarz usunięty przez moderatora\" where id=?";
        $connection = Connection::getConnection();
        $stmt = $connection->prepare($sql);

        $stmt->bind_param("i", $id);


        if ($stmt->execute()) {
            $status = new Status(1, "Usunięto poprawnie!");
            $ret = $status->toArray();
        } else {
            $status = new Status(0, "Wystąpił błąd. Spróbuj ponownie lub skontaktuj się z administratorem");
            $ret = $status->toArray();
        }

        $stmt->close();
        $connection->close();
        return $ret;
    }
}