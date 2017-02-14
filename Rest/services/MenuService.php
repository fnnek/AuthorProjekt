<?php

require_once "models/MenuItem.php";
/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-13
 * Time: 18:53
 */
class MenuService
{
    public function getMenuItems()
    {
        $sql = "SELECT * FROM menu";
        $connection = Connection::getConnection();

        $result = $connection->query($sql);
        $arrayMenu = array();

        if($result->num_rows > 0)
        {
            while ($row = $result->fetch_row())
            {
                $menu = new MenuItem(
                    $row[0],
                    $row[1],
                    $row[2]
                );

                array_push($arrayMenu,$menu->toArray());
            }
        }

        $connection->close();

        return $arrayMenu;
    }

}