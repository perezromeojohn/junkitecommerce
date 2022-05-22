<?php

namespace App\Http\Livewire;

use App\Models\Coupon;
use Livewire\Component;
use Cart;
use Illuminate\Support\Facades\Auth;

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
        $coupon = Coupon::where('code', $this->couponCode)->where('cart_value', '<=', Cart::instance('cart')->subtotal())->first();
        if (!$coupon) {
            session()->flash('coupon_message', 'Invalid tix code!');
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
            if (session()->get('coupon')['type'] == 'fixed') {
                $this->discount = session()->get('coupon')['value'];
            } else {
                $this->discount = (Cart::instance('cart')->subtotal() * session()->get('coupon')['value']) / 100;
            }
            $this->subtotalAfterDiscount = Cart::instance('cart')->subtotal() - $this->discount;
            $this->taxAfterDiscount = ($this->subtotalAfterDiscount * config('cart.tax')) / 100;
            $this->totalAfterDiscount = $this->subtotalAfterDiscount + $this->taxAfterDiscount;
        }
    }

    public function removeCoupon() {
        session()->forget('coupon');
    }

    public function checkout() {
	if(Auth::check()) {
		return redirect()->route('checkout');            
	} else	{
		return redirect()->route('login');
	    }
    }
    public function setAmountForCheckout() {
        if(session()->has('coupom')) {
            session()->put('checkout', [
            'discount' => $this->discount,
			'subtotal' => $this->subtotalAfterDiscount,
			'tax' => $this->taxAfterDiscount,
			'total' => $this->totalAfterDiscount
            ]);
        } else {
            session()->put('checkout',[
                'discount' => 0,
                'subtotal' => Cart::instance('cart')->subtotal(),
                'tax' => Cart::instance('cart')->tax(),
                'total' => Cart::instance('cart')->total()
            ]);
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
        $this->setAmountForCheckout();

        return view('livewire.cart-component')->layout("layouts.base");
    }
}
