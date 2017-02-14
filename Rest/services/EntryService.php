<?php

require_once 'models/Entry.php';
require_once 'models/Status.php';
require_once 'lib/Connection.php';

/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-13
 * Time: 16:58
 */
class EntryService
{
    public function getAllEntries()
    {
        $sql = "SELECT * FROM wpisy ORDER by data DESC";
        $connection = Connection::getConnection();

        $result = $connection->query($sql);
        $arrayOfEntries = array();

        if($result->num_rows > 0)
        {

            while($row = $result->fetch_row())
            {

                $entry = new Entry(
                    $row[0],
                    $row[1],
                    $row[2],
                    strlen($row[3])>200 ? substr($row[3],0,200)."..." : $row[3],
                    $row[4]
                );

                array_push($arrayOfEntries,$entry->toArray());
            }
        }

        $connection->close();
        return $arrayOfEntries;
    }

    public function getEntry($id)
    {
        $sql = "SELECT * FROM wpisy WHERE id=".$id;
        $connection = Connection::getConnection();

        $result = $connection->query($sql);
        $entry = null;

        if($result->num_rows > 0)
        {

            while($row = $result->fetch_row())
            {
                $entry = new Entry(
                    $row[0],
                    $row[1],
                    $row[2],
                    $row[3],
                    $row[4]
                );

            }
        }
        $connection->close();

        return $entry;
    }

    public function addEntry($entry)
    {
        $sql = "INSERT INTO `wpisy` (`tytul`,`kategoria`, `tresc`, `data`) VALUES (?, ?, ?, ?)";
        $connection = Connection::getConnection();

        $stmt = $connection->prepare($sql);

        $stmt->bind_param("siss",$entry["tytul"],$entry["kategoria"],$entry["tresc"],$entry["data"]);

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

    public function deleteEntry($id)
    {
        $sql = "DELETE FROM wpisy WHERE id = ".$id;
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

    public function updateEntry($entry)
    {
        $sql = "UPDATE wpisy SET tytul=?,tresc=? where id=?";
        $connection = Connection::getConnection();
        $stmt = $connection->prepare($sql);

        $stmt->bind_param("ssi",$entry["tytul"],$entry["tresc"],$entry["id"]);


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