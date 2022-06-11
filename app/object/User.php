<?php

class User
{
    private int $_id;
    private string $name;
    private string $createdAt;

    public function __construct(array $user)
    {
        $this->_id = $user['id'];
        $this->name = $user['username'];
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
    public function getCreatedAt(): mixed
    {
        return $this->createdAt;
    }


}