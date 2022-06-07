<?php

class notificationController
{
    private const TYPES = [
        'primary',
        'secondary',
        'success',
        'info',
        'warning',
        'danger'
    ];

    public function createNotification(string $type, string $message): void
    {
        if (in_array($type, self::TYPES)) {
            $_SESSION['notification']['type'] = $type;
            $_SESSION['notification']['msg'] = $message;
        }
    }

    public function destroyNotifications(): void
    {
        unset($_SESSION['notification']);
    }

}