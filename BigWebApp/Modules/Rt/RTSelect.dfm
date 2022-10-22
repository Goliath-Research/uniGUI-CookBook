object FrmSelection: TFrmSelection
  Left = 524
  Top = 177
  HelpContext = 1059663
  ClientHeight = 461
  ClientWidth = 318
  Caption = 'Selection Criteria'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    318
    461)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TUniPanel
    Left = 0
    Top = 427
    Width = 318
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 104
      Top = 1
      Width = 214
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 9
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 111
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 427
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 316
      Height = 425
      Hint = ''
      Caption = ' Manufacturing Type or Cell '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Splitter1: TUniSplitter
        Left = 0
        Top = 210
        Width = 316
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object bvlSplitMfgtypeCell: TUniPanel
        Left = 2
        Top = 213
        Width = 312
        Height = 2
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Caption = ''
      end
      object pnlMfgType: TUniPanel
        Left = 2
        Top = 15
        Width = 312
        Height = 210
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = 'pnlMfgType'
        OnResize = pnlMfgTypeResize
        object bvlMfgType01: TUniPanel
          Left = 1
          Top = 49
          Width = 18
          Height = 161
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 4
          Caption = ''
        end
        object DBGridMfgType: TUniDBGrid
          Left = 18
          Top = 49
          Width = 294
          Height = 161
          Hint = ''
          DataSource = SrcQryMfgType
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgCancelOnExit]
          LoadMask.Message = 'Loading data...'
          OnDblClick = DBGridMfgTypeDblClick
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          TabStop = False
          Columns = <
            item
              FieldName = 'MFGTYPE'
              Title.Caption = 'MfgType'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STANDARD_MFGTYPE'
              Title.Caption = 'Default (Base)'
              Width = 125
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        object pnlMfgTypeRadioBtn: TUniPanel
          Left = 1
          Top = 1
          Width = 310
          Height = 22
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object rbAllCells: TUniCheckBox
            Left = 1
            Top = 1
            Width = 113
            Height = 17
            Hint = ''
            Checked = True
            Caption = '&Manufacturing Type'
            TabOrder = 0
            OnClick = SetButtons
          end
        end
        object pnlMfgtypeSearch: TUniPanel
          AlignWithMargins = True
          Left = 18
          Top = 22
          Width = 294
          Height = 27
          Hint = ''
          Margins.Left = 18
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Caption = ''
        end
      end
      object pnlMfgCell: TUniPanel
        Left = 2
        Top = 215
        Width = 312
        Height = 210
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = 'pnlMfgCell'
        object bvlMfgCell01: TUniPanel
          Left = 1
          Top = 49
          Width = 18
          Height = 161
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 4
          Caption = ''
        end
        object DBGridCell: TUniDBGrid
          Left = 18
          Top = 49
          Width = 294
          Height = 161
          Hint = ''
          DataSource = SrcQryCell
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          LoadMask.Message = 'Loading data...'
          OnDblClick = DBGridMfgTypeDblClick
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          TabStop = False
          Columns = <
            item
              FieldName = 'MFGCELL'
              Title.Caption = 'MFG Cell'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'MFG Type'
              Width = 96
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PLANT_NAME'
              Title.Caption = 'EPlant Name'
              Width = 76
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        object pnlMfgCellRadioBtn: TUniPanel
          Left = 1
          Top = 1
          Width = 310
          Height = 22
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object rbOneCell: TUniCheckBox
            Left = 1
            Top = 1
            Width = 68
            Height = 17
            Hint = ''
            Caption = 'One &Cell'
            TabOrder = 0
            OnClick = SetButtons
          end
        end
        object pnlSearchMfgcell: TUniPanel
          AlignWithMargins = True
          Left = 18
          Top = 22
          Width = 294
          Height = 27
          Hint = ''
          Margins.Left = 18
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Caption = ''
          DesignSize = (
            294
            27)
          object wwIncrementalSearchMfgcell: TwwIncrementalSearch
            Left = 0
            Top = 1
            Width = 294
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataSource = SrcQryCell
            SearchField = 'MFGCELL'
            TabOrder = 1
          end
        end
      end
    end
  end
  object wwIncrementalSearchMfgType: TwwIncrementalSearch
    Left = 20
    Top = 40
    Width = 294
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataSource = SrcQryMfgType
    SearchField = 'MFGTYPE'
    TabOrder = 2
  end
  object QryCell: TFDQuery
    BeforeOpen = QryCellBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c.id as mfgcell_id,'
      '       c.mfgcell, '
      '       c.mfgtype,'
      '       m.descrip,'
      '       c.eplant_id,'
      '       e.name as plant_name'
      '  from v_mfgcell c, '
      '       mfgtype m,'
      '       eplant e'
      ' where c.mfgtype = m.mfgtype(+)'
      '   and c.eplant_id = e.id(+)'
      'order by mfgcell'
      ' ')
    Left = 52
    Top = 156
    object QryCellMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Size = 15
    end
    object QryCellMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Size = 10
    end
    object QryCellDESCRIP: TStringField
      FieldName = 'DESCRIP'
    end
    object QryCellEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryCellPLANT_NAME: TStringField
      FieldName = 'PLANT_NAME'
      Size = 30
    end
    object QryCellMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Size = 0
    end
  end
  object SrcQryCell: TDataSource
    DataSet = QryCell
    Left = 84
    Top = 156
  end
  object QryMfgType: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from v_mfgtype_ex'
      'order by mfgtype')
    Left = 52
    Top = 104
    object QryMfgTypeMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Size = 10
    end
    object QryMfgTypeDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'MFGTYPE.DESCRIP'
    end
    object QryMfgTypeSTANDARD_MFGTYPE: TStringField
      FieldName = 'STANDARD_MFGTYPE'
      Origin = 'IQ.V_MFGTYPE_EX.STANDARD_MFGTYPE'
      Size = 10
    end
  end
  object SrcQryMfgType: TDataSource
    DataSet = QryMfgType
    Left = 84
    Top = 104
  end
end
