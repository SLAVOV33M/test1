<?php

namespace App\Utilities;

class XatUser
{
    private $id;
    private $regname;

    private $nick;
    private $avatar;
    private $home;
    private $bride;
    private $app;
    private $gameban;
    private $wasHere;

    private $flag0;
    private $aflags;
    private $qflags;

    private $login;
    private $rev;

    private $powers;
    private $maskedpowers;
    private $doubles;
    private $xats;
    private $days;

    /**
     * @param $packet
     */
    public function __construct($packet)
    {
        $this->id = $packet['u'] ?? 0;
        $this->regname = $packet['N'] ?? null;

        $this->nick = $packet['n'] ?? null;
        $this->avatar = $packet['a'] ?? null;
        $this->home = $packet['h'] ?? null;
        $this->bride = $packet['d2'] ?? 0;
        $this->app = $packet['x'] ?? 0;
        $this->gameban = $packet['w'] ?? 0;
        $this->wasHere = isset($packet['s']);

        $this->flag0 = $packet['f'] ?? 0;
        $this->aflags = $packet['d0'] ?? 0;
        $this->qflags = $packet['q'] ?? 0;

        $this->login = $packet['cb'] ?? 0;
        $this->rev = $packet['v'] ?? 0;

        $this->setPowers($packet);
    }

    /**
     * @return int|mixed
     */
    public function getID()
    {
        return $this->id;
    }

    /**
     * @return mixed|null
     */
    public function getRegname()
    {
        return $this->regname;
    }

    /**
     * @return null
     */
    public function getDoubles()
    {
        return (!empty($this->doubles) ? $this->doubles : null);
    }

    /**
     * @return int
     */
    public function getXats()
    {
        return (!empty($this->xats) ? $this->xats : 0);
    }

    /**
     * @return int
     */
    public function getDays()
    {
        return (!empty($this->days) ? $this->days : 0);
    }

    /**
     * @return mixed
     */
    public function getPowers()
    {
        return $this->powers;
    }

    /**
     * @return mixed
     */
    public function getMaskedPowers()
    {
        return $this->maskedpowers;
    }

    /**
     * @return bool
     */
    public function isStealth()
    {
        return (($this->nick[0] == '$') && ($this->isOwner() || $this->isMain()));
    }

    /**
     * @return string
     */
    public function getStatus()
    {
        return substr(strstr($this->nick, '##'), 2);
    }

    /**
     * @return false|mixed|string|null
     */
    public function getNick()
    {
        $pos = strpos($this->nick, '##');
        $nick = ($pos === false) ? $this->nick : strstr($this->nick, '##', true);
        return ($this->isStealth()) ? substr($nick, 1) : $nick;
    }

    /**
     * @return mixed|null
     */
    public function getAvatar()
    {
        return $this->avatar;
    }

    /**
     * @return mixed|null
     */
    public function getHome()
    {
        return $this->home;
    }

    /**
     * @return int|mixed
     */
    public function getBride()
    {
        return $this->bride;
    }

    /**
     * @return bool
     */
    public function wasHere()
    {
        return $this->wasHere;
    }

    /**
     * @return bool
     */
    public function isMarried()
    {
        return ($this->getBride() != 0);
    }

    /**
     * @return bool
     */
    public function isGamebanned()
    {
        return (!in_array($this->gameban, [176, 184, 0]));
    }

    /**
     * @return int|mixed
     */
    public function getGameban()
    {
        return $this->gameban;
    }

    /**
     * @return int
     */
    public function getRank()
    {
        return ($this->flag0 & 7);
    }

    /**
     * @return bool
     */
    public function isGuest()
    {
        return ($this->getRank() == 0);
    }

    /**
     * @return bool
     */
    public function isMain()
    {
        return ($this->getRank() == 1);
    }

    /**
     * @return bool
     */
    public function isOwner()
    {
        return ($this->getRank() == 4);
    }

    /**
     * @return bool
     */
    public function isMod()
    {
        return ($this->getRank() == 2);
    }

    /**
     * @return bool
     */
    public function isMember()
    {
        return ($this->getRank() == 3);
    }

    /**
     * @return bool
     */
    public function isBanned()
    {
        return (($this->flag0 & 1 << 4) != 0);
    }

    /**
     * @return bool
     */
    public function hasDays()
    {
        return ((($this->flag0 & 1 << 5) != 0) || (($this->qflags & 2) != 0));
    }

    /**
     * @return bool
     */
    public function isForever()
    {
        return (($this->flag0 & 1 << 6) != 0);
    }

    /**
     * @return bool
     */
    public function isRegistered()
    {
        return !empty($this->regname);
    }

    /**
     * @return bool
     */
    public function isGagged()
    {
        return (($this->flag0 & 1 << 8) != 0);
    }

    /**
     * @return bool
     */
    public function isSinBin()
    {
        return (($this->flag0 & 1 << 9) != 0);
    }

    /**
     * @return bool
     */
    public function isInvisible()
    {
        return (($this->flag0 & 1 << 10) != 0);
    }

    /**
     * @return bool
     */
    public function isMobile()
    {
        return !$this->onXat();
        //return (($this->flag0 & 1 << 11) != 0); "outdated mobile pawn not used anymore
    }

    /**
     * @return bool
     */
    public function onXat()
    {
        return (($this->qflags & 1) != 0);
    }

    /**
     * @return bool
     */
    public function isBannished()
    {
        return (($this->flag0 & 1 << 12) != 0);
    }

    /**
     * @return bool
     */
    public function isBot()
    {
        return (($this->flag0 & 1 << 13) != 0);
    }

    /**
     * @return bool
     */
    public function isAway()
    {
        return (($this->flag0 & 1 << 14) != 0);
    }

    /**
     * @return bool
     */
    public function isDunced()
    {
        return (($this->flag0 & 1 << 15) != 0);
    }

    /**
     * @return bool
     */
    public function isTyping()
    {
        return (($this->flag0 & 1 << 16) != 0);
    }

    /**
     * @return bool
     */
    public function isZipped()
    {
        return (($this->flag0 & 1 << 17) != 0);
    }

    /**
     * @return bool
     */
    public function isReverseBanned()
    {
        return (($this->flag0 & 1 << 17) != 0);
    }

    /**
     * @return bool
     */
    public function isBadged()
    {
        return (($this->flag0 & 1 << 18) != 0);
    }

    /**
     * @return bool
     */
    public function isNaughty()
    {
        return (($this->flag0 & 1 << 19) != 0);
    }

    /**
     * @return bool
     */
    public function isYellowCarded()
    {
        return (($this->flag0 & 1 << 20) != 0);
    }

    /**
     * @return bool
     */
    public function isBFF()
    {
        return (($this->aflags & 1) != 0);
    }

    /**
     * @return bool
     */
    public function isRedCarded()
    {
        return (($this->aflags & 1 << 21) != 0);
    }

    /**
     * @return bool
     */
    public function hasGifts()
    {
        return (($this->aflags & 1 << 24) != 0);
    }

    /**
     * @return bool
     */
    public function isCelebrity()
    {
        return (($this->aflags & 1 << 71) != 0);
    }

    /**
     * @param $packet
     * @return void
     */
    public function setPowers($packet)
    {
        for ($i = 0; $i < Powers::getMaxPowerIndex(); $i++) {
            $this->powers[$i] = $packet['p' . $i] ?? 0;
        }
    }

    /**
     * @param $packet
     * @return void
     */
    public function setMaskedPowers($packet)
    {
        for ($i = 0; $i < Powers::getMaxPowerIndex(); $i++) {
            $this->maskedpowers[$i] = isset($packet['p' . $i]) ? $packet['p' . $i] - $this->powers[$i] : 0;
        }
    }

    /**
     * @param $info
     * @return void
     */
    public function setDoubles($info)
    {
        $this->doubles = $info;
    }

    /**
     * @param $xats
     * @return void
     */
    public function setXats($xats)
    {
        $this->xats = (int)$xats;
    }

    /**
     * @param $days
     * @return void
     */
    public function setDays($days)
    {
        $this->days = (int)$days;
    }

    /**
     * @param $id
     * @param $masked
     * @return bool
     */
    public function hasPower($id, $masked = false)
    {
        if (!$this->hasDays()) {
            return false;
        }

        $id = (int)$id;
        $index = (int)($id / 32);
        $bit = (int)($id % 32);

        if ($masked) {
            return (isset($this->maskedpowers[$index]) && ($this->maskedpowers[$index] & (1 << $bit)));
        }

        return (isset($this->powers[$index]) && ($this->powers[$index] & (1 << $bit)));
    }

    /**
     * @return int|mixed
     */
    public function getLoginTimestamp()
    {
        return $this->login;
    }

    /**
     * @return int|mixed
     */
    public function getFlag()
    {
        return $this->flag0;
    }

    /**
     * @return int|mixed
     */
    public function getRev()
    {
        return $this->rev;
    }
}
