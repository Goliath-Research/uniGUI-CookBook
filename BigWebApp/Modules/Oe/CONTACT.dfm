object FrmContact: TFrmContact
  Left = 300
  Top = 156
  ClientHeight = 379
  ClientWidth = 344
  Caption = 'Contact'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 27
    Width = 344
    Height = 317
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitHeight = 301
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 342
      Height = 315
      Hint = ''
      ActivePage = TabForm
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitHeight = 299
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        ExplicitHeight = 271
        object ScrollBox1: TUniScrollBox
          Left = 0
          Top = 0
          Width = 334
          Height = 287
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ExplicitHeight = 271
          ScrollHeight = 275
          object PnlClient01: TUniPanel
            Left = 0
            Top = 0
            Width = 332
            Height = 275
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            ExplicitWidth = 315
            object Splitter1: TUniSplitter
              Left = 94
              Top = 1
              Width = 6
              Height = 273
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlLeft01: TUniPanel
              Left = 1
              Top = 1
              Width = 93
              Height = 273
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label3: TUniLabel
                Left = 8
                Top = 12
                Width = 58
                Height = 13
                Hint = ''
                Caption = 'Sequence #'
                TabOrder = 1
              end
              object Label4: TUniLabel
                Left = 8
                Top = 36
                Width = 65
                Height = 13
                Hint = ''
                Caption = 'Contact Type'
                TabOrder = 2
              end
              object Label1: TUniLabel
                Left = 8
                Top = 60
                Width = 51
                Height = 13
                Hint = ''
                Caption = 'First Name'
                TabOrder = 3
              end
              object Label2: TUniLabel
                Left = 8
                Top = 84
                Width = 50
                Height = 13
                Hint = ''
                Caption = 'Last Name'
                TabOrder = 4
              end
              object Label5: TUniLabel
                Left = 8
                Top = 108
                Width = 48
                Height = 13
                Hint = ''
                Caption = 'Salutation'
                TabOrder = 5
              end
              object Label6: TUniLabel
                Left = 8
                Top = 132
                Width = 20
                Height = 13
                Hint = ''
                Caption = 'Title'
                TabOrder = 6
              end
              object Label7: TUniLabel
                Left = 8
                Top = 156
                Width = 50
                Height = 13
                Hint = ''
                Caption = 'Telephone'
                TabOrder = 7
              end
              object Label8: TUniLabel
                Left = 8
                Top = 204
                Width = 18
                Height = 13
                Hint = ''
                Caption = 'Fax'
                TabOrder = 8
              end
              object Label10: TUniLabel
                Left = 8
                Top = 228
                Width = 28
                Height = 13
                Hint = ''
                Caption = 'Pager'
                TabOrder = 9
              end
              object Label12: TUniLabel
                Left = 9
                Top = 180
                Width = 47
                Height = 13
                Hint = ''
                Caption = 'Extension'
                TabOrder = 10
              end
              object Label11: TUniLabel
                Left = 8
                Top = 252
                Width = 28
                Height = 13
                Hint = ''
                Caption = 'E-Mail'
                TabOrder = 11
              end
            end
            object PnlClient02: TUniPanel
              Left = 100
              Top = 1
              Width = 231
              Height = 273
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              ExplicitWidth = 214
              DesignSize = (
                231
                273)
              object dbSeq: TUniDBEdit
                Left = 0
                Top = 8
                Width = 229
                Height = 21
                Hint = ''
                DataField = 'CONTACT_SEQNO'
                DataSource = Src
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ExplicitWidth = 212
              end
              object dbType: TUniDBEdit
                Left = 0
                Top = 32
                Width = 229
                Height = 21
                Hint = ''
                DataField = 'CONTACT_TYPE'
                DataSource = Src
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                ExplicitWidth = 212
              end
              object dbFirst: TUniDBEdit
                Left = 0
                Top = 56
                Width = 229
                Height = 21
                Hint = ''
                DataField = 'FIRST_NAME'
                DataSource = Src
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                ExplicitWidth = 212
              end
              object dbLast: TUniDBEdit
                Left = 0
                Top = 80
                Width = 229
                Height = 21
                Hint = ''
                DataField = 'LAST_NAME'
                DataSource = Src
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                ExplicitWidth = 212
              end
              object dbSalut: TUniDBEdit
                Left = 0
                Top = 104
                Width = 229
                Height = 21
                Hint = ''
                DataField = 'SALUTATION'
                DataSource = Src
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                ExplicitWidth = 212
              end
              object dbTitle: TUniDBEdit
                Left = 0
                Top = 128
                Width = 229
                Height = 21
                Hint = ''
                DataField = 'TITLE'
                DataSource = Src
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
                ExplicitWidth = 212
              end
              object dbPhone: TUniDBEdit
                Left = 0
                Top = 152
                Width = 137
                Height = 21
                Hint = ''
                DataField = 'PHONE_NUMBER'
                DataSource = Src
                MaxLength = 12
                TabOrder = 6
              end
              object dbFax: TUniDBEdit
                Left = 0
                Top = 200
                Width = 137
                Height = 21
                Hint = ''
                DataField = 'FAX_NUMBER'
                DataSource = Src
                MaxLength = 12
                TabOrder = 7
              end
              object dbPager: TUniDBEdit
                Left = 0
                Top = 224
                Width = 137
                Height = 21
                Hint = ''
                DataField = 'PAGER'
                DataSource = Src
                TabOrder = 8
              end
              object dbEmail: TUniDBEdit
                Left = 0
                Top = 248
                Width = 229
                Height = 21
                Hint = ''
                DataField = 'EMAIL'
                DataSource = Src
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 9
                ExplicitWidth = 212
              end
              object dbExt: TUniDBEdit
                Left = 0
                Top = 176
                Width = 58
                Height = 21
                Hint = ''
                DataField = 'EXT'
                DataSource = Src
                TabOrder = 10
              end
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        Caption = 'TabGrid'
        ExplicitHeight = 271
        object grid: TUniDBGrid
          Left = 0
          Top = 0
          Width = 334
          Height = 287
          Hint = ''
          DataSource = Src
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'CONTACT_SEQNO'
              Title.Caption = 'Seq #'
              Width = 38
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CONTACT_TYPE'
              Title.Caption = 'Contact Type'
              Width = 69
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SALUTATION'
              Title.Caption = 'Salutation'
              Width = 52
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LAST_NAME'
              Title.Caption = 'Last Name'
              Width = 184
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FIRST_NAME'
              Title.Caption = 'First Name'
              Width = 184
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TITLE'
              Title.Caption = 'Titile'
              Width = 364
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PHONE_NUMBER'
              Title.Caption = 'Telephone'
              Width = 78
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EXT'
              Title.Caption = 'Ext'
              Width = 34
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FAX_NUMBER'
              Title.Caption = 'Fax'
              Width = 82
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EMAIL'
              Title.Caption = 'E-Mail'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PAGER'
              Title.Caption = 'Pager'
              Width = 154
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 344
    Width = 344
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 328
    object Panel3: TUniPanel
      Left = 138
      Top = 1
      Width = 205
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 0
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 102
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object spSearchOrders: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search...'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
        00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
        90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
        A068509050308048308048208038108F4C26B08870A068509058309048308040
        20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
        4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
        B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
        F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
        50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
        57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
        67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
        C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
        20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
        00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
        00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
        00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
        00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = spSearchOrdersClick
    end
    object sbtnToggleView: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Grid/Form'
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
      OnClick = sbtnToggleViewClick
    end
    object nav: TUniDBNavigator
      Left = 118
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = Src
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 124
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Close'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object Src: TDataSource
    DataSet = TblContact
    Left = 182
  end
  object TblContact: TFDTable
    BeforePost = TblContactBeforePost
    IndexFieldNames = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'CONTACT'
    TableName = 'CONTACT'
    Left = 190
    Top = 143
    object TblContactID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblContactARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Size = 0
    end
    object TblContactCONTACT_TYPE: TStringField
      FieldName = 'CONTACT_TYPE'
      Size = 5
    end
    object TblContactCONTACT_SEQNO: TBCDField
      FieldName = 'CONTACT_SEQNO'
      Size = 0
    end
    object TblContactSALUTATION: TStringField
      FieldName = 'SALUTATION'
      Size = 5
    end
    object TblContactLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object TblContactFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object TblContactTITLE: TStringField
      FieldName = 'TITLE'
      Size = 60
    end
    object TblContactPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object TblContactEXT: TStringField
      FieldName = 'EXT'
      Size = 5
    end
    object TblContactFAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      OnGetText = DoGetTelephoneText
      Size = 25
    end
    object TblContactEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 250
    end
    object TblContactPAGER: TStringField
      FieldName = 'PAGER'
      Size = 25
    end
    object TblContactCUSER1: TStringField
      FieldName = 'CUSER1'
      Size = 60
    end
    object TblContactCUSER2: TStringField
      FieldName = 'CUSER2'
      Size = 60
    end
    object TblContactUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
  end
  object PKContact: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select c.first_name as first_name,'
      '          c.last_name as last_name,'
      '          c.title as title,'
      '          c.salutation as salutation,'
      '          c.id as id,'
      '          c.phone_number,'
      '          c.fax_number'
      '  from contact c')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 268
    Top = 146
    object PKContactFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 18
      FieldName = 'FIRST_NAME'
      Origin = 'CONTACT.FIRST_NAME'
      Size = 30
    end
    object PKContactLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 18
      FieldName = 'LAST_NAME'
      Origin = 'CONTACT.LAST_NAME'
      Size = 30
    end
    object PKContactTITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 18
      FieldName = 'TITLE'
      Origin = 'CONTACT.TITLE'
      Size = 60
    end
    object PKContactSALUTATION: TStringField
      DisplayLabel = 'Salutation'
      DisplayWidth = 18
      FieldName = 'SALUTATION'
      Origin = 'CONTACT.SALUTATION'
      Size = 5
    end
    object PKContactID: TBCDField
      DisplayWidth = 18
      FieldName = 'ID'
      Origin = 'CONTACT.ID'
      Visible = False
      Size = 0
    end
    object PKContactPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 18
      FieldName = 'PHONE_NUMBER'
      Origin = 'CONTACT.PHONE_NUMBER'
      Size = 25
    end
    object PKContactFAX_NUMBER: TStringField
      DisplayLabel = 'Fax #'
      DisplayWidth = 18
      FieldName = 'FAX_NUMBER'
      Origin = 'CONTACT.FAX_NUMBER'
      Size = 25
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Contact'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195557 $'
    BuildVersion = '176554'
    Left = 152
  end
end
