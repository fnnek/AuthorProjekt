<?php

/**
 * Created by PhpStorm.
 * User: Mariusz
 * Date: 2017-02-10
 * Time: 20:36
 */
class Status
{
    private $status;
    private $message;

    /**
     * Status constructor.
     * @param $status
     * @param $message
     */
    public function __construct($status, $message)
    {
        $this->status = $status;
        $this->message = $message;
    }

    /**
     * @return mixed
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * @param mixed $status
     */
    public function setStatus($status)
    {
        $this->status = $status;
    }

    /**
     * @return mixed
     */
    public function getMessage()
    {
        return $this->message;
    }

    /**
     * @param mixed $message
     */
    public function setMessage($message)
    {
        $this->message = $message;
    }

    public function toArray()
    {
        $array = array(
            "status"=>$this->status,
            "message"=>$this->message
        );

        return $array;
    }



}