<?php

namespace App\Http\Controllers\Landing;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Bot;
use App\Models\Log;
use App\Models\Command;
use App\Utilities\LineCounter;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$lineCounter = new LineCounter('/opt/xatbot-Bot/src/');
        //$totalLines = $lineCounter->totalLines();
        $totalLines = 0;
        $totalMessageHandled = Log::count();
        $totalCommands = Command::count();
        $totalBots = Bot::count();

        return view('landing.home')->with(
            [
                'totalLines' => $totalLines,
                'totalMessageHandled' => $totalMessageHandled,
                'totalCommands' => $totalCommands,
                'totalBots' => $totalBots,
            ]
        );
    }
}
