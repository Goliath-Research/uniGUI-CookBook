object FrmProdCloneShift: TFrmProdCloneShift
  Left = 263
  Top = 182
  HelpContext = 1064762
  ClientHeight = 248
  ClientWidth = 347
  Caption = 'Select Production Shift to Clone'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 347
    Height = 180
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet2
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet2: TUniTabSheet
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Opened'
      object gridDayProd: TUniDBGrid
        Left = 0
        Top = 0
        Width = 339
        Height = 152
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        DataSource = SrcDayprod
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTabs, dgCancelOnExit]
        LoadMask.Message = 'Loading data...'
        OnDblClick = btnOKClick
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'PROD_DATE'
            Title.Caption = 'Production Date'
            Width = 121
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SHIFT'
            Title.Caption = 'Shift'
            Width = 32
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MFGCELL'
            Title.Caption = 'Cell'
            Width = 101
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_ID'
            Title.Caption = 'EPlant ID'
            Width = 59
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 180
    Width = 347
    Height = 49
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ShowHint = True
    ParentShowHint = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 75
      Top = 1
      Width = 272
      Height = 47
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 5
        Top = 10
        Width = 119
        Height = 31
        Hint = 'Clone Shift'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 139
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 229
    Width = 347
    Height = 19
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <
      item
        Text = 'Filter: MfgCell '
        Width = 220
      end
      item
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object SrcDayprod: TDataSource
    DataSet = QryDayprod
    Left = 34
    Top = 125
  end
  object QryDayprod: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select prod_date,'
      '       shift,'
      '       mfgcell,'
      '       eplant_id'
      '  from v_dayprod_distinct'
      ' where NVL( RTrim(mfgcell), '#39'*'#39' ) = NVL(RTrim(:mfgcell), '#39'*'#39')'
      '   and not (prod_date = :prod_date and shift = :shift)'
      'order by '
      '       prod_date,'
      '       shift,'
      '       eplant_id '
      ' '
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 89
    Top = 117
    ParamData = <
      item
        Name = 'mfgcell'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'prod_date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'shift'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDayprodPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
    end
    object QryDayprodSHIFT: TBCDField
      FieldName = 'SHIFT'
      Size = 0
    end
    object QryDayprodMFGCELL: TStringField
      FieldName = 'MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryDayprodEPLANT_ID: TFMTBCDField
      FieldName = 'EPLANT_ID'
      Size = 38
    end
  end
end
