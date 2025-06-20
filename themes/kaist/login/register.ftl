<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>${msg("registerTitle")}</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/register.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <div class="loading-overlay" id="loadingOverlay">
    <div class="spinner"></div>
    <div class="loading-text">잠시만 기다려주세요...</div>
  </div>

  <div class="register-container" id="mainContent">
    <div class="register-box">
      <img class="logo" src="${url.resourcesPath}/img/kaist-logo.png" alt="KAIST" />
      <h1 class="register-header">회원가입<span>(Register)</span></h1>

      <div class="notice-box">
	  <span class="notice-icon">💡</span>
	  <span>팀당 하나의 계정이 제공됩니다. <strong>회원가입은 팀장만 해주세요.</strong>
          <span class="sub-text"> (Only one account per team. Registration is for team leaders only.)</span>
	  </span>
	</div>

      <form id="kc-register-form" action="${url.registrationAction}" method="post">
        <#if message?has_content>
          <div class="kc-feedback-text">${message.summary?no_esc}</div>
        </#if>

        <label for="email">이메일(Email) <span class="required">*</span></label>
        <input type="email" id="email" name="email" value="${(register.formData.email!'')}" required />

        <label for="password">비밀번호(Password) <span class="required">*</span></label>
        <input type="password" id="password" name="password" required />

        <label for="password-confirm">비밀번호 확인(Confirm Password) <span class="required">*</span></label>
        <input type="password" id="password-confirm" name="password-confirm" required />

        <label for="firstName">이름(First Name) <span class="required">*</span></label>
        <input type="text" id="firstName" name="firstName" value="${(register.formData.firstName!'')}" required />

        <label for="lastName">성(Last Name) <span class="required">*</span></label>
        <input type="text" id="lastName" name="lastName" value="${(register.formData.lastName!'')}" required />

        <#if attributes??>
          <#list attributes?keys as fieldName>
            <label for="${fieldName}">${msg(fieldName)} <#if attributes[fieldName].required?? && attributes[fieldName].required><span class="required">*</span></#if></label>
            <input type="text" id="${fieldName}" name="${fieldName}" value="${(attributes[fieldName].value!'')}" <#if attributes[fieldName].required?? && attributes[fieldName].required>required</#if> />
          </#list>
        </#if>

        <#if recaptchaRequired?? && recaptchaRequired>
          <div class="g-recaptcha" data-sitekey="${recaptchaSiteKey}"></div>
        </#if>

        <button type="submit">${msg("doRegister")}</button>
      </form>

      <p class="back-link">
        <a href="${url.loginUrl}">← 로그인으로 돌아가기(Back to Login)</a>
      </p>
    </div>
  </div>

  <script>
    // Wait until all resources are loaded
    window.addEventListener('load', function() {
      const img = new Image();
      img.onload = hideLoader;
      img.onerror = hideLoader;
      img.src = '${url.resourcesPath}/img/star-bg2.webp';
    });

    function hideLoader() {
      const loadingOverlay = document.getElementById('loadingOverlay');
      const mainContent = document.getElementById('mainContent');
      loadingOverlay.classList.add('hidden');
      mainContent.classList.add('loaded');
      setTimeout(() => {
        loadingOverlay.style.display = 'none';
      }, 300);
    }

    setTimeout(hideLoader, 5000);
  </script>
</body>
</html>

