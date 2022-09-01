<ul  class="list-group text-left shadow-sm border-top" style="max-height:100px;overflow: auto;">
    @forelse($homeopath as $item)    
      <li class="list-group-item p-1 border-0 append-name">{{ $item->name }}</li>
    @empty
        <li class="list-group-item p-1 border-0">Sorry! No homeopath was founded.</li>
    @endforelse

</ul>