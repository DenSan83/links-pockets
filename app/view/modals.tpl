{# New Link #}
<div class="modal fade" id="newLink" tabindex="-1" aria-labelledby="newLinkLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="newLinkLabel">New Link {{ 'circledotted'|icon(20, 'ms-1') }}</h5>
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
                        <div class="invalid-feedback title-feedback"></div>
                    </div>
                    <div class="mb-3">
                        <label>Comment</label>
                        <input type="text" class="form-control" name="newLink[description]" placeholder="Comment">
                    </div>
                    <div class="mb-3">
                        <label>Image url</label>
                        <input type="text" class="form-control" name="newLink[img]" placeholder="Image url - Leave empty for auto-fill">
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
                <button type="button" id="sendNew" class="btn btn-primary sender">Create link</button>
            </div>
        </div>
    </div>
</div>

{# New Folder #}
<div class="modal fade" id="newFolder" tabindex="-1" aria-labelledby="newFolderLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="newFolderLabel">New Folder {{ 'folderplus'|icon(20, 'ms-1') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="newFolderForm" data-submitto="{{ HOST }}/create">
                    <div class="mb-3">
                        <label>Folder name <span class="text-danger">*²</span></label>
                        <input type="text" class="form-control title" name="newFolder[title]" placeholder="Folder name" required>
                        <div class="invalid-feedback title-feedback"></div>
                    </div>
                    <div class="mb-3">
                        <label>Comment</label>
                        <input type="text" class="form-control" name="newFolder[description]" placeholder="Comment">
                    </div>
{#                    <input type="hidden" name="newFolder[org]" value="{{ session.breadcrumb|join('/') }}">#}
                </form>

                <div class="form-text text-danger"></div>
                <hr>
                <span class="text-danger">*</span> = Required field <br>
                <span class="text-danger">²</span> = Must not contain special characters such as #, *, ?, &, /, etc.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="sendNewFolder" class="btn btn-primary sender">Create folder</button>
            </div>
        </div>
    </div>
</div>

{# Edit Link #}
<div class="modal fade" id="editLink" tabindex="-1" aria-labelledby="editLinkLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="editLinkLabel">Edit Link {{ 'circledotted'|icon(20, 'ms-1') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editForm" data-submitto="{{ HOST }}/edit">
                    <div class="mb-3">
                        <label>URL Link <span class="text-danger">*</span></label>
                        <input type="text" class="form-control link" name="editLink[url]" placeholder="Link" required>
                        <div class="invalid-feedback">This field is required</div>
                    </div>
                    <div class="mb-3">
                        <label>Title <span class="text-danger">*²</span></label>
                        <input type="text" class="form-control title" name="editLink[title]" placeholder="Title" required>
                        <div class="invalid-feedback title-feedback"></div>
                    </div>
                    <div class="mb-3">
                        <label>Comment</label>
                        <input type="text" class="form-control" name="editLink[description]" placeholder="Comment">
                    </div>
                    <div class="mb-3">
                        <label>Image url</label>
                        <input type="text" class="form-control" name="editLink[img]" placeholder="Image url - Leave empty for auto-fill">
                    </div>
                    <input type="hidden" name="editLink[id]">
                    <input type="hidden" name="editLink[org]" value="{{ session.breadcrumb|join('/') }}">
                </form>

                <div class="form-text text-danger"></div>
                <hr>
                <span class="text-danger">*</span> = Required fields <br>
                <span class="text-danger">²</span> = Must not contain special characters such as #, *, ?, &, /, etc.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="sendEdit" class="btn btn-primary sender">Edit link</button>
            </div>
        </div>
    </div>
</div>

{# Edit Folder #}
<div class="modal fade" id="editFolder" tabindex="-1" aria-labelledby="editFolderLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="editFolderLabel">Edit Folder {{ 'folderplus'|icon(20, 'ms-1') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editFolderForm" data-submitto="{{ HOST }}/edit">
                    <div class="mb-3">
                        <label>Title <span class="text-danger">*²</span></label>
                        <input type="text" class="form-control title" name="editFolder[title]" placeholder="Title" required>
                        <div class="invalid-feedback title-feedback"></div>
                    </div>
                    <div class="mb-3">
                        <label>Comment</label>
                        <input type="text" class="form-control" name="editFolder[description]" placeholder="Comment">
                    </div>

                    <input type="hidden" class="form-control link" name="editFolder[url]">
                    <input type="hidden" class="form-control" name="editFolder[img]">
                    <input type="hidden" name="editFolder[id]">
                    <input type="hidden" name="editFolder[org]" value="{{ session.breadcrumb|join('/') }}">
                </form>

                <div class="form-text text-danger"></div>
                <hr>
                <span class="text-danger">*</span> = Required fields <br>
                <span class="text-danger">²</span> = Must not contain special characters such as #, *, ?, &, /, etc.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="sendEditFolder" class="btn btn-primary sender">Edit Folder</button>
            </div>
        </div>
    </div>
</div>

{# Delete #}
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="deleteModalLabel">Delete element {{ 'trash3'|icon(20, 'ms-1') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <div class="modal-body">
                    <form id="deleteForm" data-submitto="{{ HOST }}/delete">
                        <div class="mb-3">
                            <label>ID</label>
                            <input type="text" class="form-control id" id="deleteInputId" name="delete[id]" readonly>
                        </div>
                        <div class="mb-3">
                            <label>Title</label>
                            <input type="text" class="form-control title" name="delete[title]" disabled>
                        </div>
                        <div class="mb-3">
                            <label>Comment</label>
                            <input type="text" class="form-control" name="delete[description]" disabled>
                        </div>

                        <input type="hidden" name="delete[org]">
                    </form>
                    <hr>
                    Are you sure you wish to <span class="text-danger">delete</span> this element? <br>
                    This action is permanent.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" id="sendDelete" class="btn btn-danger">Delete</button>
                </div>
        </div>
    </div>
</div>