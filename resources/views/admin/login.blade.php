
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>{{ env('APP_NAME') }} Login</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/vendors.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/charts/apexcharts.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/extensions/tether-theme-arrows.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/extensions/tether.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/extensions/toastr.css') }}">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/bootstrap.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/bootstrap-extended.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/colors.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/components.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/themes/dark-layout.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/themes/semi-dark-layout.css') }}">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/core/menu/menu-types/vertical-menu.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/core/colors/palette-gradient.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/pages/authentication.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/custom.css') }}">
    <!-- END: Page CSS-->


</head>

<body class="vertical-layout vertical-menu-modern 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page bg-dark" data-open="click" data-menu="vertical-menu-modern" data-col="1-column" style="background : url({{ asset('admin/images/pages/vuexy-login-bg.jpg') }}) no-repeat center center;">
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section class="row flexbox-container">
                    <div class="col-xl-8 col-11 d-flex justify-content-center">
                        <div class="card bg-authentication rounded-0 mb-0">
                            <div class="row m-0">
                                <div class="col-lg-6 d-lg-block d-none text-center align-self-center px-5 py-0">
                                    <h2>{{ env('APP_NAME') }}</h2>
                                    <hr>
                                    <h2>ADMIN DASHBOARD</h2>
                                </div>
                                <div class="col-lg-6 col-12 p-0">
                                    <div class="card rounded-0 mb-0 px-2">
                                        <div class="card-header pb-1">
                                            <div class="card-title">
                                                <h4 class="mb-0">Hello {{ env('APP_NAME') }} Team</h4>
                                            </div>
                                        </div>
                                        <p class="px-2">Welcome, please login to your account.</p>
                                        <div class="card-content">
                                            <div class="card-body pt-1 mb-3">
                                                <form method="POST" action="{{ route('admin.attempt.login') }}">
                                                    @csrf
                                                <fieldset class="form-label-group form-group position-relative has-icon-left">
                                                        <input id="email" type="email" name="email"  for="email" value="{{ old('email') }}" required autocomplete="email" autofocus class="form-control"  placeholder="Email" required>
                                                            <div class="form-control-position">
                                                            <i class="feather icon-user"></i>
                                                        </div>
                                                        <label for="user-name">Email</label>
                                                    </fieldset>

                                                    <fieldset class="form-label-group position-relative has-icon-left">
                                                        <input type="password"  class="form-control " id="user-password" name="password" required autocomplete="current-password" placeholder="Password" required>
                                                            <div class="form-control-position">
                                                            <i class="feather icon-lock"></i>
                                                        </div>
                                                        <label for="password">Password</label>
                                                    </fieldset>
                                                    <div class="form-group d-flex justify-content-between align-items-center">

                                                        <div class="text-right">

                                                            <a class="card-link" href="">
                                                                Forgot Your Password?
                                                            </a>
                                                                                                            </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary float-right btn-inline">Login to Dashboard</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>



    <!-- BEGIN: Vendor JS-->
    <script src="{{ asset('admin/vendors/js/vendors.min.js') }}"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="{{ asset('admin/vendors/js/charts/apexcharts.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/extensions/tether.min.js') }}"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="{{ asset('admin/js/core/app-menu.js') }}"></script>
    <script src="{{ asset('admin/js/core/app.js') }}"></script>
    <script src="{{ asset('admin/js/scripts/components.js') }}"></script>
    <!-- END: Theme JS-->
    <script src="{{ asset('admin/vendors/js/extensions/toastr.min.js') }}"></script>

    <!-- BEGIN: Page JS-->
    <script src="{{ asset('admin/js/scripts/pages/dashboard-analytics.js') }}"></script>
    <!-- END: Page JS-->
    <script>
     @if(session('error'))
         toastr.error("{{ session('error') }}");
     @endif

 </script>
</body>
<!-- END: Body-->

</html>
