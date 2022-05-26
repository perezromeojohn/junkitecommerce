<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6">
                                <h4>Order Details</h3>
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.orders')}}" class="btn btn-success pull-right">All Orders</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <th>Order ID</th>
                            <td>{{$order->id}}</td>
                            <th>Order Date</th>
                            <td>{{$order->created_at}}</td>
                            <th>Order Status</th>
                            @if($order->status == 'ordered')
                                <td><span style="class="badge badge-secondary">{{$order->status}}</span></td>
                            @elseif ($order->status == 'processing')
                                <td><span style="background-color: blue" class="badge badge-secondary">{{$order->status}}</span></td>
                            @elseif($order->status == 'shipped')
                                <td><span style="background-color: orange" class="badge badge-secondary">{{$order->status}}</span></td>
                            @elseif($order->status == 'delivered')
                                <td><span style="background-color: green" class="badge badge-secondary">{{$order->status}}</span></td>
                            @elseif($order->status == 'cancelled')
                                <td><span class="badge badge-secondary">{{$order->status}}</span></td>
                            @endif
                            @if($order->status == 'delivered')
                                <th>Delivery Date</th>
                                <td>{{$order->delivered_date}}</td>
                            @elseif($order->status == 'cancelled')
                                <th>Cancel Date</th>
                                <td>{{$order->canceled_date}}</td>
                            @endif
                        </table>
                    </div>
                </div>
           
        </div>
        {{-- <div class="row">
            <div class="col-md-6">
                Order Details - ID #{{ $order->id }}
            </div>
            <div class="col-md-6">
               <a href="{{route('admin.orders')}}" class="btn btn-success pull-right">All Orders</a>
            </div>
        </div> --}}
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Ordered Items
                    </div>
                    <div class="panel-body">
                        <div class="wrap-iten-in-cart">
                            <h3 class="box-title">Products Name</h3>
                            <ul class="products-cart">
                                @foreach ($order->orderItems as $item)
                                <li class="pr-cart-item">
                                    <div class="product-image">
                                        <figure><img src="{{ asset('assets/images/products/') }}\{{$item->product->image}}" alt="{{$item->product->name}}"></figure>
                                    </div>
                                    <div class="product-name">
                                        <a class="link-to-product" href="{{route('product.details',['slug'=>$item->product->slug])}}">{{$item->product->name}}</a>
                                    </div>
                                    <div class="price-field produtc-price"><p class="price">₱ {{$item->price}}</p></div>
                                    <div class="quantity">
                                        <div class="price-field produtc-price"><p class="price">Quantity: {{$item->quantity}}</p></div>
                                    </div>
                                    <div class="price-field sub-total"><p class="price">₱ {{$item->price * $item->quantity}}</p></div>
                                </li>
                                @endforeach											
                            </ul>
                        </div>
                        <div class="summary">
                            <div class="order-summary">
                                <h4 class="title-box">Order Summary</h4>
                                <p class="summary-info"><span class="title">Subtotal</span><b class="index">₱{{$order->subtotal}}</b></p>
                                <p class="summary-info"><span class="title">Tax</span><b class="index">₱{{$order->tax}}</b></p>
                                <p class="summary-info"><span class="title">Shipping</span><b class="index">Free Shipping</b></p>
                                <p class="summary-info"><span class="title">Total</span><b class="index">₱{{$order->total}}</b></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Billing Details
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tr>
                                <style>
                                    th {
                                        color: #36a57c;
                                        font-weight: 800;
                                    }
                                </style>
                                <th>First Name</th>
                                <td>{{$order->firstname}}</td>
                                <th>Last Name</th>
                                <td>{{$order->lastname}}</td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td>{{$order->mobile}}</td>
                                <th>Email</th>
                                <td>{{$order->email}}</td>
                            </tr>
                            <tr>
                                <th>Address 1</th>
                                <td>{{$order->line1}}</td>
                                <th>Address 2</th>
                                <td>{{$order->line2}}</td>
                            </tr>
                            <tr>
                                <th>City</th>
                                <td>{{$order->city}}</td>
                                <th>Province</th>
                                <td>{{$order->province}}</td>
                            </tr>
                            <tr>
                                <th>Zipcoded</th>
                                <td>{{$order->zipcode}}</td>
                                <th>Country</th>
                                <td>{{$order->country}}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        @if($order->is_shipping_different)
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Shipping Details
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tr>
                                <style>
                                    th {
                                        color: #36a57c;
                                        font-weight: 800;
                                    }
                                </style>
                                <th>First Name</th>
                                <td>{{$order->shipping->firstname}}</td>
                                <th>Last Name</th>
                                <td>{{$order->shipping->lastname}}</td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td>{{$order->shipping->mobile}}</td>
                                <th>Email</th>
                                <td>{{$order->shipping->email}}</td>
                            </tr>
                            <tr>
                                <th>Line 1</th>
                                <td>{{$order->shipping->line1}}</td>
                                <th>Line 2</th>
                                <td>{{$order->shipping->line2}}</td>
                            </tr>
                            <tr>
                                <th>City</th>
                                <td>{{$order->shipping->city}}</td>
                                <th>Province</th>
                                <td>{{$order->shipping->province}}</td>
                            </tr>
                            <tr>
                                <th>Zipcoded</th>
                                <td>{{$order->shipping->zipcode}}</td>
                                <th>Country</th>
                                <td>{{$order->shipping->country}}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        @endif

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Transactions
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tr>
                                <th>Transaction Type</th>
                                @if($order->transaction->mode == 'cod')
                                <td><b>Cash on Delivery</b></td>
                                @endif
                            </tr>
                            <tr>
                                <th>Status</th>
                                <td>{{$order->transaction->status}}</td>
                            </tr>
                            <tr>
                                <th>Transaction Date</th>
                                <td>{{$order->transaction->created_at}}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
    </div>
</div>
</div>
