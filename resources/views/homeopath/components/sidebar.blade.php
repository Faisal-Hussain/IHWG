<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">

    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class="nav-item @routeis('homeopath.dashboard') active @endrouteis"><a href="{{ route('homeopath.dashboard') }}"><i class="fas fa-tachometer-alt"></i>Dashboard</a></li>
            <li class="nav-item"><a href="{{ route('social.index') }}"><i class="fa fa-globe"></i>Social Platform</a></li>

            <li class="nav-item has-sub">
                <a href="#"><i class="fas fa-database"></i>MyClinic
                     <i class="fas fa-chevron-down float-right"></i>
                </a>
                    <ul class="menu-content">
                        <li class="@routeis('homeopath.services.index') active @endrouteis"><a href="{{ route('homeopath.services.index') }}"><i class="fa fa-server"></i>Services</a></li>
                        <li class="@routeis('homeopath.settings.index') active @endrouteis"><a href="{{ route('homeopath.settings.index') }}"><i class="fas fa-gear"></i>Settings</a></li>
                        <li class="@routeis('homeopath.resources.index') active @endrouteis"><a href="{{ route('homeopath.resources.index') }}"><i class="fas fa-book"></i>Resources</a></li>
                        <li class="@routeis('homeopath.finance.index') active @endrouteis"><a href="{{ route('homeopath.finance.index') }}"><i class="fas fa-hand-holding-usd"></i>Finance</a></li>
                        <li class="@routeis('homeopath.documents.index') active @endrouteis"><a href="{{ route('homeopath.documents.index') }}"><i class="fas fa-folder"></i>Documents</a></li>
                        <li class="@routeis('homeopath.customers.index') active @endrouteis"><a href="{{ route('homeopath.customers.index') }}"><i class="fas fa-users"></i>Customers</a></li>
                        <li class="@routeis('homeopath.appointments.index') active @endrouteis"><a href="{{ route('homeopath.appointments.index') }}"><i class="far fa-calendar-check"></i>Appointments</a></li>
                        <li class="@routeis('homeopath.appointments.calendar') active @endrouteis"><a href="{{ route('homeopath.appointments.calendar') }}"><i class="far fa-calendar-o"></i>Calendar</a></li>
                        <li class="@routeis('homeopath.appointments.schedule') active @endrouteis"><a href="{{ route('homeopath.appointments.schedule') }}"><i class="far fa-calendar-alt"></i>My Schedule</a></li>

                        

                    </ul>
            </li>
            <li class="nav-item"><a href="{{ route('index') }}" target="_blank"><i class="fa fa-home"></i>Visit Site</a></li>


        </ul>
    </div>
</div>