<?php

class User
{
    private int $_id;
    private string $name;
    private string $email;
    private string $avatar;
    private string $createdAt;

    public function __construct(array $user)
    {
        $this->_id = $user['id'];
        $this->name = $user['username'];
        $this->email = $user['email'];
        $this->avatar = $user['avatar'];
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
    public function getEmail(): mixed
    {
        return $this->email;
    }

    /**
     * @return mixed|string
     */
    public function getAvatar(): mixed
    {
        return $this->avatar;
    }


    /**
     * @return mixed|string
     */
    public function getCreatedAt(): mixed
    {
        return $this->createdAt;
    }


}