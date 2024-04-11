<?php

namespace App\Http\Controllers\Staff;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Language;
use App\Models\BotlangSentences;


class TranslateBotMessagesController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function show()
    {
        $botmessages = BotlangSentences::orderby('id', 'asc');
        $languages = Language::all();

        return view('staff.translatebotmessages')
            ->with('botmessages', $botmessages)
            ->with('languages', $languages);
    }
}
