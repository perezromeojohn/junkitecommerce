<main id="main" class="main-site">
    <style>
        .regularprice {
            font-weight: 300px;
            font-siz: 13px !important;
            color: #aaaaaa;
            text-decoration: line-through;
            padding-left: 10px;
        }
    </style>
    <div class="container">

        <div class="wrap-breadcrumb">
            <ul>
                <li class="item-link"><a href="/" class="link">home</a></li>
                <li class="item-link"><span>detail</span></li>
                <li class="item-link"><span><b>{{$product->name}}</b></span></li>
            </ul>
        </div>
        <div class="row">

            <div class="col-lg-9 col-md-8 col-sm-8 col-xs-12 main-content-area">
                <div class="wrap-product-detail">
                    <div class="detail-media">
                        <div class="product">
                          <ul class="slides">

                            <li data-thumb="{{ asset('assets/images/products') }}/{{$product->image}}">
                                <img style="width: 470px; height: 470px; object-fit: cover" src="{{ asset('assets/images/products') }}/{{$product->image}}" alt="/{{$product->name}}" />
                            </li>

                          </ul>
                        </div>
                    </div>
                    <div class="detail-info">
                        <h2 class="product-name">{{$product->name}}</h2>
                        <div class="short-desc">
                            {{$product->short_description}}
                        </div>
                        @if($product->sale_price > 0 && $sale->status == 1 && $sale->sale_date > Carbon\Carbon::now())
                            <div class="wrap-price"><span class="product-price">₱ {{$product->sale_price}}</span></div>
                            <del><span class="product-price regularprice">₱ {{$product->regular_price}}</span></del>
                        @else
                            <div class="wrap-price"><span class="product-price">₱ {{$product->regular_price}}</span></div>
                        @endif
                        <div class="stock-info in-stock">
                            @if($product->stock_status == 'instock')
                            <p class="availability">Availability: <b>Instock</b></p>
                            @else
                            <p class="availability">Availability: <b>Out of Stock</b></p>
                            @endif
                        </div>
                        <div class="quantity">
                            <span>Quantity:</span>
                            <div class="quantity-input">
                                <input type="text" name="product-quatity" value="1" data-max="120" pattern="[0-9]*" wire:model="qty" >
                                
                                <a class="btn btn-reduce" wire:click.prevent="decreaseQuantity" href="#"></a>
                                <a class="btn btn-increase" href="#" wire:click.prevent="increaseQuantity" ></a>
                            </div>
                        </div>
                        <div class="wrap-butons">
                            @if($product->sale_price > 0 && $sale->status == 1 && $sale->sale_date > Carbon\Carbon::now())
                                <a href="#" class="btn add-to-cart" wire:click.prevent="store({{$product->id}},'{{$product->name}}',{{$product->sale_price}})">Add to Cart</a>
                            @else
                            <a href="#" class="btn add-to-cart" wire:click.prevent="store({{$product->id}},'{{$product->name}}',{{$product->regular_price}})">Add to Cart</a>
                            @endif
                        </div>
                    </div>
                    <div class="advance-info">
                        <div class="tab-control normal">
                            <a href="#description" class="tab-control-item active">Description</a>
                        </div>
                        <div class="tab-contents">
                            <div class="tab-content-item active" id="description">
                                {{$product->description}}
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--end main products area-->

            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 sitebar">
                <div class="widget widget-our-services ">
                    <div class="widget-content">
                        <ul class="our-services">

                            <li class="service">
                                <a class="link-to-service" href="#">
                                    <i class="fa fa-truck" aria-hidden="true"></i>
                                    <div class="right-content">
                                        <b class="title">Free Shipping</b>
                                        <span class="subtitle">Yepp Free Shipping</span>
                                        <p class="desc">free shipping free shippuing omg</p>
                                    </div>
                                </a>
                            </li>

                            <li class="service">
                                <a class="link-to-service" href="#">
                                    <i class="fa fa-tree" aria-hidden="true"></i>
                                    <div class="right-content">
                                        <b class="title">Help The Environent</b>
                                        <span class="subtitle">Trees more Trees</span>
                                        <p class="desc">Trees Trees Trees Trees</p>
                                    </div>
                                </a>
                            </li>

                            <li class="service">
                                <a class="link-to-service" href="#">
                                    <i class="fa fa-dropbox" aria-hidden="true"></i>
                                    <div class="right-content">
                                        <b class="title">Order Return</b>
                                        <span class="subtitle">Return within 7 days</span>
                                        <p class="desc">Return it man</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div><!-- Categories widget-->

                <div class="widget mercado-widget widget-product">
                    <h2 class="widget-title">Popular Products</h2>
                    <div class="widget-content">
                        <ul class="products">
                            @foreach($popular_products as $p_product)
                            <li class="product-item">
                                <div class="product product-widget-style">
                                    <div class="thumbnnail">
                                        <a href="{{route('product.details',['slug'=>$p_product->slug])}}" title="{{$p_product->name}}">
                                            <figure><img src="{{ asset('assets/images/products/') }}/{{$p_product->image}}" alt="{{$p_product->name}}"></figure>
                                        </a>
                                    </div>
                                    <div class="product-info">
                                        <a href="{{route('product.details',['slug'=>$p_product->slug])}}" title="{{$p_product->name}}" class="product-name"><span>{{$p_product->name}}</span></a>
                                        <div class="wrap-price"><span class="product-price">₱ {{$p_product->regular_price}}</span></div>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>

            </div><!--end sitebar-->

            <div class="single-advance-box col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="wrap-show-advance-info-box style-1 box-in-site">
                    <h3 class="title-box">Related Products</h3>
                    <div class="wrap-products">
                        <div class="products slide-carousel owl-carousel style-nav-1 equal-container" data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"2"},"768":{"items":"3"},"992":{"items":"3"},"1200":{"items":"5"}}' >
                            @foreach($related_products as $r_product)
                            <div class="product product-style-2 equal-elem ">
                                <div class="product-thumnail">
                                    <a href="{{route('product.details',['slug'=>$r_product->slug])}}" title="{{$r_product->name}}">
                                        <figure><img style="width:214px; height:214px; object-fit: cover" src="{{ asset('assets/images/products/') }}\{{$r_product->image}}" alt="{{$r_product->name}}"></figure>
                                    </a>
                                    <div class="group-flash">
                                        <span class="flash-item new-label">new</span>
                                    </div>
                                    <div class="wrap-btn">
                                        <a href="{{route('product.details',['slug'=>$r_product->slug])}}" class="function-link">quick view</a>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <a href="{{route('product.details',['slug'=>$r_product->slug])}}" class="product-name"><span>{{$r_product->name}}</span></a>
                                    <div class="wrap-price"><span class="product-price">₱ {{$r_product->regular_price}}</span></div>
                                </div>
                            </div>
                            @endforeach
                            

                        </div>
                    </div><!--End wrap-products-->
                </div>
            </div>

        </div><!--end row-->

    </div><!--end container-->

</main>