<?php

namespace App\Http\Livewire\User;

use App\Models\Product;
use Livewire\Component;
use Livewire\WithPagination;

class UserPostProductComponent extends Component
{
    use WithPagination;
    
    public function deleteProduct($id) {
        $product = Product::find($id);
        $product->delete();
        session()->flash('message', 'Product deleted successfully');
    }
    
    public function render()
    {
        $products = Product::paginate(10);
        return view('livewire.user.user-post-product-component',['products'=>$products])->layout('layouts.base');
    }
}
