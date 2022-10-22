object FrmConfAlloc: TFrmConfAlloc
  Left = 306
  Top = 273
  ClientHeight = 127
  ClientWidth = 440
  Caption = 'Reason'
  OnShow = FormShow
  Constraints.MinHeight = 165
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 90
    Width = 440
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 118
      Top = 1
      Width = 322
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnNonConformMasterReason: TUniButton
        Left = 1
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Reasons'
        TabOrder = 1
        OnClick = btnNonConformMasterReasonClick
      end
      object BtnOk: TUniButton
        Left = 109
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 2
        Default = True
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 218
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        TabOrder = 3
        OnClick = BtnCancelClick
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 440
    Height = 90
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 90
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 81
      Height = 88
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Reason'
        TabOrder = 1
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 87
      Top = 1
      Width = 353
      Height = 88
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 84
      ExplicitWidth = 356
      DesignSize = (
        353
        88)
      object CmbReason: TUniDBLookupComboBox
        Left = 1
        Top = 8
        Width = 351
        Height = 21
        Hint = ''
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clWindow
      end
      object chkApplyToLot: TUniCheckBox
        Left = 1
        Top = 34
        Width = 133
        Height = 17
        Hint = ''
        Caption = 'Apply to Lot Number'
        TabOrder = 1
      end
      object chkAllocatble: TUniCheckBox
        Left = 1
        Top = 53
        Width = 89
        Height = 17
        Hint = ''
        Caption = 'Allocatable'
        TabOrder = 2
      end
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfAlloc')
    SecurityItems.Strings = (
      'btnNonConformMasterReason'
      'chkAllocatble'
      'chkApplyToLot')
    SecurityCode = 'FRMCONFALLOC'
    Left = 128
    Top = 5
  end
  object wwQuery1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'Select descrip, code '
      '  from non_conform '
      'where NVL('#39'pk_hide'#39', '#39'N'#39') = '#39'N'#39
      ' order by descrip')
    Left = 200
    Top = 3
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.NON_CONFORM.DESCRIP'
      Size = 30
    end
    object wwQuery1CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'IQ.NON_CONFORM.CODE'
      Size = 10
    end
  end
end
