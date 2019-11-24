function showError(container, errorMessage) {
    container.className = 'error';
    let msgElem = document.createElement('span');
    msgElem.className = "error-message";
    msgElem.innerHTML = errorMessage;
    container.appendChild(msgElem);
}
function resetError(container) {
    container.className = '';
    if (container.lastChild.className == "error-message") {
        container.removeChild(container.lastChild);
    }
}
function validate(form) {
    let elems = form.elements;
    resetError(elems.firstName.parentNode);
    if (!elems.firstName.value) {
        showError(elems.firstName.parentNode, ' Укажите Ваше имя.');
        return false;
    }
    resetError(elems.lastName.parentNode);
    if (!elems.lastName.value) {
        showError(elems.lastName.parentNode, ' Укажите Вашу фамилию.');
        return false;
    }
    resetError(elems.email.parentNode);
    if (!elems.email.value) {
        showError(elems.email.parentNode, ' Укажите электронную почту.');
        return false;
    }
    resetError(elems.password.parentNode);
    if (!elems.password.value) {
        showError(elems.password.parentNode, ' Укажите пароль.');
        return false;
    }
}