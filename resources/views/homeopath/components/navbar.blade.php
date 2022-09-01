<nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-light navbar-shadow">
    <div class="navbar-wrapper">
        <div class="navbar-container content">
            <div class="navbar-collapse" id="navbar-mobile">
                <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                    <ul class="nav navbar-nav">
                        <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                    </ul>
                    <h3 class="m-auto">@yield('heading')</h3>
                </div>
                <ul class="nav navbar-nav float-right">

                    <li class="dropdown dropdown-user nav-item">
                        <a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                            <div class="user-nav d-sm-flex d-none bg-white"><span class="user-name text-bold-600">{{ Auth::User()->name ?? 'Administrator' }}</span><span class="user-status text-success">{{ Auth::User()->roles[0]->name ?? '' }}</span></div><span><img class="round" src="{{ asset(Auth::user()->avatar) }}" alt="avatar" height="40" width="40"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="{{ route('homeopath.profile') }}"><i class="feather icon-user"></i>Profile</a>
                            <a class="dropdown-item" href="{{ route('redirect.dashboard') }}"><i class="feather icon-home"></i>Dashboard</a>
                            <a class="dropdown-item" href="{{ route('logout') }}" ><i class="feather icon-power"></i>{{ __('Logout') }}</a>

                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
