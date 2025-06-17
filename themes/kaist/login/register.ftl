<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>${msg("registerTitle")}</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css" />
</head>
<body>
  <div class="wrapper">
    <div class="login-panel">
      <img src="${url.resourcesPath}/img/kaist-logo.png" alt="KAIST" class="logo" />
      <h2 class="title">Register</h2>

      <form id="kc-register-form" action="${url.registrationAction}" method="post">
        <#-- ✅ 에러 메시지 출력 -->
        <#if message?has_content>
          <div class="kc-feedback-text" style="color: #ff4d4d; margin-bottom: 20px;">
            ⚠ ${message.summary?no_esc}
          </div>
        </#if>

        <#if !realm.registrationEmailAsUsername>
          <input type="text" id="username" name="username"
              value="${(register.formData.username!'')}" placeholder="Team Name" required />
        </#if>

        <input type="email" id="email" name="email"
            value="${(register.formData.email!'')}" placeholder="Email" required />

        <input type="text" id="firstName" name="firstName"
            value="${(register.formData.firstName!'')}" placeholder="First Name" required />

        <input type="text" id="lastName" name="lastName"
            value="${(register.formData.lastName!'')}" placeholder="Last Name" required />

        <input type="password" id="password" name="password"
            placeholder="Password" required />

        <input type="password" id="password-confirm" name="password-confirm"
            placeholder="Confirm Password" required />

        <#-- 🔧 Optional custom attributes -->
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

      <p class="register"><a href="${url.loginUrl}">« Back to Login</a></p>
    </div>
  </div>
</body>
</html>

