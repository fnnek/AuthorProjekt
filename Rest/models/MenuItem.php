<?php

/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-10
 * Time: 20:32
 */
class MenuItem
{
    private $id;
    private $nazwa;
    private $link;

    /**
     * MenuItem constructor.
     * @param $id
     * @param $nazwa
     * @param $link
     */
    public function __construct($id, $nazwa, $link)
    {
        $this->id = $id;
        $this->nazwa = $nazwa;
        $this->link = $link;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getNazwa()
    {
        return $this->nazwa;
    }

    /**
     * @param mixed $nazwa
     */
    public function setNazwa($nazwa)
    {
        $this->nazwa = $nazwa;
    }

    /**
     * @return mixed
     */
    public function getLink()
    {
        return $this->link;
    }

    /**
     * @param mixed $link
     */
    public function setLink($link)
    {
        $this->link = $link;
    }


    public function toArray()
    {
        $array = array(
            "id"=>$this->id,
            "link"=>$this->link,
            "nazwa"=>$this->nazwa
        );

        return $array;
    }


}