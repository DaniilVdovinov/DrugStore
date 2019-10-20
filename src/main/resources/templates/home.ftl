<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search</title>
</head>
<body>
<div class="searching-class">
    <form action="/search" method="get">
        <input name="name" type="text" class="form-control" placeholder="Введите название лекарства...">
        <input type="submit" value="Поиск">
    </form>
    <a href="/sort/sort">По возрастанию</a>
    <a href="/sort/reverse">По убыванию</a>
</div>
<#if items??>
    <table>
        <#list items as item>
            <img src="${item.img}" alt="">
            <h3>${item.name}</h3>
            <span>Стоимость: ${item.price}</span>
            <p><a href="${item.href}">В аптеку</a></p>
        </#list>
    </table>
</#if>
</body>
</html>