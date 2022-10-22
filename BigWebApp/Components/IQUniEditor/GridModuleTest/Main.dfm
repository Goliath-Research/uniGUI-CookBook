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
  object IQUniModuleFormDesigner1: TIQUniModuleFormDesigner
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
    OnSaveModuleForm = IQUniModuleFormDesigner1SaveModuleForm
    OnLoadModuleForm = IQUniModuleFormDesigner1LoadModuleForm
    OnNewModuleForm = IQUniModuleFormDesigner1NewModuleForm
    OnLoadDialog = IQUniModuleFormDesigner1LoadDialog
    OnSaveDialog = IQUniModuleFormDesigner1SaveDialog
    OnNewDialog = IQUniModuleFormDesigner1NewDialog
  end
end
