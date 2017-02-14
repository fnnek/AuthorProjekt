<?php

/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-10
 * Time: 20:28
 */
class Book
{
    private $id;
    private $tytul;
    private $tresc;
    private $okladka;


    /**
     * Book constructor.
     * @param $id
     * @param $tytul
     * @param $tresc
     * @param $okladka
     */
    public function __construct($id, $tytul, $tresc, $okladka)
    {
        $this->id = $id;
        $this->tytul = $tytul;
        $this->tresc = $tresc;
        $this->okladka = $okladka;
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
    public function getOkladka()
    {
        return $this->okladka;
    }

    /**
     * @param mixed $okladka
     */
    public function setOkladka($okladka)
    {
        $this->okladka = $okladka;
    }




    public function toArray()
    {
        $array = array(
            "id"=>$this->id,
            "tytul"=>$this->tytul,
            "tresc"=>$this->tresc,
            "okladka"=>$this->okladka
        );

        return $array;
    }


}