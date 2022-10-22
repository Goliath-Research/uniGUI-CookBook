object FrmLaborOverhead: TFrmLaborOverhead
  Left = 363
  Top = 251
  ClientHeight = 185
  ClientWidth = 563
  Caption = 'Labor and Overhead'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -15
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TUniPanel
    Left = 0
    Top = 139
    Width = 563
    Height = 46
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 609
    object Panel2: TUniPanel
      Left = 308
      Top = 1
      Width = 255
      Height = 44
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 266
      object btnOk: TUniButton
        Left = 2
        Top = 6
        Width = 120
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&OK'
        ParentFont = False
        Font.Height = -15
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 128
        Top = 6
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Cancel'
        ModalResult = 2
        ParentFont = False
        Font.Height = -15
        TabOrder = 2
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 563
    Height = 139
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 525
    object Splitter2: TUniSplitter
      Left = 262
      Top = 0
      Width = 4
      Height = 139
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 294
      ExplicitTop = 4
    end
    object PnlOverhead: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 262
      Height = 137
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      TabOrder = 0
      Caption = ''
      object gbOverhead: TUniGroupBox
        Left = 1
        Top = 1
        Width = 260
        Height = 135
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Overhead '
        Align = alClient
        TabOrder = 0
        ParentFont = False
        Font.Height = -15
        ExplicitTop = -5
        object Panel3: TUniPanel
          Tag = 1999
          Left = 2
          Top = 20
          Width = 256
          Height = 113
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 96
            Top = 0
            Width = 4
            Height = 113
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
            ExplicitHeight = 114
          end
          object PnlOverheadLeft: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 96
            Height = 111
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitHeight = 112
            object Label1: TUniLabel
              Left = 10
              Top = 5
              Width = 78
              Height = 18
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Center Rate'
              ParentFont = False
              Font.Height = -15
              TabOrder = 1
            end
            object Label3: TUniLabel
              Left = 10
              Top = 34
              Width = 38
              Height = 18
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Hours'
              ParentFont = False
              Font.Height = -15
              TabOrder = 2
            end
            object Label5: TUniLabel
              Left = 10
              Top = 63
              Width = 33
              Height = 18
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Total'
              ParentFont = False
              Font.Height = -15
              TabOrder = 3
            end
          end
          object PnlOverheadClient: TUniPanel
            Tag = 1999
            Left = 100
            Top = 1
            Width = 156
            Height = 111
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            TabOrder = 1
            Caption = ''
            ExplicitWidth = 152
            object cbWc: TUniDBLookupComboBox
              Left = 1
              Top = 1
              Width = 149
              Height = 26
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ListField = 'CNTR_RATE;CNTR_DESC'
              ListSource = ds_WorkCtr
              KeyField = 'EQNO'
              ListFieldIndex = 0
              ParentFont = False
              Font.Height = -15
              TabOrder = 0
              Color = clWindow
              OnCloseUp = cbWcCloseUp
            end
            object edWCHrs: TUniEdit
              Left = 1
              Top = 30
              Width = 149
              Height = 24
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Text = ''
              ParentFont = False
              Font.Height = -15
              TabOrder = 1
              OnExit = edWCHrsExit
            end
            object edWCTotal: TUniEdit
              Left = 1
              Top = 59
              Width = 149
              Height = 24
              Cursor = crArrow
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Text = ''
              ParentFont = False
              Font.Height = -15
              TabOrder = 2
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
          end
        end
      end
    end
    object PnlLabor: TUniPanel
      Tag = 1999
      Left = 266
      Top = 1
      Width = 297
      Height = 137
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 259
      object gbLabor: TUniGroupBox
        Left = 1
        Top = 1
        Width = 295
        Height = 135
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Labor '
        Align = alClient
        TabOrder = 0
        ParentFont = False
        Font.Height = -15
        ExplicitWidth = 257
        object PnlLaborGroup: TUniPanel
          Tag = 1999
          Left = 2
          Top = 20
          Width = 291
          Height = 113
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          TabOrder = 0
          Caption = ''
          ExplicitWidth = 337
          object Splitter3: TUniSplitter
            Left = 90
            Top = 0
            Width = 4
            Height = 113
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
            ExplicitHeight = 114
          end
          object PnlLaborLeft: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 90
            Height = 111
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitHeight = 112
            object Label2: TUniLabel
              Left = 10
              Top = 5
              Width = 71
              Height = 18
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Labor Rate'
              ParentFont = False
              Font.Height = -15
              TabOrder = 1
            end
            object Label4: TUniLabel
              Left = 10
              Top = 34
              Width = 38
              Height = 18
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Hours'
              ParentFont = False
              Font.Height = -15
              TabOrder = 2
            end
            object Label6: TUniLabel
              Left = 10
              Top = 63
              Width = 33
              Height = 18
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Total'
              ParentFont = False
              Font.Height = -15
              TabOrder = 3
            end
          end
          object PnlLaborClient: TUniPanel
            Tag = 1999
            Left = 94
            Top = 1
            Width = 197
            Height = 111
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            TabOrder = 1
            Caption = ''
            ExplicitWidth = 151
            object cbLabor: TUniDBLookupComboBox
              Left = 1
              Top = 1
              Width = 150
              Height = 26
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ListField = 'LABOR_RATE'
              ListSource = ds_Labor
              KeyField = 'ID'
              ListFieldIndex = 0
              ParentFont = False
              Font.Height = -15
              TabOrder = 0
              Color = clWindow
            end
            object edLaborHrs: TUniEdit
              Left = 1
              Top = 30
              Width = 150
              Height = 24
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Text = ''
              ParentFont = False
              Font.Height = -15
              TabOrder = 1
              OnExit = edWCHrsExit
            end
            object edLaborTotal: TUniEdit
              Left = 1
              Top = 59
              Width = 150
              Height = 24
              Cursor = crArrow
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Text = ''
              ParentFont = False
              Font.Height = -15
              TabOrder = 2
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
            end
          end
        end
      end
    end
  end
  object tblWorkCtr: TFDTable
    IndexName = 'AK_EQNO_WORK_CEN'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'WORK_CENTER'
    TableName = 'WORK_CENTER'
    Left = 88
    Top = 94
    object tblWorkCtrCNTR_RATE: TBCDField
      DisplayLabel = 'Center Rate'
      DisplayWidth = 10
      FieldName = 'CNTR_RATE'
      currency = True
      Size = 2
    end
    object tblWorkCtrCNTR_DESC: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 50
      FieldName = 'CNTR_DESC'
      Size = 250
    end
    object tblWorkCtrID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tblWorkCtrEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 10
      FieldName = 'EQNO'
      Required = True
      Visible = False
      Size = 60
    end
    object tblWorkCtrCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 10
      FieldName = 'CNTR_TYPE'
      Required = True
      Visible = False
    end
    object tblWorkCtrCNTR_COST: TFMTBCDField
      FieldName = 'CNTR_COST'
      Visible = False
      Size = 6
    end
    object tblWorkCtrMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Visible = False
      Size = 15
    end
    object tblWorkCtrMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      Visible = False
      Size = 10
    end
    object tblWorkCtrSET_UP: TBCDField
      FieldName = 'SET_UP'
      Visible = False
      Size = 2
    end
    object tblWorkCtrSTART_SHOTS: TBCDField
      FieldName = 'START_SHOTS'
      Visible = False
      Size = 0
    end
    object tblWorkCtrASY_MACH: TStringField
      FieldName = 'ASY_MACH'
      Visible = False
      Size = 1
    end
    object tblWorkCtrIS_RT: TStringField
      FieldName = 'IS_RT'
      Visible = False
      Size = 1
    end
    object tblWorkCtrCAPACITY: TBCDField
      FieldName = 'CAPACITY'
      Visible = False
      Size = 2
    end
    object tblWorkCtrPMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
  end
  object tblLabor: TFDTable
    IndexName = 'PK_QLABOR_RATES'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'QLABOR_RATES'
    TableName = 'QLABOR_RATES'
    Left = 360
    Top = 93
    object tblLaborID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblLaborLABOR_RATE: TFMTBCDField
      FieldName = 'LABOR_RATE'
      currency = True
      Size = 6
    end
  end
  object ds_WorkCtr: TDataSource
    DataSet = tblWorkCtr
    Left = 168
    Top = 94
  end
  object ds_Labor: TDataSource
    DataSet = tblLabor
    Left = 440
    Top = 94
  end
end
