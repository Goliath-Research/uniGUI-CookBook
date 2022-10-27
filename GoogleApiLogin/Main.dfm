object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 561
  ClientWidth = 785
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAjaxEvent = UniFormAjaxEvent
  PixelsPerInch = 96
  TextHeight = 13
  object UniHTMLFrame1: TUniHTMLFrame
    Left = 32
    Top = 8
    Width = 113
    Height = 49
    Hint = ''
    HTML.Strings = (
      '<a href="#" onclick="signOut();">Sign out</a>'
      '<script>'
      '  function signOut() {'
      '    var auth2 = gapi.auth2.getAuthInstance();'
      '    auth2.signOut().then(function () {'
      '      ajaxRequest(MainForm.form, "logout", []);'
      '    });'
      '  }'
      '</script>')
  end
end
