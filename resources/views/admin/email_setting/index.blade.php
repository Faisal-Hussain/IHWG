@extends('layouts.admin')
@section('title','Email Setting')
@section('heading','Email Settings')
@section('css')

@endsection

@section('content')

    <section>
        <div class="card">

            <div class="card-header card-header-primary">
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="table-responsive">
                        <table class="table p-0">
                            <thead>
                            <tr>
                                <th width="60%">Email</th>
                                <th class="text-right">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Verify Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'verify_email'}}" class="btn btn-primary w-100 font-weight-bold">Verify Email</a></th>
                            </tr>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Register Advocate Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'register_advocate'}}" class="btn btn-primary w-100 font-weight-bold">Register Advocate Email</a></th>
                            </tr>
                             <tr>
                                <th><h3 class="text-success font-weight-bold">Register User Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'register_user'}}" class="btn btn-primary w-100 font-weight-bold">Register User Email</a></th>
                            </tr>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Register Homeopath Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'register_homeopath'}}" class="btn btn-primary w-100 font-weight-bold">Register Homeopath Email</a></th>
                            </tr>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Advocate Booking Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'advocate_booking'}}" class="btn btn-primary w-100 font-weight-bold">Advocate Booking Email</a></th>
                            </tr>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Invitation Send Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'invitation'}}" class="btn btn-primary w-100 font-weight-bold">Invitation Send Email</a></th>
                            </tr>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Sub Admin Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'sub_admin_email'}}" class="btn btn-primary w-100 font-weight-bold">Sub Admin Email</a></th>
                            </tr>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Booking Completed Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'book_completed'}}" class="btn btn-primary w-100 font-weight-bold">Booking Completed Email</a></th>
                            </tr>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Booking Confirmation Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'book_confirmation'}}" class="btn btn-primary w-100 font-weight-bold">Booking Confirmation Email</a></th>
                            </tr>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Zoom Meeting Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'zoom_meeting'}}" class="btn btn-primary w-100 font-weight-bold">Zoom Meeting Email</a></th>
                            </tr>
                            <tr>
                                <th><h3 class="text-success font-weight-bold">Service Booking Alert Email Settings</h3></th>

                                <th class="text-right"><a href="{{ route('admin.email.invitation')}}?email={{'service_booking_alert'}}" class="btn btn-primary w-100 font-weight-bold">Service Booking Alert Email</a></th>
                            </tr>

                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </section>



@endsection

@section('js')

@endsection

