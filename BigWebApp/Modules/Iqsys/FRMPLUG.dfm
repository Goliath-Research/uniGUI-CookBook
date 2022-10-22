object FrmGetGLPlugInValue: TFrmGetGLPlugInValue
  Left = 200
  Top = 108
  ClientHeight = 134
  ClientWidth = 270
  Caption = 'Assign ECode GL/Plug-In'
  OnShow = UniFormShow
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  ActiveControl = edPlugVal
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 5
    Top = 5
    Width = 260
    Height = 92
    Hint = ''
    TabOrder = 3
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 16
    Top = 17
    Width = 87
    Height = 13
    Hint = ''
    Caption = 'GL Segment Name'
    TabOrder = 4
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
    Left = 136
    Top = 41
    Width = 33
    Height = 19
    Hint = ''
    DataField = 'GROUP_LENGTH'
    DataSource = SrcGlAcctDef
    TabOrder = 1
    Color = clBtnFace
  end
  object wwDBLookupSegment: TUniDBLookupComboBox
    Left = 136
    Top = 13
    Width = 122
    Height = 21
    Hint = ''
    ListField = 'GROUP_NAME;GROUP_START;GROUP_LENGTH;FILL_CHAR;SEP_CHAR;SEQ'
    ListSource = SrcGlAcctDef
    KeyField = 'GROUP_NAME'
    ListFieldIndex = 0
    TabOrder = 0
    Color = clWindow
  end
  object btnOK: TUniButton
    Left = 67
    Top = 105
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 7
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 168
    Top = 105
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
  end
  object edPlugVal: TUniEdit
    Left = 136
    Top = 66
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object TblGlAcctDef: TFDTable
    IndexName = 'PK_GLACCT_DEF'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT_DEF'
    TableName = 'GLACCT_DEF'
    Left = 22
    Top = 77
  end
  object SrcGlAcctDef: TDataSource
    DataSet = TblGlAcctDef
    Left = 96
    Top = 80
  end
end
