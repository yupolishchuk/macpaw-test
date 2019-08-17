<?php


namespace src;


class Cookie
{
    private $key;

    public function __construct(string $key)
    {
        $this->key = $key;
    }
    
    public function get(): string
    {
        return isset($_COOKIE[$this->key]) ? $_COOKIE[$this->key] : '';
    }

    public function set(string $val): void
    {
        setcookie($this->key, $val);
    }

    public function unset(): void
    {
        unset($_COOKIE[$this->key]);
        setcookie($this->key, null, -1);
    }
}