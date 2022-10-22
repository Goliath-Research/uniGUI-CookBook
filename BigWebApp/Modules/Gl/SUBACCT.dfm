object FrmSubAccts: TFrmSubAccts
  Left = 339
  Top = 193
  ClientHeight = 210
  ClientWidth = 353
  Caption = 'Financial Reporting Groups'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnToggleTableFormView: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table/Form View'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A0860100A08601000001000000000000000000001212
        1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
        0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
        0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
        6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
        9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
        B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
        C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
        FB00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D0505
        050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
        29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
        2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
        2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
        2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
        35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
        1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
        191919191919191919061E3838382120202020202020202020021E3939391A17
        1513110F0D0B090807061E393939211E050403030303030202021E393331392D
        2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
        2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
        19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnToggleTableFormViewClick
    end
    object NavMain: TUniDBNavigator
      Left = 177
      Top = 1
      Width = 175
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcSubAccountType
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 27
    Width = 353
    Height = 183
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 351
      Height = 181
      Hint = ''
      ActivePage = TabGrid
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabGrid: TUniTabSheet
        Hint = ''
        Caption = 'TabGrid'
        object GridSubAccount: TUniDBGrid
          Left = 0
          Top = 0
          Width = 343
          Height = 153
          Hint = ''
          DataSource = SrcSubAccountType
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 100
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACCT_TYPE'
              Title.Caption = 'Account Type'
              Width = 115
              PickList.Strings = (
                'REVENUE'
                'EXPENSE'
                'OWNERS EQUITY'
                'CURRENT ASSETS'
                'FIXED ASSETS'
                'CASH'
                'CURRENT LIABILITIES'
                'LONG TERM LIABILITIES'
                'COST OF GOODS SOLD'
                'ACCUMULATED DEPRECIATION'
                'OTHER INCOME'
                'OTHER EXPENSE'
                'OTHER ASSETS'
                '')
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        object PnlClient01: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 343
          Height = 153
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 90
            Top = 1
            Width = 6
            Height = 151
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 89
            Height = 151
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label2: TUniLabel
              Left = 8
              Top = 36
              Width = 66
              Height = 13
              Hint = ''
              Caption = 'Account Type'
              TabOrder = 1
            end
            object Label1: TUniLabel
              Left = 8
              Top = 12
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'Description'
              TabOrder = 2
            end
          end
          object PnlClient02: TUniPanel
            Tag = 1999
            Left = 96
            Top = 1
            Width = 246
            Height = 151
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object DBEdit1: TUniDBEdit
              Left = 1
              Top = 8
              Width = 156
              Height = 21
              Hint = ''
              DataField = 'DESCRIP'
              DataSource = SrcSubAccountType
              TabOrder = 0
            end
            object DBComboBox1: TUniDBComboBox
              Left = 1
              Top = 32
              Width = 156
              Height = 21
              Hint = ''
              DataField = 'ACCT_TYPE'
              DataSource = SrcSubAccountType
              Items.Strings = (
                'REVENUE'
                'EXPENSE'
                'OWNERS EQUITY'
                'CURRENT ASSETS'
                'FIXED ASSETS'
                'CASH'
                'CURRENT LIABILITIES'
                'LONG TERM LIABILITIES'
                'COST OF GOODS SOLD'
                'ACCUMULATED DEPRECIATION'
                'OTHER INCOME'
                'OTHER EXPENSE'
                'OTHER ASSETS'
                '')
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object SrcSubAccountType: TDataSource
    DataSet = TblSubAccountType
    Left = 240
    Top = 139
  end
  object TblSubAccountType: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLSUB_ACCT_TYPE'
    TableName = 'GLSUB_ACCT_TYPE'
    Left = 120
    Top = 136
    object TblSubAccountTypeID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblSubAccountTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Required = True
      Size = 35
    end
    object TblSubAccountTypeACCT_TYPE: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'ACCT_TYPE'
      Required = True
      Size = 25
    end
  end
end
