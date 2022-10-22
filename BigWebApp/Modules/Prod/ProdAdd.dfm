object FrmProdManual: TFrmProdManual
  Left = 272
  Top = 179
  HelpContext = 1012369
  ClientHeight = 332
  ClientWidth = 401
  Caption = 'New Production'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 313
    Width = 401
    Height = 19
    Hint = ''
    Panels = <
      item
        Text = 'Prod Date'
        Width = 120
      end
      item
        Text = 'Shift'
        Width = 50
      end
      item
        Text = 'Cell'
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
    ExplicitWidth = 383
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 276
    Width = 401
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 383
    object Panel5: TUniPanel
      Left = 81
      Top = 1
      Width = 319
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 63
      object btnOK: TUniButton
        Left = 1
        Top = 5
        Width = 97
        Height = 25
        Hint = 'Post and close the form'
        HelpContext = 997738
        ShowHint = True
        ParentShowHint = False
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 215
        Top = 5
        Width = 97
        Height = 25
        Hint = 'Exit'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
      object btnApply: TUniButton
        Left = 108
        Top = 5
        Width = 97
        Height = 25
        Hint = 'Post data and keep the form open'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Apply'
        TabOrder = 3
        OnClick = btnApplyClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 159
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    ExplicitWidth = 374
    object GroupBox2: TUniGroupBox
      Left = 1
      Top = 1
      Width = 399
      Height = 157
      Hint = ''
      Caption = '  Report Production Based On  '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitWidth = 381
      object Panel6: TUniPanel
        Left = 362
        Top = 15
        Width = 35
        Height = 140
        Hint = ''
        Align = alRight
        TabOrder = 0
        Caption = ''
        ExplicitLeft = 344
        object sbtnSearchWoItem: TUniSpeedButton
          Left = 6
          Top = 20
          Width = 23
          Height = 22
          Hint = 'Search Work Order'
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
          OnClick = sbtnSearchWoItemClick
        end
        object sbtnSearchMfgItem: TUniSpeedButton
          Left = 6
          Top = 65
          Width = 23
          Height = 22
          Hint = 'Search'
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
          OnClick = sbtnSearchMfgItemClick
        end
      end
      object Panel7: TUniPanel
        Left = 2
        Top = 15
        Width = 360
        Height = 140
        Hint = ''
        Align = alClient
        TabOrder = 1
        Caption = ''
        OnResize = Panel7Resize
        ExplicitWidth = 342
        DesignSize = (
          360
          140)
        object radioWorkorder: TUniRadioButton
          Left = 8
          Top = 3
          Width = 110
          Height = 17
          Hint = ''
          Caption = 'Work Order'
          TabOrder = 0
          OnClick = radioWorkorderClick
        end
        object radioMfg: TUniRadioButton
          Left = 8
          Top = 49
          Width = 110
          Height = 17
          Hint = ''
          Caption = 'Manufacturing #'
          TabOrder = 1
          OnClick = radioWorkorderClick
        end
        object wwcombWorkOrder: TUniDBLookupComboBox
          Left = 27
          Top = 22
          Width = 324
          Height = 21
          Hint = ''
          ListField = 'BUCKET'
          ListSource = ds_QryWorkorder
          KeyField = 'WORKORDER_ID'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Color = clWindow
        end
        object wwcombMfg: TUniDBLookupComboBox
          Left = 25
          Top = 66
          Width = 326
          Height = 21
          Hint = ''
          ListField = 'CUSTNO'
          ListSource = ds_QryMfg
          KeyField = 'MFGNO'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Color = clWindow
        end
        object radioDownTime: TUniRadioButton
          Left = 8
          Top = 97
          Width = 110
          Height = 17
          Hint = ''
          Caption = 'Downtime'
          TabOrder = 4
          OnClick = radioWorkorderClick
        end
      end
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 159
    Width = 401
    Height = 117
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    OnResize = Panel4Resize
    ExplicitWidth = 374
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 399
      Height = 115
      Hint = ''
      Caption = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitWidth = 381
      object Panel2: TUniPanel
        Left = 2
        Top = 15
        Width = 395
        Height = 98
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitWidth = 368
        object Splitter1: TUniSplitter
          Left = 96
          Top = 1
          Width = 6
          Height = 96
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 95
          Height = 96
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label3: TUniLabel
            Left = 8
            Top = 12
            Width = 61
            Height = 13
            Hint = ''
            Caption = 'Work Center'
            TabOrder = 1
          end
          object Label7: TUniLabel
            Left = 8
            Top = 36
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'Sales Order'
            TabOrder = 2
          end
          object Label6: TUniLabel
            Left = 8
            Top = 60
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Customer'
            TabOrder = 3
          end
        end
        object PnlClient01: TUniPanel
          Left = 102
          Top = 1
          Width = 258
          Height = 96
          Hint = ''
          Align = alClient
          TabOrder = 1
          Caption = ''
          ExplicitWidth = 240
          DesignSize = (
            258
            96)
          object wwcombWorkCenter: TUniDBLookupComboBox
            Left = 1
            Top = 5
            Width = 248
            Height = 21
            Hint = ''
            ListField = 'CNTR_DESC'
            ListSource = ds_QryWorkCenter
            KeyField = 'EQNO'
            ListFieldIndex = 0
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Color = clWindow
          end
          object wwcombSalesOrd: TUniDBLookupComboBox
            Left = 1
            Top = 32
            Width = 248
            Height = 21
            Hint = ''
            ListField = 'CUSTNO'
            ListSource = ds_QrySalesOrder
            KeyField = 'ORDERNO'
            ListFieldIndex = 0
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Color = clWindow
          end
          object wwcombCustomer: TUniDBLookupComboBox
            Left = 1
            Top = 56
            Width = 248
            Height = 21
            Hint = ''
            ListField = 'COMPANY'
            ListSource = ds_QryCustomer
            KeyField = 'CUSTNO'
            ListFieldIndex = 0
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Color = clWindow
            ExplicitWidth = 233
          end
        end
        object Panel8: TUniPanel
          Left = 360
          Top = 1
          Width = 34
          Height = 96
          Hint = ''
          Align = alRight
          TabOrder = 2
          Caption = ''
          ExplicitLeft = 342
          object sbtnSearchworkCenter: TUniSpeedButton
            Left = 6
            Top = 3
            Width = 23
            Height = 22
            Hint = 'Search Work Center'
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
            OnClick = sbtnSearchworkCenterClick
          end
          object sbtnSearchSalesOrder: TUniSpeedButton
            Left = 6
            Top = 31
            Width = 23
            Height = 22
            Hint = 'Search Sales Order'
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
            OnClick = sbtnSearchSalesOrderClick
          end
          object sbtnSearchCustomer: TUniSpeedButton
            Left = 6
            Top = 56
            Width = 23
            Height = 22
            Hint = 'Search Customer'
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
            OnClick = sbtnSearchCustomerClick
          end
        end
      end
    end
  end
  object wwQryWorkorder: TFDQuery
    BeforeOpen = AssignDivisionFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select w.id as workorder_id,'
      '       w.standard_id,'
      '       w.bucket,'
      '       w.arcusto_id,'
      '       s.mfgno,'
      '       e.eqno,'
      '       c.cntr_seq,'
      '       a.custno,'
      '       a.company,'
      '       m.division_id,'
      '       s.eplant_id'
      '  from workorder w,'
      '       standard s,'
      '       cntr_sched c,'
      '       work_center e,'
      '       arcusto a,'
      '       mfgcell m'
      ' where s.id = w.standard_id'
      '   and w.id = c.workorder_id(+)'
      '   and c.work_center_id = e.id(+)'
      '   and w.arcusto_id = a.id(+)'
      '   and s.mfgcell_id = m.id(+)'
      '   and misc.eplant_filter( s.eplant_id ) = 1 '
      '   and (:division_id = 0'
      '       or'
      '       :division_id = nvl(m.division_id,0))'
      'order by w.id'
      ' '
      ' '
      ' ')
    Left = 182
    Top = 21
    ParamData = <
      item
        Name = 'DIVISION_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryWorkorderWORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object wwQryWorkorderBUCKET: TBCDField
      DisplayLabel = 'Bkt #'
      DisplayWidth = 5
      FieldName = 'BUCKET'
      Size = 0
    end
    object wwQryWorkorderMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 30
      FieldName = 'MFGNO'
      Size = 50
    end
    object wwQryWorkorderEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 10
      FieldName = 'EQNO'
      Size = 60
    end
    object wwQryWorkorderCNTR_SEQ: TBCDField
      DisplayLabel = 'Pos #'
      DisplayWidth = 5
      FieldName = 'CNTR_SEQ'
      Size = 0
    end
    object wwQryWorkorderCUSTNO: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Size = 10
    end
    object wwQryWorkorderCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Size = 60
    end
    object wwQryWorkorderEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryWorkorderSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object wwQryWorkorderARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object wwQryWorkorderDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryMfg: TFDQuery
    BeforeOpen = AssignDivisionFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.id as standard_id,'
      '       s.mfgno,'
      '       a.custno,'
      '       a.company,'
      '       m.division_id,'
      '       s.eplant_id,'
      '       s.route_seq'
      '  from standard s,'
      '       arcusto a,'
      '       mfgcell m'
      ' where s.arcusto_id = a.id(+)'
      '   and s.mfgcell_id = m.id(+)'
      '   and NVL(s.pk_hide, '#39'N'#39') = '#39'N'#39
      '   and misc.eplant_filter( s.eplant_id ) = 1 '
      '   and (:division_id = 0'
      '        or'
      '        :division_id = nvl(m.division_id,0))'
      'order by s.mfgno'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 182
    Top = 69
    ParamData = <
      item
        Name = 'DIVISION_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryMfgMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 30
      FieldName = 'MFGNO'
      Size = 50
    end
    object wwQryMfgCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Size = 10
    end
    object wwQryMfgCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Size = 60
    end
    object wwQryMfgROUTE_SEQ: TBCDField
      DisplayLabel = 'Routing'
      DisplayWidth = 10
      FieldName = 'ROUTE_SEQ'
      Size = 0
    end
    object wwQryMfgEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryMfgSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object wwQryMfgDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
  end
  object PkMfg: TIQWebHpick
    BeforeOpen = AssignDivisionFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select STANDARD.MFGNO     as MfgNo,'
      '       standard.descrip   as standard_descrip,'
      '       STANDARD.MFG_TYPE  as Mfg_TYPE,'
      '       ARINVT.ITEMNO      as ITEMNO,'
      '       ARINVT.REV         as REV,'
      '       ARINVT.DESCRIP     as DESCRIP,'
      '       ARINVT.DESCRIP2    as DESCRIP2,'
      '       ARCUSTO.COMPANY    as COMPANY,'
      '       STANDARD.ID        as ID,'
      '       m.division_id      as division_id,'
      '       standard.eplant_id as eplant_id,'
      '       standard.pk_hide   as pk_hide'
      '  from STANDARD,'
      '       PARTNO, '
      '       ARINVT, '
      '       ARCUSTO,'
      '       mfgcell m'
      ' where STANDARD.ID = PARTNO.STANDARD_ID(+)'
      '   and PARTNO.ARINVT_ID = ARINVT.ID(+)'
      '   and ARCUSTO.ID(+) = STANDARD.ARCUSTO_ID '
      '   and standard.mfgcell_id = m.id(+)'
      '   and misc.eplant_filter( standard.eplant_id ) = 1 '
      '   and (:division_id = 0'
      '       or'
      '       :division_id = nvl(m.division_id,0))'
      ''
      '                       '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 132
    Top = 173
    ParamData = <
      item
        Name = 'DIVISION_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkMfgMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkMfgITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkMfgREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkMfgDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkMfgCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkMfgID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkMfgMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object PkMfgDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkMfgDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object PkMfgEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkMfgPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkMfgSTANDARD_DESCRIP: TStringField
      DisplayLabel = 'Mfg Description'
      DisplayWidth = 30
      FieldName = 'STANDARD_DESCRIP'
      Size = 50
    end
  end
  object wwQryWorkCenter: TFDQuery
    BeforeOpen = AssignDivisionFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(w.eqno) as eqno,'
      '       w.cntr_desc,'
      '       w.cntr_type,'
      '       w.mfg_type,'
      '       w.cntr_rate,'
      '       w.mfgcell,'
      '       w.id as work_center_id,'
      '       m.division_id,'
      '       w.eplant_id'
      '  from work_center w,'
      '       mfgcell m'
      ' where w.mfgcell_id = m.id(+)'
      '   and NVL(w.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '   and misc.eplant_filter( w.eplant_id ) = 1 '
      '   and (:division_id = 0'
      '        or'
      '        :division_id = nvl(m.division_id,0))'
      ' order by eqno'
      ' '
      ' ')
    Left = 224
    Top = 172
    ParamData = <
      item
        Name = 'DIVISION_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center'
      FieldName = 'EQNO'
      Origin = 'WORK_CENTER.EQNO'
      Size = 60
    end
    object wwQryWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      FieldName = 'CNTR_DESC'
      Origin = 'WORK_CENTER.CNTR_DESC'
      Size = 250
    end
    object wwQryWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'CNTR_TYPE'
      Origin = 'WORK_CENTER.CNTR_TYPE'
    end
    object wwQryWorkCenterMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      Origin = 'WORK_CENTER.MFG_TYPE'
      Size = 10
    end
    object wwQryWorkCenterCNTR_RATE: TBCDField
      FieldName = 'CNTR_RATE'
      Origin = 'WORK_CENTER.CNTR_RATE'
      Size = 2
    end
    object wwQryWorkCenterMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      FieldName = 'MFGCELL'
      Origin = 'WORK_CENTER.MFGCELL'
      Size = 15
    end
    object wwQryWorkCenterWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Origin = 'WORK_CENTER.ID'
      Size = 0
    end
    object wwQryWorkCenterDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Size = 0
    end
    object wwQryWorkCenterEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object wwQrySalesOrder: TFDQuery
    BeforeOpen = AssignDivisionFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(o.orderno) as orderno,'
      '       RTrim(a.custno)  as CustNo,'
      '       a.company as Company,'
      '       i.itemno as ItemNo,'
      
        '       decode(NVL(d.arinvt_id, 0), 0, misc_item, i.descrip) as d' +
        'escription,'
      '       o.eplant_id as eplant_id'
      '  from orders o, arcusto a, ord_detail d, arinvt i'
      ' where o.arcusto_id = a.id'
      '      and d.orders_id = o.id    '
      '      and d.arinvt_id = i.id(+)'
      '      and misc.eplant_filter( o.eplant_id ) = 1 '
      'order by o.orderno'
      ' ')
    Left = 215
    Top = 140
    object wwQrySalesOrderORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Size = 15
    end
    object wwQrySalesOrderCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Size = 10
    end
    object wwQrySalesOrderCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object wwQrySalesOrderITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Size = 50
    end
    object wwQrySalesOrderDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object wwQrySalesOrderEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkArcusto: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select custno,'
      '       company,'
      '       addr1,'
      '       city, '
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       prime_contact,'
      '       id, '
      '       pk_hide'
      'from IQMS.v_arcusto'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 163
    Top = 173
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object wwQryCustomer: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(custno) as custno,'
      '       company,'
      '       id as arcusto_id'
      '   from v_arcusto'
      '  where NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      'order by custno'
      ' ')
    Left = 190
    Top = 172
    object wwQryCustomerCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      Size = 10
    end
    object wwQryCustomerCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object wwQryCustomerARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO.ID'
      Visible = False
      Size = 0
    end
  end
  object PkOrders: TIQWebHpick
    BeforeOpen = AssignDivisionFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select o.ID  as ID,'
      '       o.orderno as orderno,'
      '       o.PONO as PoNo,'
      '       a.custno  as CustNo,'
      '       a.addr1 as addr1,'
      '       a.addr2 as addr2,'
      '       a.addr3 as addr3,'
      '       a.status_id as Status,'
      '       a.company as Company,'
      '       o.DATE_TAKEN as Date_Taken,'
      '       o.ORD_BY as Ord_By,'
      '       i.class as class,'
      '       i.rev as rev,'
      '       i.itemno as ItemNo,'
      
        '       decode(NVL(d.arinvt_id, 0), 0, misc_item, i.descrip) as d' +
        'escription,'
      '       i.descrip2 as description2,'
      '       o.eplant_id as eplant_id'
      '  from orders o, arcusto a, ord_detail d, arinvt i'
      ' where o.arcusto_id = a.id'
      '      and d.orders_id = o.id    '
      '      and d.arinvt_id = i.id(+)'
      '      and misc.eplant_filter( o.eplant_id ) = 1 '
      ''
      ''
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 157
    Top = 140
    object PkOrdersID: TBCDField
      DisplayLabel = 'Order #'
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkOrdersORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object PkOrdersPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 35
    end
    object PkOrdersCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkOrdersCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkOrdersDATE_TAKEN: TDateTimeField
      DisplayLabel = 'Order Date'
      FieldName = 'DATE_TAKEN'
    end
    object PkOrdersORD_BY: TStringField
      FieldName = 'ORD_BY'
      Visible = False
      Size = 30
    end
    object PkOrdersCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkOrdersREV: TStringField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Size = 15
    end
    object PkOrdersITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkOrdersDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object PkOrdersDESCRIPTION2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIPTION2'
      Size = 100
    end
    object PkOrdersSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 10
      FieldName = 'STATUS'
    end
    object PkOrdersADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkOrdersADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PkOrdersADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Size = 60
    end
    object PkOrdersEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkWorOrder: TIQWebHpick
    BeforeOpen = AssignDivisionFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.id           as workorder_id,'
      '       w.standard_id  as standard_id,'
      '       w.bucket       as bucket,'
      '       w.arcusto_id   as arcusto_id,'
      '       s.mfgno        as mfgno,'
      '       e.eqno         as eqno,'
      '       c.cntr_seq     as cntr_seq,'
      '       a.custno       as custno,'
      '       a.company      as company,'
      '       m.division_id  as division_id,'
      '       s.eplant_id    as eplant_id'
      '  from workorder w,'
      '       standard s,'
      '       cntr_sched c,'
      '       work_center e,'
      '       arcusto a,'
      '       mfgcell m'
      ' where s.id = w.standard_id'
      '   and w.id = c.workorder_id(+)'
      '   and c.work_center_id = e.id(+)'
      '   and w.arcusto_id = a.id(+)'
      '   and s.mfgcell_id = m.id(+)'
      '   and misc.eplant_filter( s.eplant_id ) = 1 '
      '   and (:division_id = 0'
      '       or'
      '       :division_id = nvl(m.division_id,0))'
      ''
      '                       '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 189
    Top = 141
    ParamData = <
      item
        Name = 'DIVISION_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkWorOrderWORKORDER_ID: TBCDField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object PkWorOrderSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object PkWorOrderBUCKET: TBCDField
      DisplayLabel = 'Bucket'
      FieldName = 'BUCKET'
      Size = 0
    end
    object PkWorOrderARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkWorOrderMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkWorOrderEQNO: TStringField
      DisplayLabel = 'Work Center'
      FieldName = 'EQNO'
      FixedChar = True
      Size = 60
    end
    object PkWorOrderCNTR_SEQ: TBCDField
      DisplayLabel = 'Position'
      FieldName = 'CNTR_SEQ'
      Size = 0
    end
    object PkWorOrderCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkWorOrderCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object PkWorOrderDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object PkWorOrderEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkWorkCntr: TIQWebHpick
    BeforeOpen = AssignDivisionFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.eqno as eqno,'
      '       w.cntr_desc as cntr_desc,'
      '       w.cntr_type as cntr_type,'
      '       w.ID as id,'
      '       w.eplant_id as eplant_id,'
      '       e.name as eplant_name,'
      '       m.mfgcell as mfgcell,'
      '       d.name as division_name,'
      '       w.pk_hide as pk_hide'
      ' from work_center w,'
      '      mfgcell m,'
      '      division d,'
      '      eplant e'
      'where w.mfgcell_id = m.id(+)'
      '  and m.division_id = d.id(+)'
      '  and e.id(+) = w.eplant_id'
      '  and misc.eplant_filter( w.eplant_id ) = 1'
      '  and (:division_id = 0'
      '      or'
      '      :division_id = nvl(m.division_id,0))'
      ''
      '  '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 70
    Top = 204
    ParamData = <
      item
        Name = 'DIVISION_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkWorkCntrEQNO: TStringField
      DisplayLabel = 'Work Center #'
      FieldName = 'EQNO'
      Origin = 'w.eqno'
      Size = 60
    end
    object PkWorkCntrCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      FieldName = 'CNTR_DESC'
      Origin = 'w.cntr_desc'
      Size = 250
    end
    object PkWorkCntrCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'CNTR_TYPE'
      Origin = 'w.cntr_type'
    end
    object PkWorkCntrID: TBCDField
      FieldName = 'ID'
      Origin = 'w.id'
      Visible = False
      Size = 0
    end
    object PkWorkCntrEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'w.eplant_id'
      Visible = False
      Size = 0
    end
    object PkWorkCntrMFGCELL: TStringField
      DisplayLabel = 'Manufacturing Cell'
      FieldName = 'MFGCELL'
      Origin = 'm.mfgcell'
      Size = 15
    end
    object PkWorkCntrDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object PkWorkCntrEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 12
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 30
    end
    object PkWorkCntrPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 48
    Top = 215
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmProdManual'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194271 $'
    BuildVersion = '176554'
    Left = 146
    Top = 209
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'radioWorkorder'
      'radioMfg'
      'radioDownTime'
      'wwcombWorkOrder'
      'sbtnSearchWoItem'
      'wwcombMfg'
      'sbtnSearchMfgItem'
      'wwcombWorkCenter'
      'sbtnSearchworkCenter'
      'wwcombSalesOrd'
      'sbtnSearchSalesOrder'
      'wwcombCustomer'
      'sbtnSearchCustomer'
      'btnOK'
      'btnApply')
    SecurityCode = 'FRMPRODMANUAL'
    Left = 229
    Top = 142
  end
  object ds_QryWorkorder: TDataSource
    DataSet = wwQryWorkorder
    Left = 217
    Top = 25
  end
  object ds_QryMfg: TDataSource
    DataSet = wwQryMfg
    Left = 219
    Top = 72
  end
  object ds_QryWorkCenter: TDataSource
    DataSet = wwQryWorkCenter
    Left = 256
    Top = 168
  end
  object ds_QrySalesOrder: TDataSource
    DataSet = wwQrySalesOrder
    Left = 248
    Top = 200
  end
  object ds_QryCustomer: TDataSource
    DataSet = wwQryCustomer
    Left = 248
    Top = 224
  end
end
