{# New Link #}
<div class="modal fade" id="newLink" tabindex="-1" aria-labelledby="newLinkLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="newLinkLabel">New Link
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="ms-1 bi bi-plus-circle-dotted" viewBox="0 0 16 16">
                        <path d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                    </svg>
                </h5>
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
                <button type="button" id="sendNew" class="btn btn-primary">Create link</button>
            </div>
        </div>
    </div>
</div>

{# New Folder #}
<div class="modal fade" id="newFolder" tabindex="-1" aria-labelledby="newFolderLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="newFolderLabel">New Folder
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="ms-1 bi bi-folder-plus" viewBox="0 0 16 16">
                        <path d="m.5 3 .04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.683.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"/>
                        <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 1 1 0 1H14v1.5a.5.5 0 1 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
                    </svg>
                </h5>
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
                <button type="button" id="sendNewFolder" class="btn btn-primary">Create folder</button>
            </div>
        </div>
    </div>
</div>

{# Edit Link #}
<div class="modal fade" id="editLink" tabindex="-1" aria-labelledby="editLinkLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="editLinkLabel">Edit Link
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="ms-1 bi bi-plus-circle-dotted" viewBox="0 0 16 16">
                        <path d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                    </svg>
                </h5>
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
                <button type="button" id="sendEdit" class="btn btn-primary">Edit link</button>
            </div>
        </div>
    </div>
</div>

{# Edit Folder #}
<div class="modal fade" id="editFolder" tabindex="-1" aria-labelledby="editFolderLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="editFolderLabel">Edit Folder
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="ms-1 bi bi-folder-plus" viewBox="0 0 16 16">
                        <path d="m.5 3 .04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.683.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"></path>
                        <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 1 1 0 1H14v1.5a.5.5 0 1 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"></path>
                    </svg>
                </h5>
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
                <button type="button" id="sendEditFolder" class="btn btn-primary">Edit Folder</button>
            </div>
        </div>
    </div>
</div>

{# Delete #}
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title d-flex align-items-center" id="deleteModalLabel">Delete element
{#                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="ms-1 bi bi-folder-plus" viewBox="0 0 16 16">#}
{#                        <path d="m.5 3 .04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2zm5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19c-.24 0-.47.042-.683.12L1.5 2.98a1 1 0 0 1 1-.98h3.672z"></path>#}
{#                        <path d="M13.5 10a.5.5 0 0 1 .5.5V12h1.5a.5.5 0 1 1 0 1H14v1.5a.5.5 0 1 1-1 0V13h-1.5a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"></path>#}
{#                    </svg>#}
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="ms-1 bi bi-trash3" viewBox="0 0 16 16">
                        <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"></path>
                    </svg>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <div class="modal-body">
                    <form id="deleteForm" data-submitto="{{ HOST }}/delete">
                        <div class="mb-3">
                            <label>ID</label>
                            <input type="text" class="form-control id"  name="delete[id]" style="box-shadow: none; border-color: #ced4da;" readonly>
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