<?php

/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-10
 * Time: 20:30
 */
class Entry
{
    private $id;
    private $tytul;
    private $kategoria;
    private $tresc;
    private $data;

    /**
     * Entry constructor.
     * @param $id
     * @param $tytul
     * @param $kategoria
     * @param $tresc
     * @param $data
     */
    public function __construct($id, $tytul, $kategoria, $tresc, $data)
    {
        $this->id = $id;
        $this->tytul = $tytul;
        $this->kategoria = $kategoria;
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
    public function getTytul()
    {
        return $this->tytul;
    }

    /**
     * @param mixed $tytul
     */
    public function setTytul($tytul)
    {
        $this->tytul = $tytul;
    }

    /**
     * @return mixed
     */
    public function getKategoria()
    {
        return $this->kategoria;
    }

    /**
     * @param mixed $kategoria
     */
    public function setKategoria($kategoria)
    {
        $this->kategoria = $kategoria;
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
            "tytul"=>$this->tytul,
            "kategoria"=>$this->kategoria,
            "tresc"=>$this->tresc,
            "data"=>$this->data
        );

        return $array;
    }


}