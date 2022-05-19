<div class="wrap-icon-section minicart">
    <a href="{{route('product.cart')}}" class="link-direction">
        <i class="fa fa-shopping-basket" style="color: #36a57c" aria-hidden="true"></i>
        <div class="left-info">
            @if(Cart::instance('cart')->count()>0)
                <span class="index">{{Cart::count()}} items</span>
            @endif
            @if(Cart::instance('cart')->count()==0)
                <span class="index">no items</span>
            @endif
            <span class="title">CART</span>
        </div>
    </a>
</div>