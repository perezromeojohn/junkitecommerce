<?php

namespace App\Http\Livewire;

use App\Models\Category;
use App\Models\Product;
use Livewire\Component;
use Cart;

class WishListComponent extends Component
{
    public function removeFromWishlist($product_id) {
        foreach(Cart::instance('wishlist')->content() as $wishitems) {
            if($wishitems->id == $product_id) {
                Cart::instance('wishlist')->remove($wishitems->rowId);
                $this->emitTo('wishlist-count-component', 'refreshComponent');
                return;
            }
        }
    }

    public function moveProductToCart($rowId) {
        $item = Cart::instance('wishlist')->get($rowId);
        Cart::instance('wishlist')->remove($rowId);
        Cart::instance('cart')->add($item->id, $item->name,1, $item->price)->associate('App\Models\Product');
        $this->emitTo('wishlist-count-component', 'refreshComponent');
        $this->emitTo('cart-count-component', 'refreshComponent');
    }
    public function render()
    {
        $categories = Category::all();
        $featured_products = Product::where('featured','==',1)->inRandomOrder()->limit(4)->get();
        $popular_products = Product::inRandomOrder()->limit(6)->get();
        return view('livewire.wish-list-component',['featured_products'=>$featured_products,'popular_products'=>$popular_products,'categories'=>$categories])->layout("layouts.base");
    }
}
