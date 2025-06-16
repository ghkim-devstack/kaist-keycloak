<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>KAIST AI Contest Login</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/login.css" />

</head>
<body>
    <div class="kc-container">
        <div class="kc-login-box">
            <h1 class="kc-title">KAIST AI Contest</h1>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <input type="text" id="username" name="username" placeholder="Team Name" autofocus />
                <input type="password" id="password" name="password" placeholder="Password" />
                
                <#if selectedCredential??>
                  <input type="hidden" name="credentialId" value="${selectedCredential.id}" />
                </#if>

                <button type="submit" name="login">Login</button>
            </form>

            <#if realm.password && realm.registrationAllowed>
                <p class="kc-register"><a href="${url.registrationUrl}">Registration</a></p>
            </#if>
        </div>
    </div>
</body>
</html>

