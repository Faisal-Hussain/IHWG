        <div class="container">
            <div class="card">
    <div class="row">
        <div class="col-md-8 cart">
            <div class="title">
                <div class="row">
                    <div class="col">
                        <h4><b>Shopping Cart</b></h4>
                    </div>
                    <div class="col align-self-center text-right text-muted">{{ count(Cart::instance('shopping')->content()) }} item(s)</div>
                </div>
            </div>



            <div class="table-responsive">
                <table class="table">
                <thead>
                <tr>
                  <th scope="col">Image</th>
                  <th scope="col">Product</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Price</th>
                  <th scope="col">Total</th>
                  <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                        @forelse(Cart::instance('shopping')->content() as $item)
                            <tr>
                              <td><img class="img-fluid" src="{{ asset($item->options->image) }}"></td>
                              <th>{{ $item->name }}</th>
                              <td><input type="number" min="1" class="quantity-input" data-id="{{ $item->rowId }}" name="" value="{{ $item->qty }}" class="quantity-input"></td>
                              <th class="text-success">${{ $item->price }}</th>
                              <th class="text-success">${{ $item->price * $item->qty }}</th>
                              <td><strong class="close" data-id="{{ $item->rowId }}" title="remove item">&#10005;</strong></td>
                            </tr>
                        @empty

                        @endforelse
                </tbody>
            </table>
            </div>
            <hr>




            <div class="mt-4"><a href="{{ route('shop.index') }}" class="btn btn-dark">&leftarrow; Back to shop</a></div>
        </div>
        <div class="col-md-4 summary">
            <div>
                <h5><b>Summary</b></h5>
            </div>

            <div class="row mb-2" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                <div class="col m-auto">QUANTITY</div>
                <div class="col text-right font-weight-bold" style="font-size:1.9rem">{{ Cart::instance('shopping')->count() }}</div>
            </div>

            <div class="row mb-2" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                <div class="col">SUBTOTAL</div>
                <div class="col text-right font-weight-bold">${{ Cart::instance('shopping')->total() }}</div>
            </div>
             
            <div class="row mb-2" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                <div class="col">TAX PRICE</div>
                <div class="col text-right font-weight-bold text-danger">$0</div>
            </div> 

            <div class="row mb-2" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                <div class="col">DISCOUNT PRICE</div>
                <div class="col text-right font-weight-bold text-success">$0</div>
            </div> 

            <div class="row mb-2 text-primary" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0; font-size: 30px;">
                <div class="col font-weight-bold">TOTAL</div>
                <div class="col text-right font-weight-bold total-amount" data-amount="{{ Cart::total() }}">${{ Cart::instance('shopping')->total() }}</div>
            </div> 
            
        </div>
    </div>
</div>
        </div>