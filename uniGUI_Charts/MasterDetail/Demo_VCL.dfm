object DemoVCL: TDemoVCL
  Left = 0
  Top = 0
  Caption = 'Demo VCL Application (using MasterDetailFrame)'
  ClientHeight = 475
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object frmMasterDetail1: TfrmMasterDetail
    Left = 0
    Top = 0
    Width = 624
    Height = 475
    Align = alClient
    TabOrder = 0
    MasterDataSource = dmDemoVCL.dsPersons
    DetailDataSource = dmDemoVCL.dsCars
  end
end
