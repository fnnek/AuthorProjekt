<?php

/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-10
 * Time: 20:18
 */
class Connection
{

    const host = "localhost";
    const user = "root";
    const pass = "";
    const dbname = "projekt";

    /**
     * @return mysqli
     */
    static function getConnection() {
        $connection = new mysqli(self::host,self::user,self::pass,self::dbname);
        mysqli_set_charset($connection,"utf8");

        return $connection;
    }

}