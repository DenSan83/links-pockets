<?php

class User
{
    private int $_id;
    private string $name;
    private string $hash;
    private string $createdAt;

    public function __construct(array $user)
    {
        $this->_id = $user['id'];
        $this->name = $user['username'];
        $this->hash = $user['pw'];
        $this->createdAt = $user['created_at'];
    }

    /**
     * @return int|mixed
     */
    public function getId(): mixed
    {
        return $this->_id;
    }

    /**
     * @return mixed|string
     */
    public function getName(): mixed
    {
        return $this->name;
    }

    /**
     * @return mixed|string
     */
    public function getHash(): mixed
    {
        return $this->hash;
    }

    /**
     * @return mixed|string
     */
    public function getCreatedAt(): mixed
    {
        return $this->createdAt;
    }


}