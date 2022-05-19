<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Cart;

class CartComponent extends Component
{
    public function increaseQuantity($rowId) {
        $product = Cart::instance('cart')->get($rowId);
        $qty = $product->qty + 1;
        Cart::instance('cart')->update($rowId, $qty);
        $this->emitTo('cart-count-component', 'refreshComponent');
    }

    public function decreaseQuantity($rowId) {
        $product = Cart::instance('cart')->get($rowId);
        $qty = $product->qty - 1;
        Cart::instance('cart')->update($rowId, $qty);
        $this->emitTo('cart-count-component', 'refreshComponent');
    }

    public function deleteItem($rowId) {
        Cart::instance('cart')->remove($rowId);
        session()->flash('success_message', 'Product removed from cart successfully!');
        $this->emitTo('cart-count-component', 'refreshComponent');
    }


    public function deleteAll() {
        Cart::instance('cart')->destroy();
        session()->flash('success_message', 'All products removed from cart successfully!');
        $this->emitTo('cart-count-component', 'refreshComponent');
    }

    public function render()
    {
        return view('livewire.cart-component')->layout("layouts.base");
    }
}
