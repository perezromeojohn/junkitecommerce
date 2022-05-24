<main id="main" class="main-site">

    <div class="container">

        <div class="wrap-breadcrumb">
            <ul>
                <li class="item-link"><a href="/home" class="link">home</a></li>
                <li class="item-link"><span>Checkout</span></li>
            </ul>
        </div>
        <div class=" main-content-area">
            <div class="wrap-top-banner">
                <div class="link-banner">
                    <figure><img src="{{ asset('assets/images/checkout1.jpg') }}" width="1170" height="240" alt=""></figure>
                </div>
            </div>
            <form wire:submit.prevent="placeOrder">
            <div class="row">
                <div class="col-md-12">
                    <div class="wrap-address-billing">
                        <h3 class="box-title">Billing Address</h3>
                        <div class="billing-address">
                            <p class="row-in-form">
                                <label for="fname">first name<span>*</span></label>
                                <input  type="text" name="fname" value="" placeholder="Your name" wire:model="firstname">
                                @error('firstname') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="lname">last name<span>*</span></label>
                                <input  type="text" name="lname" value="" placeholder="Your last name" wire:model="lastname">
                                @error('lastname') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="email">Email Address:</label>
                                <input  type="email" name="email" value="" placeholder="Type your email" wire:model="email">
                                @error('email') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="phone">Phone number<span>*</span></label>
                                <input  type="number" name="phone" value="" placeholder="11 digits format" wire:model="mobile">
                                @error('mobile') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="add">Address 1:</label>
                                <input  type="text" name="add" value="" placeholder="Enter line 1" wire:model="line1">
                                @error('line1') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="add">Address 2:</label>
                                <input  type="text" name="add" value="" placeholder="Enter line 2" wire:model="line2">
                                @error('line2') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="country">Country<span>*</span></label>
                                <input  type="text" name="country" value="" placeholder="United States" wire:model="country">
                                @error('country') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="zip-code">Postcode / ZIP:</label>
                                <input type="number" name="zip-code" value="" placeholder="Your postal code" wire:model="zipcode">
                                @error('zipcode') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="city">Province<span>*</span></label>
                                <input  type="text" name="province" value="" placeholder="Province" wire:model="province">
                                @error('province') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="city">Town / City<span>*</span></label>
                                <input  type="text" name="city" value="" placeholder="City name" wire:model="city">
                                @error('city') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            {{-- <p class="row-in-form fill-wife">
                                <label class="checkbox-field">
                                    <input name="different-add" id="different-add" wire:model="ship_to_different" value="1" type="checkbox">
                                    <span>Ship to a different address?</span>
                                </label>
                            </p> --}}
                        </div>
                    </div>
                </div>

                @if($ship_to_different == 1)
                <div class="col-md-12">
                    <div class="wrap-address-billing">
                        <h3 class="box-title">Shipping Address</h3>
                        <div class="billing-address">
                            <p class="row-in-form">
                                <label for="fname">first name<span>*</span></label>
                                <input  type="text" name="fname" value="" placeholder="Your name" wire:model="s_firstname">
                                @error('s_firstname') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="lname">last name<span>*</span></label>
                                <input  type="text" name="lname" value="" placeholder="Your last name" wire:model="s_lastname">
                                @error('s_lastname') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="email">Email Addreess:</label>
                                <input  type="email" name="email" value="" placeholder="Type your email" wire:model="s_email">
                                @error('s_email') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="phone">Phone number<span>*</span></label>
                                <input  type="number" name="phone" value="" placeholder="11 digits format" wire:model="s_mobile">
                                @error('s_mobile') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="add">Line 1:</label>
                                <input  type="text" name="add" value="" placeholder="Enter line 1" wire:model="s_line1">
                                @error('s_line1') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="add">Line :</label>
                                <input  type="text" name="add" value="" placeholder="Enter line 2" wire:model="s_line2">
                                @error('s_line2') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="country">Country<span>*</span></label>
                                <input  type="text" name="country" value="" placeholder="Philippines" wire:model="s_country">
                                @error('s_country') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="zip-code">Postcode / ZIP:</label>
                                <input type="number" name="zip-code" value="" placeholder="Your postal code" wire:model="s_zipcode">
                                @error('s_zipcode') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="city">Province<span>*</span></label>
                                <input  type="text" name="province" value="" placeholder="Province" wire:model="s_province">
                                @error('s_province') <span class="error">{{ $message }}</span> @enderror
                            </p>
                            <p class="row-in-form">
                                <label for="city">Town / City<span>*</span></label>
                                <input  type="text" name="city" value="" placeholder="City name" wire:model="s_city">
                                @error('s_city') <span class="error">{{ $message }}</span> @enderror
                        </div>
                    </div>
                </div>
                @endif

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="summary summary-checkout">
                        <div class="summary-item payment-method">
                            <h4 class="title-box">Payment Method</h4>
                            <p>We only have COD for now!</p>
                            <div class="choose-payment-methods">
                                <label class="payment-method">
                                    <input name="payment-method" id="payment-method-bank" value="cod" type="radio" wire:model="payment_method">
                                    <span>Cash on Delivery</span>
                                    <span class="payment-desc">Order Now Pay on Delivery</span>
                                </label>
                                {{-- <label class="payment-method">
                                    <input name="payment-method" id="payment-method-visa" value="card" type="radio" wire:model="payment_method">
                                    <span>Debit / Credit Card </span>
                                    <span class="payment-desc">Card!!</span>
                                </label>
                                <label class="payment-method">
                                    <input name="payment-method" id="payment-method-paypal" value="paypal" type="radio" wire:model="payment_method">
                                    <span>Paypal</span>
                                    <span class="payment-desc">You can pay with your credit</span>
                                    <span class="payment-desc">card if you don't have a paypal account</span>
                                </label> --}}
                                @error ('payment_method') <span class="error">{{ $message }}</span> @enderror
                            </div>
                            @if(Session::has('checkout'))
                                <p class="summary-info grand-total"><span>Grand Total</span> <span class="grand-total-price">₱{{Session::get('checkout')['total']}}</span></p>
                            @endif
                            <button type="submit" class="btn btn-medium">Place order now</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                        <center>
                            <div class="banner-item" style="margin-top: 12px">
                                <a href="#" class="link-banner banner-effect-2">
                                    <figure><img src="{{ asset('assets/images/checkout2.jpg') }}"></figure>
                                </a>
                            </div>
                        </center>
                </div>
            </div>
            
        </form>

        </div><!--end main content area-->
    </div><!--end container-->

</main>