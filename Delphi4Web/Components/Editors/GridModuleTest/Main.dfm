object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 577
  ClientWidth = 845
  Caption = 'MainForm'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Layout = 'fit'
  PixelsPerInch = 96
  TextHeight = 13
  object D4WModuleFrmDsgnr1: TD4WModuleFrmDsgnr
    Left = 0
    Top = 0
    Width = 845
    Height = 577
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnNewModuleForm = D4WModuleFrmDsgnr1NewModuleForm
    OnSaveModuleForm = D4WModuleFrmDsgnr1SaveModuleForm
    OnLoadModuleForm = D4WModuleFrmDsgnr1LoadModuleForm
    OnLoadDialog = D4WModuleFrmDsgnr1LoadDialog
    OnSaveDialog = D4WModuleFrmDsgnr1SaveDialog
    OnNewDialog = D4WModuleFrmDsgnr1NewDialog
  end
end
