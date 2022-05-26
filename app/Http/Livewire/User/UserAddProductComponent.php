<?php

namespace App\Http\Livewire\User;

use App\Models\Category;
use App\Models\Product;
use Carbon\Carbon;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithFileUploads;

class UserAddProductComponent extends Component
{
    use WithFileUploads;
    public $name;
    public $slug;
    public $short_description;
    public $description;
    public $regular_price;
    public $sale_price;
    public $SKU;
    public $stock_status;
    public $featured;
    public $condition;
    public $quantity;
    public $image;
    public $category_id;

    public function mount()
    {
        $this->stock_status = 'instock';
        $this->featured = 0;
    }

    public function generateslug() {
        $this->slug = Str::slug($this->name);
    }

    public function addProduct() {
        $product = new Product();
        $product->name = $this->name;
        $product->slug = $this->slug;
        $product->short_description = $this->short_description;
        $product->description = $this->description;
        $product->regular_price = $this->regular_price;
        $product->sale_price = $this->sale_price;
        $product->SKU = $this->SKU;
        $product->stock_status = $this->stock_status;
        $product->featured = $this->featured;
        $product->condition = $this->condition;
        $product->quantity = $this->quantity;
        $imageName = Carbon::now()->timestamp . '_' . $this->image->extension();
        $this->image->storeAs('products', $imageName);
        $product->image = $imageName;
        $product->category_id = $this->category_id;
        $product->save();
        session()->flash('message', 'Product added successfully');
    }

    public function render()
    {
        $categories = Category::all();
        return view('livewire.user.user-add-product-component',['categories'=>$categories])->layout('layouts.base');;
    }
}
