object FrmEin: TFrmEin
  Left = 54
  Top = 156
  HelpContext = 1112672
  ClientHeight = 275
  ClientWidth = 628
  Caption = 'EIN'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 30
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBGridView: TUniSpeedButton
      Left = 2
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Form/Table View'
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
      OnClick = SBGridViewClick
    end
    object Nav: TUniDBNavigator
      Left = 388
      Top = 1
      Width = 240
      Height = 28
      Hint = ''
      DataSource = SrcEin
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PC: TUniPageControl
    Left = 0
    Top = 30
    Width = 628
    Height = 245
    Hint = ''
    ActivePage = TabGrid
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabForm: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabForm'
      DesignSize = (
        620
        217)
      object Label1: TUniLabel
        Left = 8
        Top = 14
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Fed Tax ID'
        TabOrder = 8
      end
      object Label2: TUniLabel
        Left = 8
        Top = 38
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'Company Name'
        TabOrder = 9
      end
      object Label3: TUniLabel
        Left = 8
        Top = 62
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 1'
        TabOrder = 10
      end
      object Label4: TUniLabel
        Left = 8
        Top = 86
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 2'
        TabOrder = 11
      end
      object Label5: TUniLabel
        Left = 8
        Top = 111
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 3'
        TabOrder = 12
      end
      object Label6: TUniLabel
        Left = 8
        Top = 135
        Width = 19
        Height = 13
        Hint = ''
        Caption = 'City'
        TabOrder = 13
      end
      object Label7: TUniLabel
        Left = 8
        Top = 159
        Width = 26
        Height = 13
        Hint = ''
        Caption = 'State'
        TabOrder = 14
      end
      object Label8: TUniLabel
        Left = 8
        Top = 184
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'Postal Code/Zip'
        TabOrder = 15
      end
      object DBDescrip: TUniDBEdit
        Left = 92
        Top = 14
        Width = 521
        Height = 21
        Hint = ''
        DataField = 'DESCRIP'
        DataSource = SrcEin
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object DBCompany: TUniDBEdit
        Left = 92
        Top = 37
        Width = 521
        Height = 21
        Hint = ''
        DataField = 'COMPANY'
        DataSource = SrcEin
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object DBAddr1: TUniDBEdit
        Left = 92
        Top = 61
        Width = 521
        Height = 21
        Hint = ''
        DataField = 'ADDR1'
        DataSource = SrcEin
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object DBAddr2: TUniDBEdit
        Left = 92
        Top = 85
        Width = 521
        Height = 21
        Hint = ''
        DataField = 'ADDR2'
        DataSource = SrcEin
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object DBAddr3: TUniDBEdit
        Left = 92
        Top = 108
        Width = 521
        Height = 21
        Hint = ''
        DataField = 'ADDR3'
        DataSource = SrcEin
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object DBCity: TUniDBEdit
        Left = 92
        Top = 132
        Width = 301
        Height = 21
        Hint = ''
        DataField = 'CITY'
        DataSource = SrcEin
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
      object DBState: TUniDBEdit
        Left = 92
        Top = 156
        Width = 301
        Height = 21
        Hint = ''
        DataField = 'STATE'
        DataSource = SrcEin
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object DBZip: TUniDBEdit
        Left = 92
        Top = 180
        Width = 301
        Height = 21
        Hint = ''
        DataField = 'ZIP'
        DataSource = SrcEin
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
      end
    end
    object TabGrid: TUniTabSheet
      Hint = ''
      TabVisible = False
      ImageIndex = 1
      Caption = 'TabGrid'
      object grid: TUniDBGrid
        Left = 0
        Top = 0
        Width = 620
        Height = 217
        Hint = ''
        DataSource = SrcEin
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Fed Tax ID'
            Width = 130
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Company Name'
            Width = 195
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDR1'
            Title.Caption = 'Address 1'
            Width = 147
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDR2'
            Title.Caption = 'Address 2'
            Width = 151
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDR3'
            Title.Caption = 'Address 3'
            Width = 142
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CITY'
            Title.Caption = 'City'
            Width = 184
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STATE'
            Title.Caption = 'State'
            Width = 124
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ZIP'
            Title.Caption = 'Postal Code/Zip'
            Width = 79
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  object SrcEin: TDataSource
    DataSet = TblEin
    Left = 56
    Top = 48
  end
  object TblEin: TFDTable
    BeforePost = TblEinBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'EIN'
    TableName = 'EIN'
    Left = 96
    Top = 48
    object TblEinID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblEinDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 15
    end
    object TblEinCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object TblEinADDR1: TStringField
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblEinADDR2: TStringField
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblEinADDR3: TStringField
      FieldName = 'ADDR3'
      Size = 60
    end
    object TblEinCITY: TStringField
      FieldName = 'CITY'
      Size = 30
    end
    object TblEinSTATE: TStringField
      FieldName = 'STATE'
    end
    object TblEinZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 136
    Top = 49
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Content1: TUniMenuItem
        Caption = 'Content'
        OnClick = Content1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'EIN'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192863 $'
    BuildVersion = '176554'
    Left = 168
    Top = 48
  end
end
