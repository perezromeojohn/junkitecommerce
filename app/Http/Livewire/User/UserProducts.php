<?php

namespace App\Http\Livewire\User;

use App\Models\UserProduct;
use Livewire\Component;

class UserProducts extends Component
{
    public function render()
    {
        $products = UserProduct::paginate(10);
        return view('livewire.user.user-products',['products'=>$products])->layout('layouts.base');
    }
}
