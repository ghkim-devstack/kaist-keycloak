<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>${msg("loginTitle")}</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
  <!-- Loading overlay -->
  <div class="loading-overlay" id="loadingOverlay">
    <div class="spinner"></div>
    <div class="loading-text">Please wait...</div>
  </div>

  <!-- Main contents -->
  <div class="main-content" id="mainContent">
    <div class="wrapper">
      <div class="login-panel">
        <img src="${url.resourcesPath}/img/kaist-logo.png" alt="KAIST" class="logo" />
        <h2 class="title">${msg("doLogIn")}</h2>

        <#-- Error message -->
        <#if message?has_content>
          <div class="kc-feedback-text">
            ${message.summary?no_esc}
          </div>
        </#if>

        <form id="kc-form-login" action="${url.loginAction}" method="post">
          <input type="text" id="username" name="username" value="${(login.username!'')}" placeholder="Team Name" required />
          <input type="password" id="password" name="password" placeholder="Password" required />
          <button type="submit">${msg("doLogIn")}</button>
        </form>

        <#-- Register link -->
        <p class="register">
          ${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a>
        </p>
      </div>

      <div class="description-panel">
        <h2>KAIST AI Contest Platform</h2>
        <p>
          KAIST AI 경진대회 참가자들을 위한 제출 및 평가 시스템입니다.<br /><br />
          JupyterHub 코드 서버, 노트북, 제출한 코드 채점, 실시간 랭킹 기능을 포함하고 있습니다.
        </p>
      </div>
    </div>
  </div>

  <script>
    // Wait until all resources are loaded
    window.addEventListener('load', function() {
      const img = new Image();
      img.onload = function() {
        hideLoader();
      };
      img.onerror = function() {
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
