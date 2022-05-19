<?php

namespace App\Http\Livewire;

use App\Models\Product;
use Livewire\Component;
use Livewire\withPagination;
use Cart;
use App\Models\Category;

class SearchComponent extends Component
{

    public $sorting;
    public $pagesize;

    public $search;
    public $product_cat;
    public $product_cat_id;

    public $min_price, $max_price;

    public function mount() {
        $this->sorting = "default";
        $this->pagesize = 12;

        $this->min_price = 1;
        $this->max_price = 1000;
        
        $this->fill(request()->only('search', 'product_cat', 'product_cat_id'));
    }
    public function store($product_id, $product_name, $product_price) {
        Cart::add($product_id, $product_name,1, $product_price)->associate('App\Models\Product');
        session()->flash('success_message', 'Product added to cart successfully!');
        return redirect()->route('product.cart');
    }

    use withPagination;
    public function render()
    {
        if ($this->sorting=='date') {
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->where('name', 'like', '%'.$this->search.'%')->where('category_id', 'like','%'.$this->product_cat_id.'%')->orderBy('created_at', 'DESC')->paginate($this->pagesize);
        } else if ($this->sorting=='price') {
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->where('name', 'like', '%'.$this->search.'%')->where('category_id', 'like','%'.$this->product_cat_id.'%')->orderBy('regular_price', 'ASC')->paginate($this->pagesize);
        } else if ($this->sorting=='price-desc') {
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->where('name', 'like', '%'.$this->search.'%')->where('category_id', 'like','%'.$this->product_cat_id.'%')->orderBy('regular_price', 'DESC')->paginate($this->pagesize);
        } else {
            $products = Product::whereBetween('regular_price',[$this->min_price,$this->max_price])->where('name', 'like', '%'.$this->search.'%')->where('category_id', 'like','%'.$this->product_cat_id.'%')->paginate($this->pagesize);
        }

        $categories = Category::all();
        $featured_products = Product::where('featured','==',1)->inRandomOrder()->limit(4)->get();
        $popular_products = Product::inRandomOrder()->limit(6)->get();

        return view('livewire.search-component', ['products'=> $products, 'categories'=> $categories,'featured_products'=>$featured_products,'popular_products'=>$popular_products])->layout("layouts.base");
    }
}
