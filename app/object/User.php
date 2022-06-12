<?php

class User
{
    private int $_id;
    private string $name;
    private string $email;
    private ?string $avatar;
    private string $createdAt;

    public function __construct(array $user)
    {
        $this->_id = $user['id'];
        $this->name = $user['username'];
        $this->email = $user['email'];
        $this->avatar = $user['avatar'] ?? '';
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
     * @param mixed|string $name
     */
    public function setName(mixed $name): self
    {
        $this->name = $name;
        return $this;
    }

    /**
     * @return mixed|string
     */
    public function getEmail(): mixed
    {
        return $this->email;
    }

    /**
     * @param mixed|string $email
     */
    public function setEmail(mixed $email): self
    {
        $this->email = $email;
        return $this;
    }

    /**
     * @return mixed|string
     */
    public function getAvatar(): mixed
    {
        return $this->avatar;
    }

    /**
     * @param mixed|string|null $avatar
     */
    public function setAvatar(mixed $avatar): self
    {
        $this->avatar = $avatar;
        return $this;
    }


    /**
     * @return mixed|string
     */
    public function getCreatedAt(): mixed
    {
        return $this->createdAt;
    }


}