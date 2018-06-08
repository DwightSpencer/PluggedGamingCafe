
<style>
    input[type=text]:focus {
        background: lightyellow;
    }
</style>
<div class="row" style="padding-left: 20px">
    <a title="Table" class="btn btn-warning pay" data-toggle="modal" data-target="#modal"
       href="cashier/table">
        <b id="table_id">{{Session::has('table_id')?\App\Table::find(Session::get('table_id'))->name:'Table #'}}</b>
    </a>
    <a class="btn btn-primary pay"
       data-toggle="modal" data-target="#modal" href="cashier/change-table">
        Transfer
    </a>
    <a class="btn btn-primary pay" data-toggle="modal"
       data-target="#modal_open" href="cashier/open">
        Add
    </a>
    <div class="pay" style="background: none;padding-left: 0px;padding-right: 0px;padding-top: 5px">
        <input @if(Session::get('table_id')=='') disabled @endif type="text" class="form-control" placeholder="Code"
               onkeydown="if (event.keyCode == 13) ajaxLoad('cashier/order/'+this.value,'orderList')"/>
    </div>
    <a style="@if(Session::get('table_id')=='' || count($order)==0) pointer-events: none @endif"
       href="{{url("cashier/print")}}"
       target="_blank" class="btn btn-danger pay">
        Print
    </a>
    <a class="btn btn-success pay" data-toggle="modal" data-target="#modal_pay" href="cashier/pay"
       style="@if(Session::get('table_id')=='' || count($order)==0) pointer-events: none @endif">
        Cash Out
    </a>
</div>
<div class="row" style="background: white;padding: 10px 10px 30px 10px">
    <table class="table">
        <thead>
        <tr>
            <th style="margin: 0px;padding: 0px;vertical-align: middle" width="1px">Id</th>
            <th>Description</th>
            <th style="text-align: center">Qty</th>
            <th style="text-align: right;">Price</th>
            <th style="text-align: right">Total</th>
            <th style="width: 1px"></th>
        </tr>
        </thead>
        @if(count($order)>0)
            <?php $total = 0; ?>
            <tbody>
            @foreach($order->order_details()->orderBy('description')->get() as $orderDetail)
                <tr style="color: darkblue;@if(($orderDetail->status=='Filled')) color: red; @endif @if(!empty($orderDetail->deleted_at)) text-decoration: line-through; @endif">
                    <td style="margin: 0px;padding: 0px;vertical-align: middle">
                        <input type="text" style="width: 30px;height: 18px" value="{{$orderDetail->id}}"
                               class="idRow" readonly="readonly"/>
                    </td>
                    <td style="@if($orderDetail->sent==1) color:red; @endif">
                        <input onchange="ajaxLoad('cashier/update-description/{{$orderDetail->id}}/'+this.value,'orderList')"
                               type="text" style="width: 100%;border:none;height: 30px"
                               value="{{$orderDetail->description}}" readonly="readonly"/>
                    </td>
                    <td align="center">
                        <input onfocus="$(this).select()"
                               onchange="ajaxLoad('cashier/update-quantity/{{$orderDetail->id}}/'+this.value,'orderList')"
                               type="number" step="1" style="width: 40px;border: none;height: 30px;text-align: center"
                               value="{{$orderDetail->quantity}}" />
                    </td>
                    <td align="right">
                        <input onfocus="$(this).select()"
                               onchange="ajaxLoad('cashier/update-price/{{$orderDetail->id}}/'+this.value,'orderList')"
                               type="text" style="width: 60px;border: none;height: 30px;text-align: center"
                               value="₱ {{number_format($orderDetail->price,2)}}" readonly="readonly"/>
                    </td>
                    <td align="right">
                        <input type="text" style="width: 60px;border: none;height: 30px;text-align: right" 
                               value="₱ {{number_format($orderDetail->price * $orderDetail->quantity*(1-$orderDetail->discount/100),2)}}" readonly="readonly"/>

                    </td>
                    <td style="text-align: center;padding-top: 15px">
                        @if($orderDetail->status!='Filled' or (isset($orderDetail->product_id) and $orderDetail->product_id==0))
                            <a href="javascript:if(confirm('Are you sure want to delete?')) ajaxDelete('cashier/delete/{{$orderDetail->id}}','{{csrf_token()}}','orderList')">
                                <i class="glyphicon glyphicon-minus-sign" style="color: brown;"></i></a>
                        @endif
                    </td>
                </tr>
                <?php if (empty($orderDetail->deleted_at)) $total += ($orderDetail->price * $orderDetail->quantity * (1 - $orderDetail->discount / 100)); ?>
            @endforeach
            </tbody>
        @endif
    </table>
    @if(count($order)>0)
        <div style="text-align: right;float: right;border-top: solid 1px whitesmoke;">
            <table width="100%">
            <tr>
                <th style="text-align: left">
                     
                    </th>
                </tr>
                <tr>
                    <th style="text-align: right;padding-right: 20px">This Order is:</th>
                    <th style="text-align: right">
                    <select name="taskOption">
  <option value="1">Dine In</option>
  <option value="2">Take Out</option>
  $selectOption = $_POST['taskOption'];
</select>
                    </th>
                </tr>
                <tr>
                    <th style="text-align: right;padding-right: 20px">Customer:</th>
                    <th style="text-align: right">
                        {!! Form::select('customer',['0'=>'General']+\App\Customer::orderBy('name')->pluck('name','id')->toArray() ,$order->customer_id,['style'=>'border:none','onChange'=>"ajaxLoad('cashier/update-customer/".$order->id."/'+this.value,'orderList')"]) !!}
                    </th>
                </tr>
                <tr>
                    <th style="text-align: right;padding-right: 20px">Discount:</th>
                    <th style="text-align: right"><input onfocus="$(this).select()"
                                                         onchange="ajaxLoad('cashier/update-discount/{{$order->id}}/'+this.value,'orderList')"
                                                         type="text"
                                                         style="width: 50px;border: none;text-align: right"
                                                         value="@if(Session::get('order_id')!=''){{$order->discount}} @endif" readonly="readonly"/>
                        %
                    </th>
                </tr>
                <tr>
                    <th style="text-align: right;padding-right: 20px">Total:</th>
                    <th style="text-align: right">₱ {{number_format($total*(1-$order->discount/100),2)}}</th>
                </tr>
            </table>
        </div>
</div>
@endif
<script>
    function getSelectedRows() {
        var selected = [];
        $(".idRow:checked").each(function () {
            selected.push($(this).attr('value'));
        });
        return selected;
    }
</script>
