object FrmPoReleases: TFrmPoReleases
  Left = 67
  Top = 167
  HelpContext = 997582
  ClientHeight = 270
  ClientWidth = 599
  Caption = 'Releases for PO Detail'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 599
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      599
      27)
    object Shape1: TUniPanel
      Left = 554
      Top = 8
      Width = 10
      Height = 11
      Hint = 'Received'
      ShowHint = True
      ParentShowHint = False
      Anchors = [akTop, akRight]
      TabOrder = 1
      Caption = ''
    end
    object Shape2: TUniPanel
      Left = 567
      Top = 8
      Width = 10
      Height = 11
      Hint = 'Not Received'
      ShowHint = True
      ParentShowHint = False
      Anchors = [akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Shape3: TUniPanel
      Left = 580
      Top = 8
      Width = 10
      Height = 11
      Hint = 'Partially Received'
      ShowHint = True
      ParentShowHint = False
      Anchors = [akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 599
    Height = 204
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 382
    IQComponents.Grid.Height = 118
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcRel
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcRel
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 382
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 118
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcRel
    Columns = <
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promise Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QUAN'
        Title.Caption = 'Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY_LEFT_ONORDER'
        Title.Caption = 'Left To Recv'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REQUEST_DATE'
        Title.Caption = 'Request Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSER1'
        Title.Caption = 'Comment'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object pnlBottomButtons: TUniPanel
    Left = 0
    Top = 231
    Width = 599
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel3: TUniPanel
      Left = 296
      Top = 1
      Width = 303
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnAssignQty: TUniButton
        Left = 6
        Top = 7
        Width = 90
        Height = 25
        Hint = ''
        Caption = 'Assign Qty'
        TabOrder = 1
        OnClick = btnAssignQtyClick
      end
      object btnAssignRelease: TUniButton
        Left = 107
        Top = 7
        Width = 90
        Height = 25
        Hint = ''
        Caption = 'Assign Release'
        TabOrder = 2
        OnClick = btnAssignReleaseClick
      end
      object btnCancel: TUniButton
        Left = 208
        Top = 7
        Width = 90
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 3
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 216
    Top = 104
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcRel: TDataSource
    DataSet = QryRel
    Left = 160
    Top = 104
  end
  object QryRel: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.po_releases_id,'
      '       v.po_detail_id,'
      '       v.request_date,'
      '       v.promise_date,'
      '       v.quan,'
      '       v.qty_left_onorder,'
      '       p.cuser1'
      '  from v_po_releases_cum v,'
      '       po_releases p'
      ' where v.po_releases_id = p.id(+)'
      '   and v.po_detail_id = :AID'
      '')
    Left = 176
    Top = 104
    ParamData = <
      item
        Name = 'AId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryRelPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promise Date'
      DisplayWidth = 14
      FieldName = 'PROMISE_DATE'
      Origin = 'v.PROMISE_DATE'
    end
    object QryRelQUAN: TBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 13
      FieldName = 'QUAN'
      Origin = 'v.QUAN'
    end
    object QryRelQTY_LEFT_ONORDER: TFMTBCDField
      DisplayLabel = 'Left To Recv'
      DisplayWidth = 13
      FieldName = 'QTY_LEFT_ONORDER'
      Origin = 'v.QTY_LEFT_ONORDER'
      Size = 38
    end
    object QryRelREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Request Date'
      DisplayWidth = 15
      FieldName = 'REQUEST_DATE'
      Origin = 'v.REQUEST_DATE'
    end
    object QryRelCUSER1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 35
      FieldName = 'CUSER1'
      Origin = 'p.CUSER1'
      Size = 255
    end
    object QryRelPO_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PO_DETAIL_ID'
      Origin = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryRelPO_RELEASES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PO_RELEASES_ID'
      Origin = 'PO_RELEASES_ID'
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Releases for PO Detail'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192730 $'
    BuildVersion = '176554'
    Left = 96
    Top = 107
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnAssignQty'
      'btnAssignRelease')
    SecurityCode = 'FRMPORELEASES'
    Left = 248
    Top = 104
  end
end
