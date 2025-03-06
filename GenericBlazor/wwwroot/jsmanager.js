function setCookie(name, value, days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    var cookieString = name + "=" + (value || "") + expires + "; path=/; SameSite=Lax";
    document.cookie = cookieString;
}

function getCookie (name) {
        let cookieArr = document.cookie.split(";");
        for (let i = 0; i < cookieArr.length; i++) {
            let cookiePair = cookieArr[i].split("=");
            if (name === cookiePair[0].trim()) {
                return cookiePair[1];
            }
        }
        return null;
};

function deleteCookie(name) {
    document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
}

window.scrollAndFocus = function (elementId,direction) {
    var element = document.getElementById(elementId);
    if (direction == "up") {
        if (element) {
            element.focus();
            window.scroll({
                top: 0,
                behavior: 'auto'
            });
        }
    }
    else {
        if (element) {
            element.focus();
            window.scroll({
                top: element.offsetTop,
                behavior: 'auto'
            });
        }
    }
};

