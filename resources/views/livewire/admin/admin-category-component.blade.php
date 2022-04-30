<div>
    <style>
        nav svg {
            height: 20px;
        }
        nav .hidden {
            display: block !important;
        }
    </style>
    <div class="container" style="padding:30px">
        <div class="row">
            <div class="col-md-">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        All Categories
                    </div>
                    <div class="panel-">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Category Name</th>
                                    <th>Slug</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($categories as $category)
                                    <tr>
                                        <td>{{$category->id}}</td>
                                        <td>{{$category->name}}</td>
                                        <td>{{$category->slug}}</td>
                                        {{-- <td>
                                            <a href="{{route('category.edit',$category->id)}}" class="btn btn-primary">Edit</a>
                                            <a href="{{route('category.delete',$category->id)}}" class="btn btn-danger">Delete</a>
                                        </td> --}}
                                        <td>{{$category->created_at}}</td>
                                    </tr>
                                    @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            {{$categories->links()}}
        </div>
    </div>
</div>
