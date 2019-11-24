// function sender(href) {
//     console.log(href);
//     $.ajax({
//         type: 'post',
//         url: '/search/add',
//         data: {
//             href: href
//         }
//     })
// }

function sendHref(href) {
    $.ajax({
        type: 'get',
        url: '/add?href=' + href,
        data: {
            href: href
        }
    }).done(function (data) {
        location.reload();
    })
}

function show(id) {
    let elem = document.getElementById(id);
    let state = elem.style.display;
    if (state === 'none') elem.style.display = '';
}