<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Clean Table
        DB::delete('delete from menu');

        //Add Table
        DB::insert('insert into menu (id, nombre) values (?, ?)', [1, 'Inicio']);
        DB::insert('insert into menu (id, nombre) values (?, ?)', [2, 'Nuevo']);
        DB::insert('insert into menu (id, nombre) values (?, ?)', [3, 'Ingreso']);
    }
}
