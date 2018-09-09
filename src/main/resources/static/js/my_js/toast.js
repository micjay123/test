function showNotice(msg) {
    var toast = $('.toast');
    $('#toast-body')[0].innerHTML = msg;
    toast.fadeIn().delay(2000).fadeOut();
}
