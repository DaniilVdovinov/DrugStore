<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="../static/css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body onscroll="show('btn-up')">
<nav class="navigation">
    <a href="/home">
        <img class="nav-img"
             src='../static/img/logo.png'
             alt='Logo.png'/>
    </a>
    <div class="login-out" style="right: 70px !important; top: 50px !important;">
        <form action="/logout" method="post" style="display: inline; float: right; padding-left: 3px">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-info btn-lg" type="submit">Выйти</button>
        </form>
        <form action="/profile" method="get" style="display: inline; float: right; padding-right: 3px">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-info btn-lg" type="submit">Профиль</button>
        </form>
    </div>
</nav>

<div class="searching-form">
    <div class="search-container">
        <#if items??>
            <div id="map"></div>
        </#if>
        <form action="/search" method="get">
            <div class="d-flew flex-row">
                <div>
                    <input id="name" name="name" type="text" class="form-control col-10"
                           placeholder="Введите название лекарства...">
                </div>
                <div>
                    <input class="btn btn-outline-info ml-3" type="submit" value="Поиск">
                </div>

                <#if items??>
                    <div class="btn-group">
                        <button type="button" class="btn btn-info dropdown-toggle mt-3"
                                data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                            Цена по
                        </button>
                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                            <a class="dropdown-item" href="/sort/sort">По возрастанию</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/sort/reverse">По убыванию</a>
                        </div>
                    </div>
                </#if>
            </div>
        </form>

    </div>
</div>

<a href="#" id="btn-up" title="Вернуться к началу" class="topbutton btn btn-outline-danger" style="display: none;">Наверх</a>

<#if error??>
</#if>
<div class="container">
    <#if items??>
        <table>
            <#list items as item>
                <div class="product-item">
                    <div class="row">
                        <div class="col-3">
                            <img src="${item.img}" id="img">
                        </div>
                        <div class="col-9">
                            <h3>${item.name}</h3>
                            <span class="price1">Стоимость: ${item.price} руб.</span>
                            <p><a href="${item.href}" target="_blank"> В аптеку</a></p>
                        </div>
                        <#--                    <div class="col-2">-->
                        <#--                        <input type="submit" aria-label="Favorite" id="${item.href}" name="${item.href}" onclick="sendHref(${item.href})" value="В избранное">-->
                        <#--                    </div>-->
                        <hr width="700" color="#38a0a6" size="2">
                    </div>
                </div>
            </#list>
        </table>
    </#if>
</div>

<link rel="stylesheet" href="../static/css/home.css">
<script src="../static/js/home.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://api-maps.yandex.ru/2.1/?apikey=f2063206-fe46-4935-9921-9abf9987ebec&lang=ru_RU"
        type="text/javascript"></script>
<script src="../static/js/map/Map.js"></script>
<script src="../static/js/map/AptekaRu.js"></script>
<script src="../static/js/map/Sakura.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>