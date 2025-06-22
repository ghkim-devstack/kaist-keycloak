<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>${msg("loginTitle")}</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <!-- Loading Overlay -->
  <div class="loading-overlay" id="loadingOverlay">
    <div class="spinner"></div>
    <div class="loading-text">잠시만 기다려주세요(Please wait)...</div>
  </div>

  <!-- Main content -->
  <div class="login-container main-content" id="mainContent">
    <div class="login-box">
      <img class="logo" src="${url.resourcesPath}/img/kaist-logo.png" alt="KAIST" />

      <h1 class="login-header">로그인<span>(Login)</span></h1>

      <#if message?has_content>
        <#assign errorText = message.summary />
        <#if errorText == "Invalid username or password.">
	  <#assign errorText = "이메일 또는 비밀번호가 올바르지 않습니다.<br />(Invalid username or password.)" />
        </#if>
        <div class="kc-feedback-text">
          ${errorText?no_esc}
        </div>
      </#if>

      <form id="kc-form-login" action="${url.loginAction}" method="post">
        <h2 class="input-title">팀장 이메일(Email)</h2>
        <input type="email" id="username" name="username" value="${(login.username!'')}" required />

        <h2 class="input-title">비밀번호(Password)</h2>
        <input type="password" id="password" name="password" required />

        <button type="submit">Login</button>
      </form>

      <p class="register-link">
        계정이 없으신가요? <a href="${url.registrationUrl}">회원가입(Sign up)</a>
      </p>
    </div>
  </div>

  <script>
    window.addEventListener('load', function () {
      const img = new Image();
      img.onload = function () {
        hideLoader();
      };
      img.onerror = function () {
        hideLoader();
      };
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

