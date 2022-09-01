        <form method="post" action="{{route('social.upload.album.photo')}}" enctype="multipart/form-data" id="uploadPhotoInAlbumForm">
          @csrf
          <div class="form-group">
            <label>Album Name</label>
            <select class="select2 form-control" name="album_id" required="">
              <option value="" selected="">Select One</option>
                @foreach(userSocialAlbums() as $list)
                  <option value="{{$list->id}}">{{$list->name}}</option>

                @endforeach
              
            </select>
          </div>
          <div class="form-group">
            <label>Image</label>
            <input type="file" name="image" class="dropify" required="">
          </div>

          <button type="submit" class="btn btn-primary uploadPhotoInAlbumForm-btn">Save</button>

        </form>