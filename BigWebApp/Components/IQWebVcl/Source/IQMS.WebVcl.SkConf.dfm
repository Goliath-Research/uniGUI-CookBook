object FrmConfirmLocationInSkid: TFrmConfirmLocationInSkid
  Left = 243
  Top = 212
  ClientHeight = 262
  ClientWidth = 426
  Caption = 'Confirm Skid Contents Change  '
  OnShow = FormShow
  BorderStyle = bsSingle
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TUniPanel
    Tag = 1999
    Left = 0
    Top = 38
    Width = 426
    Height = 183
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 424
      Height = 181
      Hint = ''
      Caption = '  Transa Item in the Skid  '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Panel3: TUniPanel
        Tag = 1999
        Left = 2
        Top = 15
        Width = 420
        Height = 164
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 85
          Top = 0
          Width = 6
          Height = 164
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft2: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 85
          Height = 162
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label5: TUniLabel
            Left = 14
            Top = 12
            Width = 25
            Height = 13
            Hint = ''
            Caption = 'Class'
            TabOrder = 1
          end
          object Label6: TUniLabel
            Left = 14
            Top = 36
            Width = 33
            Height = 13
            Hint = ''
            Caption = 'Item #'
            TabOrder = 2
          end
          object Label1: TUniLabel
            Left = 14
            Top = 84
            Width = 40
            Height = 13
            Hint = ''
            Caption = 'Location'
            TabOrder = 3
          end
          object Label2: TUniLabel
            Left = 14
            Top = 108
            Width = 26
            Height = 13
            Hint = ''
            Caption = 'Lot #'
            TabOrder = 4
          end
          object Label3: TUniLabel
            Left = 14
            Top = 132
            Width = 42
            Height = 13
            Hint = ''
            Caption = 'On Hand'
            TabOrder = 5
          end
          object Label7: TUniLabel
            Left = 16
            Top = 60
            Width = 19
            Height = 13
            Hint = ''
            Caption = 'Rev'
            TabOrder = 6
          end
        end
        object Panel5: TUniPanel
          Tag = 1999
          Left = 91
          Top = 1
          Width = 329
          Height = 162
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            329
            162)
          object DBEdit5: TUniDBEdit
            Left = 1
            Top = 8
            Width = 23
            Height = 21
            Hint = ''
            DataField = 'CLASS'
            DataSource = DataSource1
            TabOrder = 0
            TabStop = False
            Color = clBtnFace
          end
          object DBEdit6: TUniDBEdit
            Left = 1
            Top = 32
            Width = 325
            Height = 21
            Hint = ''
            DataField = 'ITEMNO'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            TabStop = False
            Color = clBtnFace
          end
          object DBEdit1: TUniDBEdit
            Left = 1
            Top = 80
            Width = 325
            Height = 21
            Hint = ''
            DataField = 'LOC_DESC'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            TabStop = False
            Color = clBtnFace
          end
          object DBEdit2: TUniDBEdit
            Left = 1
            Top = 104
            Width = 325
            Height = 21
            Hint = ''
            DataField = 'LOTNO'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            TabStop = False
            Color = clBtnFace
          end
          object DBEdit3: TUniDBEdit
            Left = 1
            Top = 128
            Width = 64
            Height = 21
            Hint = ''
            DataField = 'ONHAND'
            DataSource = DataSource1
            TabOrder = 4
            TabStop = False
            Color = clBtnFace
          end
          object DBEdit7: TUniDBEdit
            Left = 1
            Top = 56
            Width = 94
            Height = 21
            Hint = ''
            DataField = 'REV'
            DataSource = DataSource1
            TabOrder = 5
            TabStop = False
            Color = clBtnFace
          end
        end
      end
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 221
    Width = 426
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 211
      Top = 1
      Width = 215
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 3
        TabOrder = 1
      end
      object btnIgnore: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Ignore'
        ModalResult = 1
        TabOrder = 2
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 426
    Height = 38
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 113
      Top = 0
      Width = 6
      Height = 38
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft1: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 113
      Height = 36
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label4: TUniLabel
        Left = 7
        Top = 12
        Width = 59
        Height = 13
        Hint = ''
        Caption = 'Skid Serial #'
        TabOrder = 1
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 119
      Top = 1
      Width = 307
      Height = 36
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object DBEdit4: TUniDBEdit
        Left = 1
        Top = 8
        Width = 129
        Height = 21
        Hint = ''
        DataField = 'SERIAL'
        DataSource = DataSource1
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
      end
    end
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       l.loc_desc, '
      '       f.lotno, '
      '       f.onhand, '
      '       m.serial'
      '  from locations l, fgmulti f, master_label m, arinvt a'
      ' where f.id = :fgmulti_id'
      '   and f.loc_id = l.id'
      '   and f.master_label_id = m.id'
      '   and a.id = f.arinvt_id')
    Left = 224
    Top = 124
    ParamData = <
      item
        Name = 'fgmulti_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1LOC_DESC: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOC_DESC'
      Origin = 'LOCATIONS.LOC_DESC'
      Size = 30
    end
    object Query1LOTNO: TStringField
      DisplayLabel = 'Lot #'
      FieldName = 'LOTNO'
      Origin = 'FGMULTI.LOTNO'
      Size = 25
    end
    object Query1ONHAND: TBCDField
      DisplayLabel = 'On Hand'
      FieldName = 'ONHAND'
      Origin = 'FGMULTI.ONHAND'
    end
    object Query1SERIAL: TStringField
      DisplayLabel = 'Skid Serial #'
      FieldName = 'SERIAL'
      Origin = 'MASTER_LABEL.SERIAL'
      Size = 13
    end
    object Query1CLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'ARINVT.CLASS'
      Size = 2
    end
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'ARINVT.ITEMNO'
      Size = 50
    end
    object Query1REV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'ARINVT.REV'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 264
    Top = 124
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfirmLocationInSkid')
    SecurityItems.Strings = (
      'btnIgnore')
    SecurityCode = 'FRMCONFIRM_LOCATION_IN_SKID'
    Left = 312
    Top = 122
  end
end
