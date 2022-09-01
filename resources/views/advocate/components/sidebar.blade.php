<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto mt-0"><a class="navbar-brand mt-0" style="padding-top: 10px;" href="">
                <div class="brand-logo" style="background-image: url('{{ asset($setting['favicon'] ?? '')  }}');"></div>
                <h2 class="brand-text mb-0"><img src="{{ asset($setting['logo'] ?? '')  }}" style="width: 120px;" alt=""></h2>
            </a></li>

        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class="nav-item @routeis('advocate.dashboard') active @endrouteis"><a href="{{ route('advocate.dashboard') }}"><i class="feather icon-home"></i>Dashboard</a></li>
            <li class=" navigation-header"><span>Others</span></li>
            <li class="nav-item @routeis('advocate.articles.index') active @endrouteis"><a href="{{ route('advocate.articles.index') }}"><i class="feather icon-book"></i>Articles</a></li>
            <li class="nav-item @routeis('advocate.social.network') active @endrouteis"><a href="{{ route('advocate.social.network') }}"><i class="feather icon-globe"></i>Social Platform</a></li>
        </ul>
    </div>
</div>