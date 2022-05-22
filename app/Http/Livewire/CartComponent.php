<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Cart;

class CartComponent extends Component
{
    public $haveCouponCode;
    public $couponCode;

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

    public function switchToStashForLater($rowId) {
        $item = Cart::instance('cart')->get($rowId);
        Cart::instance('cart')->remove($rowId);
        Cart::instance('saveForStash')->add($item->id, $item->name, 1, $item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component', 'refreshComponent');
        session()->flash('success_message', 'Product moved to stash successfully!');
    }

    public function moveToCart($rowId) {
        $item = Cart::instance('saveForStash')->get($rowId);
        Cart::instance('saveForStash')->remove($rowId);
        Cart::instance('cart')->add($item->id, $item->name, 1, $item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component', 'refreshComponent');
        session()->flash('s_success_message', 'Product moved to cart successfully!');
    }

    public function deleteFromStashForLater($rowId) {
        Cart::instance('saveForStash')->remove($rowId);
        session()->flash('s_success_message', 'Product removed from stash successfully!');
        $this->emitTo('cart-count-component', 'refreshComponent');
    }

    public function applyCouponCode() {
        $coupon = Coupon::where('code', $this->couponCode)->first();
    }

    public function render()
    {
        return view('livewire.cart-component')->layout("layouts.base");
    }
}
