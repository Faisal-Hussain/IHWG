<div class="row">
    <div class="col-lg-12">
        @include('vendor.social-network.components.social_network_navbar')
        <div class="card">
            <div class="card-body">
                <h3 class="p-0 m-0 font-weight-bold">Message(s)</h3>
            </div>
        </div>
    </div>

    <div class="col-lg-12 render-messages" id="render-messages">
        @include('ajax.message')
    </div>
</div>
