{# New Link #}
<div class="modal fade" id="newLink" tabindex="-1" aria-labelledby="newLinkLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newLinkLabel">New Link</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="newForm" data-submitto="{{ HOST }}/create">
                    <div class="mb-3">
                        <label>URL Link <span class="text-danger">*</span></label>
                        <input type="text" class="form-control link" name="newLink[url]" placeholder="Link" required>
                        <div class="invalid-feedback">This field is required</div>
                    </div>
                    <div class="mb-3">
                        <label>Title <span class="text-danger">*²</span></label>
                        <input type="text" class="form-control title" name="newLink[title]" placeholder="Title" required>
                        <div class="invalid-feedback title-feedback">This field is required</div>
                    </div>
                    <div class="mb-3">
                        <label>Comment</label>
                        <input type="text" class="form-control" name="newLink[description]" placeholder="Comment">
                    </div>
                    <div class="mb-3">
                        <label>Image url</label>
                        <input type="text" class="form-control" name="newLink[img]" placeholder="Image url">
                    </div>
                    <input type="hidden" name="newLink[org]" value="{{ session.breadcrumb|join('/') }}">
                </form>

                <div class="form-text text-danger"></div>
                <hr>
                <span class="text-danger">*</span> = Required fields <br>
                <span class="text-danger">²</span> = Must not contain special characters such as #, *, ?, &, /, etc.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="sendNew" class="btn btn-primary">Create link</button>
            </div>
        </div>
    </div>
</div>