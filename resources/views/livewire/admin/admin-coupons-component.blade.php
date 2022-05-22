<div>
    <div class="container" style="padding:30px">
        <div class="row">
            <div class="col-md-">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6"><h5>All Coupons</h5></div>
                            <div class="col-md-6">
                                <a href="{{route('admin.addcoupons')}}" class="btn btn-success pull-right">Add Coupons</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        @if(Session::has('message'))
                            <div class="alert alert-success" role="alert">
                                {{Session::get('message')}}
                            </div>
                        @endif
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Coupon Code</th>
                                    <th>Coupon Type</th>
                                    <th>Coupon Value</th>
                                    <th>Coupon Cart Value</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($coupons as $coupon)
                                    <tr>
                                        <td>{{$coupon->id}}</td>
                                        <td>{{$coupon->code}}</td>
                                        <td>{{$coupon->type}}</td>
                                        @if($coupon->type == 'fixed')
                                            <td>{{$coupon->value}}</td>
                                        @else
                                            <td>{{$coupon->value}}%</td>
                                        @endif
                                        <td>{{$coupon->cart_value}}</td>
                                        <td>
                                            <a href="{{route('admin.editcoupons',['coupon_id'=>$coupon->id])}}"><i style="color: green;" class="fa fa-pencil fa-2x"></i></a>
                                            <a href="#" onclick="confirm('Delete the Coupon?') || event.stopImmediatePropagation()" wire:click.prevent="deleteCoupon({{$coupon->id}})"><i style="margin-left: 10px;" class="fa fa-trash fa-2x text-danger"></i></a>
                                        </td>
                                    </tr>
                                    @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
