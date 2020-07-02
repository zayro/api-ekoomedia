<?php

namespace App\Http\Controllers;

use Log;


use Laravel\Lumen\Routing\Controller as BaseController;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;



use Dotenv\Dotenv;

use PDO;
use Exception;

class QueryController extends Controller
{
    public function conexion(){

        // Test database connection
        try {
            $pdo = DB::connection()->getPdo();
            return response()->json(["data" => $pdo, "status" => true, "message"=> "se conecto exitosamente"], 200);
        } catch (\Exception $e) {
            return response()->json(["data" => $e, "status" => false, "message"=> "Could not connect to the database.  Please check your configuration. error"], 500);
        }

    }

    public function getMenu()
    {
        try {
            $data = DB::select('select * from menu', []);
            return response()->json(["data" => $data, "status" => true, "message"=> "se consulto exitosamente"], 200);
        } catch (QueryException $e) {
            return response()->json(["data" => $e, "status" => false, "message"=> "ocurrio un error"], 500);
        }
    }

    public function AllInformation()
    {
        try {
            $data = DB::select('select * from informacion', []);
            return response()->json(["data" => $data, "status" => true, "message"=> "se consulto exitosamente."], 200);
        } catch (QueryException $e) {
            return response()->json(["data" => $e, "status" => false, "message"=> "ocurrio un error"], 500);
        }
    }

    public function GuardaInformacion(Request $request)
    {
        $rule = [
            'nombre' => 'required',
            'email' => 'required',
            'celular' => 'required',
            'edad' => 'required'
        ];

        $validator = Validator::make($request->all(), $rule);


        if ($validator->fails()) {
            $errors = $validator->errors();
            return response()->json(["data" => $errors, "status" => false, "message"=> "ocurrio un problema en la validacion"], 500);
        }


        $nombre = $request->input('nombre');
        $email = $request->input('email');
        $celular = $request->input('celular');
        $edad = $request->input('edad');


        $nick = explode("@", $email);
        $nickname = $nick[0];


        try {
            $data = DB::insert('insert into informacion (nombre, email, celular, edad, nickname) values (?, ?, ?, ?, ?)', [ "$nombre", "$email", "$celular", "$edad", "$nickname"]);
            return response()->json(["data" => $data, "status" => true, "message"=> "se agrego exitosamente"], 200);
        } catch (QueryException $e) {
            return response()->json(["data" => $e, "status" => false, "message"=> "ocurrio un error"], 500);
        }
    }
}
