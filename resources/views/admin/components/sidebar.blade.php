<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto mt-0"><a class="navbar-brand mt-0" style="padding-top: 10px;" href="{{ route('index') }}">
                    <h2 class="brand-text mb-0"><img src="{{ asset($setting['logo'] ?? '')  }}" style="width: 120px;" alt=""></h2>
                </a></li>

        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class="nav-item @routeis('admin.dashboard') active @endrouteis"><a href="{{ route('admin.dashboard') }}"><i class="feather icon-home"></i>Dashboard</a></li>




            @can('browse_members')
                <li class=" navigation-header"><span>Members Department</span></li>
                <li class="nav-item @routeis('admin.member.index')  @endrouteis"><a href="{{ route('admin.member.index')}}?member={{'advocate'}}"><i class="feather icon-briefcase"></i>Advocate</a></li>
                <li class="nav-item @routeis('admin.member.index')  @endrouteis"><a href="{{ route('admin.member.index')}}?member={{'homeopath'}}"><i class="feather icon-list"></i>Homeopath</a></li>
                <li class="nav-item @routeis('admin.member.index') @endrouteis"><a href="{{ route('admin.member.index')}}?member={{'user'}}"><i class="feather icon-user"></i>End User</a></li>
                <li class="nav-item @routeis('admin.badge.requests') active @endrouteis"><a href="{{ route('admin.badge.requests')}}"><i class="feather icon-award"></i>Badge Requests <span class="badge badge-danger">{{ badgeRequests() }}</span></a> </li>
            @endcan



            <li class=" navigation-header"><span>Others</span></li>




            @can('browse_settings')
                <li class="nav-item @routeis('admin.refund.index') active @endrouteis"><a href="{{ route('admin.refund.index')}}"><i class="fa fa-dollar"></i>Refund Amount</a></li>
            @endcan

            @can('browse_settings')
                <li class="nav-item @routeis('admin.setting.index') active @endrouteis"><a href="{{ route('admin.setting.index') }}"><i class="feather icon-settings"></i>Settings</a></li>
                <li class="nav-item @routeis('admin.email.invitation')  @endrouteis"><a href="{{ route('admin.email.setting')}}"><i class="feather icon-mail"></i>Email Setting</a></li>
            @endcan

            @can('browse_services')
                <li class="nav-item @routeis('admin.services.index') active @endrouteis"><a href="{{ route('admin.services.index') }}"><i class="feather icon-server"></i>Services Theme</a></li>
            @endcan

            @can('browse_blogs')
                <li class="nav-item @routeis('admin.blogs.index') active @endrouteis"><a href="{{ route('admin.blogs.index') }}"><i class="feather icon-book"></i>Blogs</a></li>
            @endcan

            @can('browse_donations')
                <li class="nav-item @routeis('admin.donations') active @endrouteis"><a href="{{ route('admin.donations') }}"><i class="feather icon-dollar-sign"></i>Donations</a></li>
            @endcan



            @can('browse_shop')
                <li class=" navigation-header"><span>Shop Department</span></li>
                <li class="nav-item @routeis('admin.shop.index') active @endrouteis"><a href="{{ route('admin.shop.index') }}"><i class="feather icon-briefcase"></i>Shop</a></li>
                <li class="nav-item @routeis('admin.shop.options') active @endrouteis"><a href="{{ route('admin.shop.options') }}"><i class="feather icon-align-justify"></i>Product Options</a></li>
                <li class="nav-item @routeis('admin.shop.orders') active @endrouteis"><a href="{{ route('admin.shop.orders') }}">
                <i class="feather icon-circle"></i>Orders <span class="badge badge-danger">{{ shopPendingOrders() }}</span>
            </a></li>

            @endcan



            @can('browse_finance')
                <li class=" navigation-header"><span>Finance Department</span></li>
                <li class="nav-item @routeis('admin.finance.services.transaction') active @endrouteis"><a href="{{ route('admin.finance.services.transaction') }}"><i class="feather icon-dollar-sign"></i>Services Transaction</a></li>
                <li class="nav-item @routeis('admin.finance.homeopath.revenue') active @endrouteis"><a href="{{ route('admin.finance.homeopath.revenue') }}"><i class="feather icon-dollar-sign"></i>Homeopath Revenue</a></li>

                <li class="nav-item @routeis('admin.finance.index') active @endrouteis"><a href="{{ route('admin.finance.index') }}"><i class="feather icon-dollar-sign"></i>Finance Settings</a></li>
            @endcan



            @can('homeopath_library')
                <li class=" navigation-header"><span>Homeopath Department</span></li>
                <li class="nav-item @routeis('admin.Homeopath.index') active @endrouteis"><a href="{{ route('admin.homeopath.index') }}"><i class="feather icon-target"></i>Explore Homeopath</a></li>
            @endcan








            @can('browse_roles')
                <li class=" navigation-header"><span>Authorization Department</span></li>
                <li class="nav-item @routeis('admin.roles.index') active @endrouteis"><a href="{{ route('admin.roles.index') }}"><i class="feather icon-zap"></i>Roles</a></li>
            @endcan

            @can('browse_teams')
                <li class="nav-item @routeis('admin.teams.index') active @endrouteis"><a href="{{ route('admin.teams.index') }}"><i class="feather icon-user"></i>Teams</a></li>
            @endcan



            @can('browse_inquiries')
                <li class=" navigation-header"><span>Contact Department</span></li>
                <li class="nav-item @routeis('admin.inquiries') active @endrouteis"><a href="{{ route('admin.inquiries') }}"><i class="feather icon-info"></i>Inquiries</a></li>
            @endcan

            @can('browse_reports')
                <li class=" navigation-header"><span>Reported Department</span></li>
                <li class="nav-item @routeis('admin.reports') active @endrouteis"><a href="{{ route('admin.reports') }}"><i class="feather icon-flag"></i>Reported Users</a></li>
            @endcan




        </ul>
    </div>
</div>
