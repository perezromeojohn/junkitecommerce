<?php

namespace App\Http\Livewire\Admin;

use App\Models\Order;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class AdminOrderPendingComponent extends Component
{
    public function updateOrderStatus($order_id, $status)
    {
        $order = Order::find($order_id);
        $order->status = $status;
        if($status == 'delivered'){
            $order->delivered_date = DB::raw('CURRENT_TIMESTAMP');
        } else if ($status == 'cancelled'){
            $order->canceled_date = DB::raw('CURRENT_TIMESTAMP');
        }
        $order->save();
        session()->flash('order_message', 'Order status updated successfully');
        


    }
    public function render()
    {
        $orders = Order::where('status', 'processing')->paginate(12);
        return view('livewire.admin.admin-order-pending-component',['orders'=>$orders])->layout('layouts.base');
    }
}
