object UniGoogleLoginForm: TUniGoogleLoginForm
  Left = 0
  Top = 0
  ClientHeight = 50
  ClientWidth = 106
  Caption = 'GoogleSignIn'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Layout = 'fit'
  LayoutAttribs.Align = 'stretch'
  OnBeforeShow = UniLoginFormBeforeShow
  OnAjaxEvent = UniLoginFormAjaxEvent
  TextHeight = 15
  object UniHTMLFrame1: TUniHTMLFrame
    Left = 0
    Top = 0
    Width = 105
    Height = 49
    Hint = ''
    HTML.Strings = (
      '<html lang="en">'
      ''
      '<head>'
      '    <meta name="google-signin-scope" content="profile email">'
      
        '    <meta name="google-signin-client_id" content="679905286098-4' +
        'der25sucnu0lkhlgiipuul48m0gp979.apps.googleusercontent.com">'
      
        '    <script src="https://apis.google.com/js/platform.js" async d' +
        'efer></script>'
      '</head>'
      ''
      '<body>'
      
        '    <div class="g-signin2" data-onsuccess="onSignIn" data-theme=' +
        '"dark"></div>'
      '    <script>'
      '        function onSignIn(googleUser) {'
      '            var profile = googleUser.getBasicProfile();'
      '            var name = profile.getName();'
      '            var email = profile.getEmail();'
      '            var image = profile.getImageUrl();'
      
        '            var id_token = googleUser.getAuthResponse().id_token' +
        ';'
      '            '
      '            ajaxRequest'
      '            ('
      '               UniGoogleLoginForm.form, '
      '               "success", '
      
        '               ["Name=" + name, "Email=" + email, "ImageURL=" + ' +
        'image, "Token=" + id_token]'
      '            );'
      '        }'
      ''
      '        function onFailure(error) {'
      
        '            ajaxRequest(UniGoogleLoginForm.form, "failure", ["Er' +
        'ror=" + error]);'
      '        }'
      '    </script>'
      '</body>'
      ''
      '</html>')
    Align = alCustom
  end
end
