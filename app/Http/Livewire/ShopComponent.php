<?php

namespace App\Http\Livewire;

use App\Models\Product;
use Livewire\Component;
use Livewire\withPagination;
use Cart;

class ShopComponent extends Component
{
    public function store($product_id, $product_name, $product_price) {
        Cart::add($product_id, $product_name,1, $product_price)->associate('App\Models\Product');
        session()->flash('success_message', 'Product added to cart successfully!');
        return redirect()->route('product.cart');
    }

    use withPagination;
    public function render()
    {
        $products = Product::paginate(12);
        return view('livewire.shop-component', ['products'=> $products])->layout("layouts.base");
    }
}
