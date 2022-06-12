<div>
    <style>
        nav svg{
            height: 20px;
        }
        nav .hidden {
            display: block !important;
        }
    </style>
    <div class="container" style="padding:30px 0;">
        <div class="row">
            <div class="col-md 12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6">
                                All Product
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('user.addproduct')}}" class="btn btn-success pull-right">Add New</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        @if(Session::has('message'))
                            <div class="alert alert-success" role="alert">
                                {{Session::get('message')}}
                            </div>
                        @endif
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>image</th>
                                    <th>Name</th>
                                    <th>Stock</th>
                                    <th>Price</th>
                                    <th>Sale Price</th>
                                    <th>Category</th>
                                    <th>Condition</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products as $product)
                                    <tr>
                                        <td>{{$product->id}}</td>
                                        <td><img src="{{asset('assets/images/products')}}/{{$product->image}}" width="60" alt=""></td>
                                        <td>{{$product->name}}</td>
                                        <td>{{$product->stock_status}}</td>
                                        <td>{{$product->regular_price}}</td>
                                        <td>{{$product->sale_price}}</td>
                                        <td>{{$product->category->name}}</td>
                                        <td>{{$product->condition}}</td>
                                        <td>{{$product->created_at->format('F j Y')}}</td>
                                        <td>
                                            <a href="{{route('user.editproduct',['product_slug'=>$product->slug])}}"><i style="color: green;" class="fa fa-pencil fa-2x"></i></a>
                                            <a href="#" onclick="confirm('Delete the Product?') || event.stopImmediatePropagation()" wire:click.prevent="deleteProduct({{$product->id}})"><i style="margin-left: 10px;" class="fa fa-trash fa-2x text-danger"></i></a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{$products->links()}}
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</div>
