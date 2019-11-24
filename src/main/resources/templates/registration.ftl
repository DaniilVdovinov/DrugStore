<#import 'includes/controls.ftl' as controls>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Регистрация</title>
    <link rel="stylesheet" href="../static/css/sign.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div>
    <#if message??>
        Пользователь с такими данными уже существует!
    </#if>
</div>

<form action="/registration" method="post" class="form-signin">
    <a href="/home">
        <img class="nav-img" style="width: 100%" src='../static/img/logo.png' alt='Logo.png' />
    </a>
    <h1 class="h1_project">
        РЕГИСТРАЦИЯ
    </h1>
    <@controls.input name="firstName" placeholder="Имя" type="text"/>
    <@controls.input name="lastName" placeholder="Фамилия" type="text"/>
    <@controls.input name="email" placeholder="Электронная почта" type="email"/>
    <@controls.input name="password" placeholder="Пароль" type="password"/>
    <div class="text-center">
        <@controls.csrf token="${ _csrf.token }"/>
        <@controls.button label="ВОЙТИ"/>
    </div>
    <script src="../static/js/registration.js"></script>

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