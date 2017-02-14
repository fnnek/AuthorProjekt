<?php

/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-10
 * Time: 20:34
 */
class Comment
{
    private $id;
    private $id_wpisu;
    private $autor;
    private $tresc;
    private $data;

    /**
     * Comment constructor.
     * @param $id
     * @param $id_wpisu
     * @param $autor
     * @param $tresc
     * @param $data
     */
    public function __construct($id, $id_wpisu, $autor, $tresc, $data)
    {
        $this->id = $id;
        $this->id_wpisu = $id_wpisu;
        $this->autor = $autor;
        $this->tresc = $tresc;
        $this->data = $data;
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
    public function getIdWpisu()
    {
        return $this->id_wpisu;
    }

    /**
     * @param mixed $id_wpisu
     */
    public function setIdWpisu($id_wpisu)
    {
        $this->id_wpisu = $id_wpisu;
    }

    /**
     * @return mixed
     */
    public function getAutor()
    {
        return $this->autor;
    }

    /**
     * @param mixed $autor
     */
    public function setAutor($autor)
    {
        $this->autor = $autor;
    }

    /**
     * @return mixed
     */
    public function getTresc()
    {
        return $this->tresc;
    }

    /**
     * @param mixed $tresc
     */
    public function setTresc($tresc)
    {
        $this->tresc = $tresc;
    }

    /**
     * @return mixed
     */
    public function getData()
    {
        return $this->data;
    }

    /**
     * @param mixed $data
     */
    public function setData($data)
    {
        $this->data = $data;
    }


    public function toArray()
    {
        $array = array(
            "id"=>$this->id,
            "id_wpisu"=>$this->id_wpisu,
            "autor"=>$this->autor,
            "tresc"=>$this->tresc,
            "data"=>$this->data
        );

        return $array;
    }


}