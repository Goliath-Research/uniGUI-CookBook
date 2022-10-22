object BomNextLotNo: TBomNextLotNo
  Left = 236
  Top = 153
  HelpContext = 1067685
  ClientHeight = 189
  ClientWidth = 434
  Caption = 'Set FG Lot #'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 434
    Height = 189
    Hint = ''
    ActivePage = TabSheet2
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'This BOM'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Panel2: TUniPanel
        Left = 0
        Top = 120
        Width = 426
        Height = 41
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Panel3: TUniPanel
          Left = 105
          Top = 1
          Width = 321
          Height = 39
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object btnNext: TUniButton
            Left = 8
            Top = 8
            Width = 97
            Height = 25
            Hint = 'Get next available FG Lot# sequence'
            Caption = 'Next Lot#'
            TabOrder = 1
            Default = True
            OnClick = btnNextClick
          end
          object btnOK: TUniButton
            Left = 112
            Top = 8
            Width = 97
            Height = 25
            Hint = ''
            Caption = 'OK'
            TabOrder = 2
            OnClick = btnOKClick
          end
          object btnCancel: TUniButton
            Left = 216
            Top = 8
            Width = 97
            Height = 25
            Hint = ''
            Caption = 'Cancel'
            Cancel = True
            ModalResult = 2
            TabOrder = 3
          end
        end
      end
      object PnlThisBom: TUniPanel
        Left = 0
        Top = 0
        Width = 426
        Height = 120
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 113
          Top = 0
          Width = 6
          Height = 120
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlThisBomLeft: TUniPanel
          Left = 1
          Top = 1
          Width = 113
          Height = 118
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label2: TUniLabel
            Left = 8
            Top = 12
            Width = 89
            Height = 13
            Hint = ''
            Caption = 'Specific MFG Lot #'
            TabOrder = 1
          end
          object lblExpLotDate: TUniLabel
            Left = 8
            Top = 79
            Width = 48
            Height = 13
            Hint = ''
            Caption = 'Exp. Date'
            TabOrder = 2
          end
        end
        object PnlThisBomClient1: TUniPanel
          Left = 119
          Top = 1
          Width = 307
          Height = 118
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object PnlThisBomClient3: TUniPanel
            Left = 280
            Top = 1
            Width = 27
            Height = 116
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object sbtnFGLotnoExpression: TUniSpeedButton
              Left = 1
              Top = 8
              Width = 23
              Height = 22
              Hint = 'Assign user defined lot # expression'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
                00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
                F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
                F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
                F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
                F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
                F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = sbtnFGLotnoExpressionClick
            end
          end
          object PnlThisBomClient2: TUniPanel
            Left = 1
            Top = 1
            Width = 280
            Height = 116
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              280
              116)
            object eFgLotNo: TUniEdit
              Left = 1
              Top = 8
              Width = 279
              Height = 21
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object chkUseUniqueLot: TUniCheckBox
              Left = 1
              Top = 33
              Width = 168
              Height = 17
              Hint = ''
              Caption = 'Ensure unique lot # per item'
              TabOrder = 1
            end
            object chkRetainWorkorder: TUniCheckBox
              Left = 1
              Top = 52
              Width = 240
              Height = 17
              Hint = ''
              Caption = 'Retain Assigned Lot # for this Work Order'
              TabOrder = 2
            end
            object wwDBDateTimePickerLotExpiry: TUniDateTimePicker
              Left = 1
              Top = 76
              Width = 161
              Height = 21
              Hint = ''
              DateTime = 42627.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 3
            end
          end
        end
      end
    end
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object PnlToolbarGeneral: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 426
        Height = 26
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object DBNavigator1: TUniDBNavigator
          Left = 374
          Top = 1
          Width = 52
          Height = 24
          Hint = ''
          DataSource = SrcParams
          VisibleButtons = [nbPost, nbCancel]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object PnlGeneralClient1: TUniPanel
        Left = 0
        Top = 26
        Width = 426
        Height = 135
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 169
          Top = 0
          Width = 6
          Height = 135
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlGeneralLeft: TUniPanel
          Left = 1
          Top = 1
          Width = 169
          Height = 133
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 8
            Top = 12
            Width = 139
            Height = 13
            Hint = ''
            Caption = 'Generic MFG Lot # Sequence'
            TabOrder = 1
          end
        end
        object PnlGeneralClient2: TUniPanel
          Left = 175
          Top = 1
          Width = 251
          Height = 133
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object DBEdit1: TUniDBEdit
            Left = 1
            Top = 8
            Width = 73
            Height = 21
            Hint = ''
            DataField = 'FG_LOTNO'
            DataSource = SrcParams
            TabOrder = 0
          end
          object dbchkDoNotDefaultLotnoFinalAssy: TUniDBCheckBox
            Left = 1
            Top = 33
            Width = 245
            Height = 17
            Hint = ''
            DataField = 'NO_DEFAULT_LOTNO_FINAL_ASSY'
            DataSource = SrcParams
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Do not default FG Lot # during Final Assembly'
            TabOrder = 1
          end
        end
      end
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 247
  end
  object TblParams: TFDTable
    BeforePost = TblParamsBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 303
    Top = 4
    object TblParamsFG_LOTNO: TBCDField
      Tag = 1
      DisplayLabel = 'FG Lot#'
      FieldName = 'FG_LOTNO'
      Size = 0
    end
    object TblParamsFG_LOTNO_FORMULA: TStringField
      FieldName = 'FG_LOTNO_FORMULA'
      Size = 4000
    end
    object TblParamsNO_DEFAULT_LOTNO_FINAL_ASSY: TStringField
      FieldName = 'NO_DEFAULT_LOTNO_FINAL_ASSY'
      Size = 1
    end
    object TblParamsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'BomNextLotNo')
    SecurityItems.Strings = (
      'sbtnFGLotnoExpression'
      'chkUseUniqueLot'
      'dbchkDoNotDefaultLotnoFinalAssy'
      'chkRetainWorkorder'
      'wwDBDateTimePickerLotExpiry')
    SecurityCode = 'BOMNEXTLOTNO'
    Left = 192
    Top = 3
  end
end
