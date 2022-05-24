<main id="main" class="main-site left-sidebar">

    <div class="container">

        <div class="wrap-breadcrumb">
            <ul>
                <li class="item-link"><a href="#" class="link">home</a></li>
                <li class="item-link"><span>Shop</span></li>
            </ul>
        </div>
        <div class="row">

            <div class="col-lg-9 col-md-8 col-sm-8 col-xs-12 main-content-area">

                <div class="banner-shop">
                        <figure><img src="{{ asset('assets/images/wishlist.jpg') }}" alt=""></figure>
                </div>

                <div class="wrap-shop-control">

                    <h1 class="shop-title">Your Wishlist</h1>

                </div><!--end wrap shop control-->

                <style>
                    .product-wish {
                        position: absolute;
                        top: 10%;
                        left: 10%;
                        z-index: 9;
                        text-align: left;
                        padding-top: 0;
                    }
                    .product-wish .fa {
                        color: #cbcbcb;
                        font-size: 16px;
                    }
                    .product-wish .fa:hover {
                        color:#ff5a00;
                    }
                    .fill-heart {
                        color:#ff5a00 !important;
                    }
                </style>
                <div class="row">
                    @if(Cart::instance('wishlist')->content()->count() > 0)
                    <ul class="product-list grid-products equal-container">
                        @foreach (Cart::instance('wishlist')->content() as $item)
                        <li class="col-lg-4 col-md-6 col-sm-6 col-xs-6 ">
                            <div class="product product-style-3 equal-elem ">
                                <div class="product-thumnail">
                                    <a href="{{route('product.details',['slug'=>$item->model->slug])}}" title="{{ $item->model->name }}">
                                        <figure><img style="width: 220px; height: 220px; object-fit: cover" src="{{ asset('assets/images/products') }}/{{ $item->model->image }}" alt="{{ $item->model->name }}"></figure>
                                    </a>
                                </div>
                                <div class="product-info">
                                    <a href="{{route('product.details',['slug'=>$item->model->slug])}}" class="product-name"><span>{{ $item->model->name }}</span></a>
                                    <div class="wrap-price"><span class="product-price">₱{{ $item->model->regular_price}}</span></div>
                                    <a href="#" class="btn add-to-cart" wire:click.prevent="moveProductToCart('{{$item->rowId}}')">Move To Cart</a>
                                    <div class="product-wish">
                                        <a href="#" wire:click.prevent="removeFromWishlist({{$item->model->id}})"><i class="fa fa-heart fill-heart"></i></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                    @else
                        <div class="banner-shop">
                            <center>
                                <img style="margin-top: 40px" src="{{ asset('assets/images/empty.png') }}" alt="">
                                <h4>Your Wishlist is empty</h4>
                                <a href="/shop" class="btn btn-primary" style="background: #36a57c; border: 1px solid #36a57c;">Shop Now!</a>
                            </center>
                        </div>
                    @endif
        
                </div>
            </div><!--end main products area-->

            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 sitebar">
                <div class="widget mercado-widget categories-widget">
                    <h2 class="widget-title">All Categories</h2>
                    <div class="widget-content">
                        <ul class="list-category">
                            @foreach ($categories as $category)
                            <li class="category-item">
                                <a href="{{route('product.category',['category_slug'=>$category->slug])}}" class="cate-link">{{$category->name}}</a>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div><!-- Categories widget-->

                <div class="widget mercado-widget widget-product">
                    <h2 class="widget-title">Featured Products</h2>
                    <div class="widget-content" wire:ignore>
                        <ul class="products">
                            @foreach ($featured_products as $pproduct)
                            <li class="product-item">
                                <div class="product product-widget-style">
                                    <div class="thumbnnail">
                                        <a href="{{route('product.details',['slug'=>$pproduct->slug])}}" title="{{$pproduct->name}}">
                                            <figure><img src="{{ asset('assets/images/products/') }}\{{$pproduct->image}}" alt=""></figure>
                                        </a>
                                    </div>
                                    <div class="product-info">
                                        <a href="{{route('product.details',['slug'=>$pproduct->slug])}}" class="product-name"><span>{{$pproduct->name}}</span></a>
                                        <div class="wrap-price"><span class="product-price">${{$pproduct->regular_price}}</span></div>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <!-- featured products widget-->

                <div class="widget mercado-widget widget-product">
                    <h2 class="widget-title">Popular Products</h2>
                    <div class="widget-content" wire:ignore>
                        <ul class="products">
                            @foreach ($popular_products as $sproduct)
                            <li class="product-item">
                                <div class="product product-widget-style">
                                    <div class="thumbnnail">
                                        <a href="{{route('product.details',['slug'=>$sproduct->slug])}}" title="{{$sproduct->name}}">
                                            <figure><img src="{{ asset('assets/images/products/') }}\{{$sproduct->image}}" alt=""></figure>
                                        </a>
                                    </div>
                                    <div class="product-info">
                                        <a href="{{route('product.details',['slug'=>$sproduct->slug])}}" class="product-name"><span>{{$sproduct->name}}</span></a>
                                        <div class="wrap-price"><span class="product-price">${{$sproduct->regular_price}}</span></div>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div><!-- popular products widget-->

            </div><!--end sitebar-->

        </div><!--end row-->

    </div><!--end container-->

</main>
