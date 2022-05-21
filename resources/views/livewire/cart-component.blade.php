<main id="main" class="main-site">

    <div class="container">

        <div class="wrap-breadcrumb">
            <ul>
                <li class="item-link"><a href="/" class="link">home</a></li>
                <li class="item-link"><span>Cart</span></li>
            </ul>
        </div>
        <div class="main-content-area">
            <div class="container-fluid banner-shop">
                <figure style="margin-top: 20px; margin-bottom: 20px;"><img class="center-block" src="{{ asset('assets/images/cart.jpg') }}" alt=""></figure>
            </div>

            <div class="wrap-iten-in-cart">
                @if(Session::has('success_message'))
                <div class="alert alert-success">
                    <strong>Success!</strong>
                    {{ Session::get('success_message') }}
                </div>
                @endif
                @if(Cart::instance('cart')->count() > 0)
                <h3 class="box-title">Products Name</h3>
                <ul class="products-cart">
                    @foreach (Cart::instance('cart')->content() as $item)
                    <li class="pr-cart-item">
                        <div class="product-image">
                            <figure><img src="{{ asset('assets/images/products/') }}\{{$item->model->image}}" alt="{{$item->model->name}}"></figure>
                        </div>
                        <div class="product-name">
                            <a class="link-to-product" href="{{route('product.details',['slug'=>$item->model->slug])}}">{{$item->model->name}}</a>
                        </div>
                        <div class="price-field produtc-price"><p class="price">₱ {{$item->model->regular_price}}</p></div>
                        <div class="quantity">
                            <div class="quantity-input">
                                <input type="text" disabled="disabled" name="product-quatity" value="{{$item->qty}}" data-max="120" pattern="[0-9]*" >									
                                <a class="btn btn-increase" href="#" wire:click.prevent="increaseQuantity('{{$item->rowId}}')"></a>
                                <a class="btn btn-reduce" href="#"  wire:click.prevent="decreaseQuantity('{{$item->rowId}}')"></a>
                            </div>
                        </div>
                        <div class="price-field sub-total"><p class="price">₱ {{$item->subtotal}}</p></div>
                        <div class="delete">
                            <a href="#" class="btn btn-delete" title="" wire:click.prevent="deleteItem('{{$item->rowId}}')">
                                <span>Delete from your cart</span>
                                <i class="fa fa-times-circle" aria-hidden="true"></i>
                            </a>
                        </div>
                    </li>
                    @endforeach											
                </ul>
                @else
                <div class="alert alert-danger">
                    <strong>No Items in Cart!</strong>
                    <a href="/shop">Go Back to Shop</a>
                </div>
                @endif
            </div>

            <div class="summary">
                <div class="order-summary">
                    <h4 class="title-box">Order Summary</h4>
                    <p class="summary-info"><span class="title">Subtotal</span><b class="index">{{Cart::instance('cart')->subtotal()}}</b></p>
                    @if(Session::has('coupon'))
                        <p class="summary-info"><span class="title">Discount ({{Session::get('coupon')['code']}})</span><b class="index">${{$discount}}</b></p>
                        <p class="summary-info"><span class="title">Tax ({{config('cart.tax')}}%)</span><b class="index">${{$taxAfterDiscount}}</b></p>
                        <p class="summary-info"><span class="title">Subtotal with Discount</span><b class="index">${{$subTotalAfterDiscount}}</b></p>
                        <p class="summary-info total-info "><span class="title">Total</span><b class="index">${{$totalAfterDiscount}}</b></p>
                    @else
                        <p class="summary-info"><span class="title">Tax</span><b class="index">{{Cart::instance('cart')->tax()}}</b></p>
                        <p class="summary-info"><span class="title">Shipping</span><b class="index">Free Shipping</b></p>
                        <p class="summary-info total-info "><span class="title">Total</span><b class="index">${{Cart::instance('cart')->total()}}</b></p>
                    @endif
                </div>
                @if(!Session::has('coupon'))
                    <div class="checkout-info">
                        <label class="checkbox-field">
                            <input class="frm-input " name="have-code" id="have-code" value="1" type="checkbox" wire:model="haveCouponCode"><span>I have promo code</span>
                        </label>
                        @if($haveCouponCode == 1)
                        <div class="summary-item">
                            <form wire:submit="applyCoupon">
                                <h4 class="title-box">Coupon</h4>
                                @if(Session::has('coupon_message'))
                                <div class="alert alert-danger">
                                    <strong>Error!</strong>
                                    {{ Session::get('coupon_message') }}
                                @endif
                                <p class="row-in-form">
                                    <label for="coupon-code">Enter coupon code</label>
                                    <input class="frm-input" name="code" id="code" value="" type="text" wire:model="couponCode">
                                </p>
                                <button type="submit" class="btn btn-small">Apply</button>
                            </form>
                        </div>
                        @endif
                    @endif
                    <a class="btn btn-checkout" href="checkout.html">Check out</a>
                    <a class="link-to-shop" href="shop.html">Continue Shopping<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></a>
                </div>
                <div class="update-clear">
                    <a class="btn btn-clear" href="#" wire:click.prevent="deleteAll()">Clear Shopping Cart</a>
                    <a class="btn btn-update" href="#">Update Shopping Cart</a>
                </div>
            </div>

        </div><!--end main content area-->
    </div><!--end container-->

</main>