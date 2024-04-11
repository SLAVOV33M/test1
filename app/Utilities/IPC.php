<?php

namespace App\Utilities;

class IPC
{
    private static $socket;

    /**
     * @return bool
     */
    public static function init(): bool
    {
        $socket = socket_create(AF_UNIX, SOCK_STREAM, 0);
        if (!$socket) {
            return false;
        }

        self::$socket = $socket;
        return true;
    }

    /**
     * @param $fileName
     * @return bool
     */
    public static function connect($fileName): bool
    {
        $fileName = '/opt/xatbot-Bot/sockets/' . $fileName;

        if (!file_exists($fileName)) {
            return false;
        }

        $ret = socket_connect(self::$socket, $fileName);

        if (!$ret) {
            return false;
        }

        socket_set_option(self::$socket, SOL_SOCKET, SO_RCVTIMEO, ['sec' => 5, 'usec' => 0]);

        return true;
    }

    /**
     * @param $size
     * @return false|string
     */
    public static function read($size)
    {
        return socket_read(self::$socket, $size);
    }

    /**
     * @param $packet
     * @return false|int
     */
    public static function write($packet): bool|int
    {
        return socket_write(self::$socket, $packet);
    }

    /**
     * @return null
     */
    public static function close()
    {
        return socket_close(self::$socket);
    }
}
