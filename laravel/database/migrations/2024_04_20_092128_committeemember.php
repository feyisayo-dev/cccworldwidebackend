<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('committemember', function (Blueprint $table) {
            $table->id();
            $table->string('committeRefno');
            $table->string('committeName');
            $table->string('memberId');
            $table->string('memberName');
            $table->string('memberRole');
            $table->string('roleId');
            $table->string('roleName');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('committemember');
    }
};
