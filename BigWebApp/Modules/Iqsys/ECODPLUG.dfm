object FrmGetGLPlugInValue: TFrmGetGLPlugInValue
  Left = 200
  Top = 108
  ClientHeight = 136
  ClientWidth = 282
  Caption = 'Assign GL Plug-In'
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 5
    Top = 5
    Width = 276
    Height = 92
    Hint = ''
    TabOrder = 2
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 16
    Top = 17
    Width = 87
    Height = 13
    Hint = ''
    Caption = 'GL Segment Name'
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 16
    Top = 44
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Length'
    TabOrder = 5
  end
  object Label3: TUniLabel
    Left = 16
    Top = 70
    Width = 78
    Height = 13
    Hint = ''
    Caption = 'GL Plug-In Value'
    TabOrder = 6
  end
  object DBEdit2: TUniDBEdit
    Left = 152
    Top = 41
    Width = 33
    Height = 19
    Hint = ''
    DataField = 'GROUP_LENGTH'
    DataSource = SrcGlAcctDef
    TabOrder = 0
    Color = clBtnFace
  end
  object wwDBLookupSegment: TUniDBLookupComboBox
    Left = 152
    Top = 13
    Width = 122
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    DataField = 'GROUP_NAME'
    DataSource = SrcGlAcctDef
    TabOrder = 1
    Color = clWindow
  end
  object btnOK: TUniButton
    Left = 83
    Top = 105
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 7
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 184
    Top = 105
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
  end
  object edPlugVal: TUniEdit
    Left = 152
    Top = 66
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object TblGlAcctDef: TFDTable
    IndexName = 'PK_GLACCT_DEF'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT_DEF'
    TableName = 'GLACCT_DEF'
    Left = 6
    Top = 93
  end
  object SrcGlAcctDef: TDataSource
    DataSet = TblGlAcctDef
    Left = 8
    Top = 64
  end
end
