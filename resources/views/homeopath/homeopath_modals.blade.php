

<!-- Modal -->
<div class="modal fade" id="markBookingComplete" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Write the prescription here</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form method="post" action="{{ route('homeopath.bookings.complete') }}" enctype="multipart/form-data">
          
          <div class="modal-body">
            @csrf
            <input type="hidden" name="booking_id" id="booking_id">
            <label>Prescription Detail</label>
            <textarea class="form-control" name="prescription" rows="6" placeholder="Prescription" required=""></textarea>


            <label>Any Attachement</label>
            <input type="file" name="attachement" class="form-control dropify">

          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-dark">Continue</button>
          </div>

        </form>
      
    </div>
  </div>
</div>
    