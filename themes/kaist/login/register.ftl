<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>${msg("registerTitle")}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/login.css" />
</head>
<body>
    <div class="kc-container">
        <div class="kc-login-box">
            <h1 class="kc-title">Register for KAIST AI Contest</h1>

            <form id="kc-register-form" action="${url.registrationAction}" method="post">

                <#-- ✅ 에러 메시지 출력 -->
                <#if message?has_content>
                    <div class="kc-feedback-text" style="color: #ff4d4d; margin-bottom: 20px;">
                        ⚠ ${message.summary?no_esc}
                    </div>
                </#if>

                <#if !realm.registrationEmailAsUsername>
                    <input type="text" id="username" name="username"
                        value="${(register.formData.username!'')}" placeholder="Team name" required />
                </#if>

                <input type="email" id="email" name="email"
                    value="${(register.formData.email!'')}" placeholder="Email" required />

                <input type="password" id="password" name="password"
                    placeholder="Password" required />

                <input type="password" id="password-confirm" name="password-confirm"
                    placeholder="Confirm password" required />

                <#-- 🔧 Optional dynamic fields -->
                <#if attributes??>
                    <#list attributes?keys as fieldName>
                        <input type="text" name="${fieldName}" 
                            value="${(attributes[fieldName].value!'')}" 
                            placeholder="${msg(fieldName)}"
                            <#if attributes[fieldName].required?? && attributes[fieldName].required>required</#if> />
                    </#list>
                </#if>

                <#if recaptchaRequired?? && recaptchaRequired>
                    <div class="g-recaptcha" data-sitekey="${recaptchaSiteKey}"></div>
                </#if>

                <button type="submit">${msg("doRegister")}</button>
            </form>

            <p class="kc-register"><a href="${url.loginUrl}">« Back to Login</a></p>
        </div>
    </div>
</body>
</html>

