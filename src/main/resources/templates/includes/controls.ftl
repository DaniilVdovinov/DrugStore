<#macro input name placeholder="" value="" type="text" is_required=false is_autofocus=false>
    <div class="form-group">
        <input class="form__input form-control" name="${name}" placeholder="${placeholder}" type="${type}"
               <#if is_required>required</#if> <#if is_autofocus>autofocus</#if>>
    </div>
</#macro>

<#macro csrf token>
    <input type="hidden" name="_csrf" value="${ token }">
</#macro>

<#macro button label>
    <div class="form-group">
        <button class="btn btn-info form_button">${label}</button>
    </div>
</#macro>