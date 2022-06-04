class Validator {
    specials=/[*|\":<>[\]{}`\\()'/;%#?&$]/;
    genericError = 'An error has occurred. Please try again later.';
    requiredFieldError = 'This field is required';
    specialCharsError = 'Special characters are not allowed in this field';

    validateLink(formId) {
        let linkInput = $(formId + ' .link');
        let titleInput = $(formId + ' .title');
        let feedBack = $(formId + ' .title-feedback');
        let linkIsValid = true;
        let titleIsValid = true;
        let error = null;

        // Remove all validators
        $(linkInput).removeClass('is-valid is-invalid');
        $(titleInput).removeClass('is-valid is-invalid');
        $(feedBack).text('');

        // Link is required
        if ($(linkInput).val() === '') {
            linkIsValid = false;
        }
        // Title is required + some characters are forbidden
        if ($(titleInput).val() === '') {
            titleIsValid = false;
            error = this.requiredFieldError;
        } else if (this.specials.test($(titleInput).val())) {
            titleIsValid = false;
            error = this.specialCharsError;
        }

        if (linkIsValid) {
            $(linkInput).addClass('is-valid');
        } else {
            $(linkInput).addClass('is-invalid');
        }

        if (titleIsValid) {
            $(titleInput).addClass('is-valid');
        } else {
            $(titleInput).addClass('is-invalid');
            $(feedBack).text(error);
        }

        // Send form via Ajax
        if (linkIsValid && titleIsValid) {
            let form = $(formId)[0];
            let url = $(form).data('submitto');
            let data = new FormData(form);
            $.post({
                url: url,
                data: data,
                processData: false,
                contentType: false
            })
            .done((response, result) => {
                if (result !== 'success') {
                    $(formId + ' + .form-text').html(this.genericError);
                }

                try {
                    response = JSON.parse(response);
                    if (response.success) {
                        location.reload();
                    } else {
                        $(formId + ' + .form-text').html(response.errors);
                    }
                } catch (e) {
                    $(formId + ' + .form-text').html(this.genericError);
                }
            })
        }
    }

    validateFolder(formId) {
        let titleInput = $(formId + ' .title');
        let feedBack = $(formId + ' .title-feedback');
        let titleIsValid = true;
        let error = null;

        // Remove all validators
        $(titleInput).removeClass('is-valid is-invalid');
        $(feedBack).text('');

        // Title is required + some characters are forbidden
        if ($(titleInput).val() === '') {
            titleIsValid = false;
            error = this.requiredFieldError;
        } else if (this.specials.test($(titleInput).val())) {
            titleIsValid = false;
            error = this.specialCharsError;
        }

        if (titleIsValid) {
            $(titleInput).addClass('is-valid');
        } else {
            $(titleInput).addClass('is-invalid');
            $(feedBack).text(error);
        }

        // Send form via Ajax
        if (titleIsValid) {
            let form = $(formId)[0];
            let url = $(form).data('submitto');
            let data = new FormData(form);
            $.post({
                url: url,
                data: data,
                processData: false,
                contentType: false
            })
            .done((response, result) => {
                if (result !== 'success') {
                    $(formId + ' + .form-text').html(this.genericError);
                }

                try {
                    response = JSON.parse(response);
                    if (response.success) {
                        location.reload();
                    } else {
                        $(formId + ' + .form-text').html(response.errors);
                    }
                } catch (e) {
                    $(formId + ' + .form-text').html(this.genericError);
                }
            })
        }
    }


}