<?php

namespace App\Http\Controllers\Staff;

use App\Http\Controllers\Controller;
use Validator;
use App\Utilities\IPC;

use Illuminate\Http\Request;
use App\Models\Bot;
use App\Utilities\Xat;

class BotsController extends Controller
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

    public function showBots(Request $request)
    {
        $bots = Bot::orderBy('id', 'asc')->paginate(25);
        return view('staff.bots', compact('bots'));
    }

    public function actionBot(Request $request)
    {
        $data = $request->all();
        switch ($data['action']) {
            case 'start':
            case 'restart':
            case 'stop':
                $bot = Bot::find($data['botid']);

                IPC::init();
                IPC::connect(strtolower($bot->server->name) . '.sock');
                IPC::write(sprintf("%s %d", $data['action'], $data['botid']));
                IPC::read(1024);
                IPC::close();

                return response()->json(
                    [
                        'status' => 'success',
                        'message' => 'Botid ' . $data['botid'] . ' ' . $data['action'] .
                            (($data['action'] == 'stop') ? 'ped' : 'ed') . ' !'
                    ]
                );
                break;

            case 'edit':
                $bot = Bot::find($data['botid']);

                if (session('onBotEdit') == $bot->id) {
                    return response()->json(
                        [
                            'status' => 'error',
                            'message' => 'You are already editing this bot!'
                        ]
                    );
                }

                session(['onBotEdit' => $bot->id]);
                return response()->json(
                    [
                        'status' => 'success',
                        'message' => 'You are now editing botid: ' . $bot->id . ' as helper.'
                    ]
                );
                break;

            default:
                break;
        }
    }
}
