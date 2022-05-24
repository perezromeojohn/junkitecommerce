<div class="wrap-icon-section wishlist">
    <a href="{{route('product.wishlist')}}" class="link-direction">
        <i class="fa fa-heart" style="color: #ff5a00" aria-hidden="true"></i>
        <div class="left-info">
            @if(Cart::instance('wishlist')->count() > 0)
                <span class="index" style="background-color: #ff5a00 !important; ">{{Cart::instance('wishlist')->count()}} items</span>
            @endif
            @if(Cart::instance('wishlist')->count()==0)
                <span class="index">no items</span>
            @endif
            <span class="title">Wishlist</span>
        </div>
    </a>
</div>