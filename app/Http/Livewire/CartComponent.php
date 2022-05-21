<?php

namespace App\Http\Livewire;

use App\Models\Coupon;
use Livewire\Component;
use Cart;

class CartComponent extends Component
{
    public $haveCouponCode;
    public $couponCode;
    public $discount;
    public $subtotalAfterDiscount;
    public $taxAfterDiscount;
    public $totalAfterDiscount;

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

    public function applyCoupon() {
        $coupon = Coupon::where('code', $this->couponCode)->where('cart_value', '<=', Cart::instance('cart')->subtotal())->first();
        if(!$coupon) {
            session()->flash('coupon_message', 'Invalid coupon code!');
            return;
        }
        session()->put('coupon', [
            'code' => $coupon->code,
            'type' => $coupon->type,
            'value' => $coupon->value,
            'cart_value' => $coupon->cart_value
        ]);
    }

    public function calculateDiscount() {

        if(session()->has('coupon')) {
            if(session()->has('coupon')['type'] == 'fixed') {
                $this->discount = session()->get('coupon')['value'];
            } else {
                $this->discount = (Cart::instance('cart')->subtotal() * session()->get('coupon')['value']) / 100;
            }
            $this->subtotalAfterDiscount = Cart::instance('cart')->subtotal() - $this->discount;
            $this->taxAfterDiscount = ($this->subtotalAfterDiscount * config('cart.tax')) / 100;
            $this->totalAfterDiscount = $this->subtotalAfterDiscount + $this->taxAfterDiscount;
        }
    }

    public function render()
    {
        if(session()->has('coupon')) {
            if(Cart::instance('cart')->subtotal() < session()->get('coupon')['cart_value']) {
                session()->forget('coupon');
            } else {
                $this->calculateDiscount();
            }
        }
        return view('livewire.cart-component')->layout("layouts.base");
    }
}
