object FrmPSVoided: TFrmPSVoided
  Left = 267
  Top = 214
  ClientHeight = 416
  ClientWidth = 638
  Caption = 'Voided Packing Slips'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 205
    Width = 638
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlHeaderTop: TUniPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 205
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object pgctrlHeader: TUniPageControl
      Left = 1
      Top = 28
      Width = 636
      Height = 177
      Hint = ''
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'TabSheet1'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object GroupBox1: TUniGroupBox
          Left = 0
          Top = 0
          Width = 628
          Height = 149
          Hint = ''
          Caption = ' Packing Slip #  '
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentColor = False
          TabOrder = 0
          ParentFont = False
          Font.Color = clBlack
          object Splitter4: TUniSplitter
            Left = 159
            Top = 0
            Width = 6
            Height = 149
            Hint = ''
            Align = alRight
            ParentColor = False
            Color = clBtnFace
          end
          object Splitter8: TUniSplitter
            Left = 406
            Top = 0
            Width = 6
            Height = 149
            Hint = ''
            Align = alRight
            ParentColor = False
            Color = clBtnFace
          end
          object Panel3: TUniPanel
            Left = 2
            Top = 15
            Width = 159
            Height = 132
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter5: TUniSplitter
              Left = 72
              Top = 0
              Width = 6
              Height = 132
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object Panel14: TUniPanel
              Left = 78
              Top = 1
              Width = 81
              Height = 130
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              DesignSize = (
                81
                130)
              object dbeCustomer: TUniDBEdit
                Left = 1
                Top = 2
                Width = 80
                Height = 21
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'ARCUSTO_COMPANY'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ReadOnly = True
              end
              object dbeShipTo: TUniDBEdit
                Left = 1
                Top = 26
                Width = 80
                Height = 21
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'SHIP_TO_ATTN'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                ReadOnly = True
              end
              object dbeBillTo: TUniDBEdit
                Left = 1
                Top = 50
                Width = 80
                Height = 21
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'BILL_TO_ATTN'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                ReadOnly = True
              end
              object dbePlantName: TUniDBEdit
                Left = 1
                Top = 74
                Width = 80
                Height = 21
                Hint = ''
                DataField = 'EPlant_Name'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                TabStop = False
                ReadOnly = True
              end
              object dbePSDate: TUniDBEdit
                Left = 1
                Top = 98
                Width = 80
                Height = 21
                Cursor = crArrow
                Hint = ''
                DataField = 'PS_DATE'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                TabStop = False
                ReadOnly = True
              end
              object dbeVoidDate: TUniDBEdit
                Left = 1
                Top = 122
                Width = 80
                Height = 21
                Cursor = crArrow
                Hint = ''
                DataField = 'VOID_DATE'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
                TabStop = False
                ReadOnly = True
              end
            end
            object PnlLeft01: TUniPanel
              Left = 1
              Top = 1
              Width = 72
              Height = 130
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 1
              Caption = ''
              object Label1: TUniLabel
                Left = 8
                Top = 6
                Width = 46
                Height = 13
                Hint = ''
                Caption = 'Customer'
                TabOrder = 1
              end
              object Label2: TUniLabel
                Left = 8
                Top = 30
                Width = 35
                Height = 13
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                Caption = 'Ship To'
                TabOrder = 2
              end
              object Label3: TUniLabel
                Left = 8
                Top = 54
                Width = 30
                Height = 13
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                Caption = 'Bill  To'
                TabOrder = 3
              end
              object lblEPlantName: TUniLabel
                Left = 8
                Top = 78
                Width = 30
                Height = 13
                Hint = ''
                Caption = 'EPlant'
                TabOrder = 4
              end
              object Label6: TUniLabel
                Left = 8
                Top = 102
                Width = 38
                Height = 13
                Hint = 'Packing Slip Date'
                ShowHint = True
                ParentShowHint = False
                Caption = 'PS Date'
                TabOrder = 5
              end
              object Label8: TUniLabel
                Left = 8
                Top = 126
                Width = 46
                Height = 13
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                Caption = 'Void Date'
                TabOrder = 6
              end
            end
          end
          object PnlLeft04: TUniPanel
            Left = 165
            Top = 15
            Width = 241
            Height = 132
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object Splitter6: TUniSplitter
              Left = 75
              Top = 0
              Width = 6
              Height = 132
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlLeft02: TUniPanel
              Left = 1
              Top = 1
              Width = 75
              Height = 130
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label4: TUniLabel
                Left = 8
                Top = 6
                Width = 37
                Height = 13
                Hint = ''
                Caption = 'Ship Via'
                TabOrder = 1
              end
              object Label10: TUniLabel
                Left = 8
                Top = 30
                Width = 47
                Height = 13
                Hint = ''
                Caption = 'Ship Days'
                TabOrder = 2
              end
              object Label5: TUniLabel
                Left = 8
                Top = 54
                Width = 46
                Height = 13
                Hint = ''
                Caption = 'Ship Date'
                TabOrder = 3
              end
              object Label9: TUniLabel
                Left = 8
                Top = 76
                Width = 20
                Height = 13
                Hint = 'Free on Board'
                ShowHint = True
                ParentShowHint = False
                Caption = 'FOB'
                TabOrder = 4
              end
              object Label13: TUniLabel
                Left = 8
                Top = 102
                Width = 58
                Height = 13
                Hint = 'Number of pallets'
                ShowHint = True
                ParentShowHint = False
                Caption = 'Pallet Count'
                TabOrder = 5
              end
            end
            object Panel17: TUniPanel
              Left = 81
              Top = 1
              Width = 160
              Height = 130
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                160
                130)
              object dbDays: TUniDBEdit
                Left = 1
                Top = 26
                Width = 132
                Height = 21
                Hint = ''
                DataField = 'SHIP_TO_SHIP_TIME'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                ReadOnly = True
              end
              object dbePalletCount: TUniDBEdit
                Left = 1
                Top = 98
                Width = 132
                Height = 21
                Hint = ''
                DataField = 'PALLET_COUNT'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                ReadOnly = True
              end
              object DBCheckBoxInvVerification: TUniDBCheckBox
                Left = 1
                Top = 121
                Width = 156
                Height = 17
                Hint = ''
                DataField = 'NeedInventoryVerification'
                DataSource = SrcShipments
                ValueChecked = 'Y'
                ValueUnchecked = 'N'
                Caption = 'Awaits Inventory Verification'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
                ReadOnly = True
              end
              object dbeShipVia: TUniDBEdit
                Left = 1
                Top = 2
                Width = 132
                Height = 21
                Hint = ''
                DataField = 'ShipVia'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ReadOnly = True
              end
              object dbeFob: TUniDBEdit
                Left = 1
                Top = 74
                Width = 132
                Height = 21
                Hint = ''
                DataField = 'FOB'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                ReadOnly = True
              end
              object dbeShipDate: TUniDBEdit
                Left = 1
                Top = 50
                Width = 132
                Height = 21
                Hint = ''
                DataField = 'SHIPDATE'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                ReadOnly = True
              end
            end
          end
          object PnlLeft05: TUniPanel
            Left = 412
            Top = 15
            Width = 216
            Height = 132
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 2
            Caption = ''
            object Splitter7: TUniSplitter
              Left = 84
              Top = 0
              Width = 6
              Height = 132
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlLeft03: TUniPanel
              Left = 1
              Top = 1
              Width = 84
              Height = 130
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label14: TUniLabel
                Left = 8
                Top = 6
                Width = 72
                Height = 13
                Hint = ''
                Caption = 'Freight Charge'
                TabOrder = 1
              end
              object Label7: TUniLabel
                Left = 8
                Top = 30
                Width = 29
                Height = 13
                Hint = ''
                Caption = 'Terms'
                TabOrder = 2
              end
              object Label11: TUniLabel
                Left = 8
                Top = 54
                Width = 51
                Height = 13
                Hint = ''
                Caption = 'Tracking #'
                TabOrder = 3
              end
              object lblBOLNote: TUniLabel
                Left = 8
                Top = 78
                Width = 45
                Height = 13
                Hint = 'Bill of Lading note'
                ShowHint = True
                ParentShowHint = False
                Caption = 'BOL Note'
                TabOrder = 4
              end
              object lblPoolBillNo: TUniLabel
                Left = 8
                Top = 102
                Width = 46
                Height = 13
                Hint = 'Pool Bill Number'
                Caption = 'Pool Bill #'
                TabOrder = 5
              end
              object lblBatch: TUniLabel
                Left = 8
                Top = 126
                Width = 27
                Height = 13
                Hint = ''
                Caption = 'Batch'
                TabOrder = 6
              end
            end
            object Panel19: TUniPanel
              Left = 90
              Top = 1
              Width = 126
              Height = 130
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                126
                130)
              object dbFChg: TUniDBEdit
                Left = 1
                Top = 2
                Width = 122
                Height = 22
                Cursor = crArrow
                Hint = ''
                DataField = 'AUTO_FREIGHT_PRICE'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ReadOnly = True
              end
              object DBEdit2: TUniDBEdit
                Left = 1
                Top = 26
                Width = 122
                Height = 22
                Cursor = crArrow
                Hint = ''
                DataField = 'TERMS_DESCRIP'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                TabStop = False
                ReadOnly = True
              end
              object dbeTracking: TUniDBEdit
                Left = 1
                Top = 50
                Width = 122
                Height = 22
                Cursor = crArrow
                Hint = ''
                DataField = 'TRACKING_NUM'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                ReadOnly = True
              end
              object DBMemoBOL: TUniEdit
                Left = 1
                Top = 74
                Width = 122
                Height = 21
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                ReadOnly = True
              end
              object DBMemo1: TUniEdit
                Left = 1
                Top = 98
                Width = 122
                Height = 21
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                ReadOnly = True
              end
              object dbeBatch: TUniDBEdit
                Left = 1
                Top = 122
                Width = 122
                Height = 22
                Cursor = crArrow
                Hint = 'Pick Ticket Batch'
                ShowHint = True
                ParentShowHint = False
                DataField = 'PS_TICKET_BATCH'
                DataSource = SrcShipments
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
                ReadOnly = True
              end
            end
          end
        end
      end
    end
    object TUniPanel
      Left = 1
      Top = 1
      Width = 636
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object spSearchShipments: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
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
        OnClick = spSearchShipmentsClick
      end
      object NavShipments: TIQWebQueryNavigator
        Left = 447
        Top = 1
        Width = 189
        Height = 26
        Hint = ''
        ParentShowHint = False
        DataSource = SrcShipments
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        ConfirmDelete = False
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        HidePleaseWait = False
      end
    end
  end
  object pnlDetailClient: TUniPanel
    Left = 0
    Top = 208
    Width = 638
    Height = 208
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel7: TUniPanel
      Left = 1
      Top = 1
      Width = 636
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ''
      object PnlLegend: TUniPanel
        Left = 552
        Top = 1
        Width = 84
        Height = 25
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitLeft = 452
        object Shape1: TUniPanel
          Left = 1
          Top = 7
          Width = 12
          Height = 12
          Hint = 'Qty. Shipped equals to Qty. Invoiced'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 1
          Caption = ''
        end
        object Shape2: TUniPanel
          Left = 15
          Top = 7
          Width = 12
          Height = 12
          Hint = 'Not Invoiced'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 2
          Caption = ''
        end
        object Shape3: TUniPanel
          Left = 29
          Top = 7
          Width = 12
          Height = 12
          Hint = 'Invoiced partially'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 3
          Caption = ''
        end
        object Shape4: TUniPanel
          Left = 43
          Top = 7
          Width = 12
          Height = 12
          Hint = 'Overinvoiced'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 4
          Caption = ''
        end
        object Shape5: TUniPanel
          Left = 57
          Top = 7
          Width = 12
          Height = 12
          Hint = 'Negative shipment (ex: RMA)'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 5
          Caption = ''
        end
      end
    end
    object GridShipDetails: TIQUniGridControl
      Left = 1
      Top = 27
      Width = 636
      Height = 181
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 419
      IQComponents.Grid.Height = 95
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcShip_Dtl
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcShip_Dtl
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 419
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 95
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcShip_Dtl
      Columns = <
        item
          FieldName = 'ORDERNO'
          Title.Caption = 'Order #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ItemNo'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Description'
          Title.Caption = 'Item Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QTYSHIPPED'
          Title.Caption = 'Quantity ~Shipped'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BACKORDER_QTY'
          Title.Caption = 'Backlog'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVOICED_QTY'
          Title.Caption = 'Packing Slip ~Invoiced Quantity'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORD_INVOICED_QTY'
          Title.Caption = 'Order ~Invoiced Quantity'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIPMENT_TYPE'
          Title.Caption = 'Shipment Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UOM'
          Title.Caption = 'Order UOM'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CRM_QUOTE_RFQ'
          Title.Caption = 'Sales Quotation #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RAN'
          Title.Caption = 'R.A.N. / KanBan'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'extDescrip'
          Title.Caption = 'Item Ext Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Class'
          Title.Caption = 'Item Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Rev'
          Title.Caption = 'Item Rev'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AKA_ItemNo'
          Title.Caption = 'AKA Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AKA_Descrip'
          Title.Caption = 'AKA Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AKA_Rev'
          Title.Caption = 'AKA Rev'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AKA_Descrip2'
          Title.Caption = 'AKA Ext Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object SrcShipments: TDataSource
    DataSet = QryShipments
    OnDataChange = SrcShipmentsDataChange
    Left = 158
    Top = 299
  end
  object QryShipments: TFDQuery
    Tag = 1
    BeforeOpen = QryShipmentsBeforeOpen
    OnCalcFields = QryShipmentsCalcFields
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.packslipno,'
      '       s.fob,'
      '       s.shipdate,'
      '       s.ps_date,'
      '       s.arcusto_custno,'
      '       s.arcusto_addr1,'
      '       s.arcusto_addr2,'
      '       s.arcusto_addr3,'
      '       s.arcusto_city,'
      '       s.arcusto_state,'
      '       s.arcusto_country,'
      '       s.arcusto_zip,'
      '       s.arcusto_ext,'
      '       s.arcusto_prime_contact,'
      '       s.ship_to_attn,'
      '       s.ship_to_addr1,'
      '       s.ship_to_addr2,'
      '       s.ship_to_addr3,'
      '       s.ship_to_city,'
      '       s.ship_to_state,'
      '       s.ship_to_country,'
      '       s.ship_to_zip,'
      '       s.ship_to_tax_code_id,'
      '       s.ship_to_phone_number,'
      '       s.ship_to_ext,'
      '       s.ship_to_fax,'
      '       s.ship_to_prime_contact,'
      '       s.ship_to_ship_time,'
      '       s.bill_to_attn,'
      '       s.bill_to_addr1,'
      '       s.bill_to_addr2,'
      '       s.bill_to_addr3,'
      '       s.bill_to_city,'
      '       s.bill_to_state,'
      '       s.bill_to_country,'
      '       s.bill_to_zip,'
      '       s.bill_to_phone_number,'
      '       s.bill_to_ext,'
      '       s.bill_to_fax,'
      '       s.bill_to_prime_contact,'
      '       s.terms_descrip,'
      '       s.terms_days,'
      '       s.terms_discount,'
      '       s.terms_discount_days,'
      '       s.arcusto_company,'
      '       s.arcusto_phone_number,'
      '       s.arcusto_fax_number,'
      '       s.pool_bill_number,'
      '       s.ship_via,'
      '       s.freight_descrip,'
      '       s.pro_no,'
      '       s.ship_time,'
      '       s.est_arrival,'
      '       s.conveyance_no,'
      '       s.box_code,'
      '       s.to_invoice,'
      '       s.arcusto_id,'
      '       s.userid,'
      '       s.bol_comment1,'
      '       s.shipment_type,'
      '       s.eplant_id,'
      '       s.archived,'
      '       s.edi_created,'
      '       s.tracking_num,'
      '       s.vmi,'
      '       s.id,'
      '       s.pallet_count,'
      '       s.ship_to_id,'
      '       s.bill_to_id,'
      '       s.freight_id,'
      '       s.ps_ticket_id,'
      '       s.auto_freight_price,'
      '       s.ps_ticket_batch,'
      '       s.void_date'
      ''
      '  from shipments_void s,'
      ''
      
        '       ( select id from GTT_picklist_scope where batch = :scope_' +
        'batch'
      '          UNION'
      '         select :id from dual ) scope'
      ''
      ' where'
      '       -- do not delete these lines'
      '       -- _NAV_WHERE_START'
      '         ( s.id = scope.id )'
      '       -- _NAV_WHERE_END'
      ''
      '       -- ensure customer security'
      '   and ( :cust_count = 0'
      '         or'
      
        '         :cust_count > 0 and  s.arcusto_id in ( select arcusto_i' +
        'd from s_user_crm_customers where user_name = misc.GetUserName )' +
        ') '
      '   '
      '   and NVL(s.shipment_type, '#39' '#39') <> '#39'CUM SHIP ADJUSTMENT'#39
      ''
      '   and misc.eplant_filter( s.eplant_id ) = 1'
      ''
      '')
    Left = 158
    Top = 277
    ParamData = <
      item
        Name = 'scope_batch'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'cust_count'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryShipmentsPACKSLIPNO: TStringField
      DisplayLabel = 'Pack.Slip#'
      DisplayWidth = 10
      FieldName = 'PACKSLIPNO'
      Origin = 'PACKSLIPNO'
      Required = True
      Size = 15
    end
    object QryShipmentsFOB: TStringField
      DisplayLabel = 'F.O.B.'
      DisplayWidth = 15
      FieldName = 'FOB'
      Origin = 'FOB'
      Size = 60
    end
    object QryShipmentsSHIPDATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 18
      FieldName = 'SHIPDATE'
      Origin = 'SHIPDATE'
    end
    object QryShipmentsPS_DATE: TDateTimeField
      DisplayLabel = 'PS. Date'
      DisplayWidth = 18
      FieldName = 'PS_DATE'
      Origin = 'PS_DATE'
    end
    object QryShipmentsARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Cust#'
      DisplayWidth = 10
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'ARCUSTO_CUSTNO'
      Size = 10
    end
    object QryShipmentsARCUSTO_ADDR1: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_ADDR1'
      Origin = 'ARCUSTO_ADDR1'
      Size = 60
    end
    object QryShipmentsARCUSTO_ADDR2: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_ADDR2'
      Origin = 'ARCUSTO_ADDR2'
      Size = 60
    end
    object QryShipmentsARCUSTO_ADDR3: TStringField
      DisplayLabel = 'Address3'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_ADDR3'
      Origin = 'ARCUSTO_ADDR3'
      Size = 60
    end
    object QryShipmentsARCUSTO_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_CITY'
      Origin = 'ARCUSTO_CITY'
      Size = 30
    end
    object QryShipmentsARCUSTO_STATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 2
      FieldName = 'ARCUSTO_STATE'
      Origin = 'ARCUSTO_STATE'
    end
    object QryShipmentsARCUSTO_COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_COUNTRY'
      Origin = 'ARCUSTO_COUNTRY'
      Size = 100
    end
    object QryShipmentsARCUSTO_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ZIP'
      Origin = 'ARCUSTO_ZIP'
    end
    object QryShipmentsARCUSTO_EXT: TStringField
      DisplayLabel = 'Ext.'
      DisplayWidth = 5
      FieldName = 'ARCUSTO_EXT'
      Origin = 'ARCUSTO_EXT'
      Size = 5
    end
    object QryShipmentsARCUSTO_PRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_PRIME_CONTACT'
      Origin = 'ARCUSTO_PRIME_CONTACT'
      Size = 30
    end
    object QryShipmentsSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To Company'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'SHIP_TO_ATTN'
      Size = 60
    end
    object QryShipmentsSHIP_TO_ADDR1: TStringField
      DisplayLabel = 'Ship To Address1'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ADDR1'
      Origin = 'SHIP_TO_ADDR1'
      Size = 60
    end
    object QryShipmentsSHIP_TO_ADDR2: TStringField
      DisplayLabel = 'Ship To Address2'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ADDR2'
      Origin = 'SHIP_TO_ADDR2'
      Size = 60
    end
    object QryShipmentsSHIP_TO_ADDR3: TStringField
      DisplayLabel = 'Ship To Address3'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ADDR3'
      Origin = 'SHIP_TO_ADDR3'
      Size = 60
    end
    object QryShipmentsSHIP_TO_CITY: TStringField
      DisplayLabel = 'Ship To City'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_CITY'
      Origin = 'SHIP_TO_CITY'
      Size = 30
    end
    object QryShipmentsSHIP_TO_STATE: TStringField
      DisplayLabel = 'Ship To State or Region'
      DisplayWidth = 2
      FieldName = 'SHIP_TO_STATE'
      Origin = 'SHIP_TO_STATE'
    end
    object QryShipmentsSHIP_TO_COUNTRY: TStringField
      DisplayLabel = 'Ship To Country'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_COUNTRY'
      Origin = 'SHIP_TO_COUNTRY'
      Size = 100
    end
    object QryShipmentsSHIP_TO_ZIP: TStringField
      DisplayLabel = 'Ship To Postal Code'
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ZIP'
      Origin = 'SHIP_TO_ZIP'
    end
    object QryShipmentsSHIP_TO_TAX_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_TAX_CODE_ID'
      Origin = 'SHIP_TO_TAX_CODE_ID'
      Size = 0
    end
    object QryShipmentsSHIP_TO_PHONE_NUMBER: TStringField
      DisplayLabel = 'Ship To Telephone'
      DisplayWidth = 25
      FieldName = 'SHIP_TO_PHONE_NUMBER'
      Origin = 'SHIP_TO_PHONE_NUMBER'
      Size = 25
    end
    object QryShipmentsSHIP_TO_EXT: TStringField
      DisplayLabel = 'Ship To Ext.'
      DisplayWidth = 5
      FieldName = 'SHIP_TO_EXT'
      Origin = 'SHIP_TO_EXT'
      Size = 5
    end
    object QryShipmentsSHIP_TO_FAX: TStringField
      DisplayLabel = 'Ship To Fax'
      DisplayWidth = 25
      FieldName = 'SHIP_TO_FAX'
      Origin = 'SHIP_TO_FAX'
      Size = 25
    end
    object QryShipmentsSHIP_TO_PRIME_CONTACT: TStringField
      DisplayLabel = 'Ship To Contact'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_PRIME_CONTACT'
      Origin = 'SHIP_TO_PRIME_CONTACT'
      Size = 30
    end
    object QryShipmentsBILL_TO_ATTN: TStringField
      DisplayLabel = 'Bill To Company'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ATTN'
      Origin = 'BILL_TO_ATTN'
      Size = 60
    end
    object QryShipmentsBILL_TO_ADDR1: TStringField
      DisplayLabel = 'Bill To Address1'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ADDR1'
      Origin = 'BILL_TO_ADDR1'
      Size = 60
    end
    object QryShipmentsBILL_TO_ADDR2: TStringField
      DisplayLabel = 'Bill To Address2'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ADDR2'
      Origin = 'BILL_TO_ADDR2'
      Size = 60
    end
    object QryShipmentsBILL_TO_ADDR3: TStringField
      DisplayLabel = 'Bill To Address3'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ADDR3'
      Origin = 'BILL_TO_ADDR3'
      Size = 60
    end
    object QryShipmentsBILL_TO_CITY: TStringField
      DisplayLabel = 'Bill To City'
      DisplayWidth = 30
      FieldName = 'BILL_TO_CITY'
      Origin = 'BILL_TO_CITY'
      Size = 30
    end
    object QryShipmentsBILL_TO_STATE: TStringField
      DisplayLabel = 'Bill To State or Region'
      DisplayWidth = 2
      FieldName = 'BILL_TO_STATE'
      Origin = 'BILL_TO_STATE'
    end
    object QryShipmentsBILL_TO_COUNTRY: TStringField
      DisplayLabel = 'Bill To Country'
      DisplayWidth = 30
      FieldName = 'BILL_TO_COUNTRY'
      Origin = 'BILL_TO_COUNTRY'
      Size = 100
    end
    object QryShipmentsBILL_TO_ZIP: TStringField
      DisplayLabel = 'Bill To Postal Code'
      DisplayWidth = 10
      FieldName = 'BILL_TO_ZIP'
      Origin = 'BILL_TO_ZIP'
    end
    object QryShipmentsBILL_TO_PHONE_NUMBER: TStringField
      DisplayLabel = 'Bill To Telephone'
      DisplayWidth = 25
      FieldName = 'BILL_TO_PHONE_NUMBER'
      Origin = 'BILL_TO_PHONE_NUMBER'
      Size = 25
    end
    object QryShipmentsBILL_TO_EXT: TStringField
      DisplayLabel = 'Bill To Ext.'
      DisplayWidth = 5
      FieldName = 'BILL_TO_EXT'
      Origin = 'BILL_TO_EXT'
      Size = 5
    end
    object QryShipmentsBILL_TO_FAX: TStringField
      DisplayLabel = 'Bill To Fax'
      DisplayWidth = 25
      FieldName = 'BILL_TO_FAX'
      Origin = 'BILL_TO_FAX'
      Size = 25
    end
    object QryShipmentsBILL_TO_PRIME_CONTACT: TStringField
      DisplayLabel = 'Bill To Contact'
      DisplayWidth = 30
      FieldName = 'BILL_TO_PRIME_CONTACT'
      Origin = 'BILL_TO_PRIME_CONTACT'
      Size = 30
    end
    object QryShipmentsTERMS_DESCRIP: TStringField
      DisplayLabel = 'Terms Description'
      DisplayWidth = 30
      FieldName = 'TERMS_DESCRIP'
      Origin = 'TERMS_DESCRIP'
      Size = 60
    end
    object QryShipmentsTERMS_DAYS: TBCDField
      DisplayLabel = 'Terms Days'
      DisplayWidth = 10
      FieldName = 'TERMS_DAYS'
      Origin = 'TERMS_DAYS'
      Size = 0
    end
    object QryShipmentsTERMS_DISCOUNT: TBCDField
      DisplayLabel = 'Terms Discount'
      DisplayWidth = 10
      FieldName = 'TERMS_DISCOUNT'
      Origin = 'TERMS_DISCOUNT'
      Size = 3
    end
    object QryShipmentsTERMS_DISCOUNT_DAYS: TBCDField
      DisplayLabel = 'Terms Discount Days'
      DisplayWidth = 10
      FieldName = 'TERMS_DISCOUNT_DAYS'
      Origin = 'TERMS_DISCOUNT_DAYS'
      Size = 0
    end
    object QryShipmentsARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'ARCUSTO_COMPANY'
      Size = 60
    end
    object QryShipmentsARCUSTO_PHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      DisplayWidth = 25
      FieldName = 'ARCUSTO_PHONE_NUMBER'
      Origin = 'ARCUSTO_PHONE_NUMBER'
      Size = 25
    end
    object QryShipmentsARCUSTO_FAX_NUMBER: TStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 25
      FieldName = 'ARCUSTO_FAX_NUMBER'
      Origin = 'ARCUSTO_FAX_NUMBER'
      Size = 25
    end
    object QryShipmentsPOOL_BILL_NUMBER: TStringField
      DisplayLabel = 'Pool Bill #'
      DisplayWidth = 30
      FieldName = 'POOL_BILL_NUMBER'
      Origin = 'POOL_BILL_NUMBER'
      Size = 50
    end
    object QryShipmentsSHIP_VIA: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 15
      FieldName = 'SHIP_VIA'
      Origin = 'SHIP_VIA'
      Visible = False
      Size = 30
    end
    object QryShipmentsSHIP_TO_SHIP_TIME: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_SHIP_TIME'
      Origin = 'SHIP_TO_SHIP_TIME'
      Visible = False
      Size = 3
    end
    object QryShipmentsCityStateZip: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CityStateZip'
      Visible = False
      Calculated = True
    end
    object QryShipmentsShipCityStateZip: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'ShipCityStateZip'
      Visible = False
      Calculated = True
    end
    object QryShipmentsBillCityStateZip: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'BillCityStateZip'
      Visible = False
      Calculated = True
    end
    object QryShipmentsFREIGHT_DESCRIP: TStringField
      DisplayWidth = 30
      FieldName = 'FREIGHT_DESCRIP'
      Origin = 'FREIGHT_DESCRIP'
      Visible = False
      Size = 60
    end
    object QryShipmentsPRO_NO: TStringField
      DisplayWidth = 25
      FieldName = 'PRO_NO'
      Origin = 'PRO_NO'
      Visible = False
      Size = 25
    end
    object QryShipmentsSHIP_TIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'SHIP_TIME'
      Origin = 'SHIP_TIME'
      Visible = False
    end
    object QryShipmentsEST_ARRIVAL: TDateTimeField
      DisplayWidth = 18
      FieldName = 'EST_ARRIVAL'
      Origin = 'EST_ARRIVAL'
      Visible = False
    end
    object QryShipmentsCONVEYANCE_NO: TStringField
      DisplayWidth = 25
      FieldName = 'CONVEYANCE_NO'
      Origin = 'CONVEYANCE_NO'
      Visible = False
      Size = 25
    end
    object QryShipmentsBOX_CODE: TStringField
      DisplayWidth = 10
      FieldName = 'BOX_CODE'
      Origin = 'BOX_CODE'
      Visible = False
      Size = 10
    end
    object QryShipmentsTO_INVOICE: TStringField
      DisplayWidth = 1
      FieldName = 'TO_INVOICE'
      Origin = 'TO_INVOICE'
      Visible = False
      Size = 1
    end
    object QryShipmentsARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryShipmentsUSERID: TStringField
      DisplayWidth = 35
      FieldName = 'USERID'
      Origin = 'USERID'
      Visible = False
      Size = 35
    end
    object QryShipmentsBOL_COMMENT1: TStringField
      DisplayWidth = 10
      FieldName = 'BOL_COMMENT1'
      Origin = 'BOL_COMMENT1'
      Visible = False
      Size = 2000
    end
    object QryShipmentsSHIPMENT_TYPE: TStringField
      DisplayWidth = 50
      FieldName = 'SHIPMENT_TYPE'
      Origin = 'SHIPMENT_TYPE'
      Visible = False
      Size = 50
    end
    object QryShipmentsEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryShipmentsARCHIVED: TStringField
      DisplayWidth = 1
      FieldName = 'ARCHIVED'
      Origin = 'ARCHIVED'
      Visible = False
      Size = 1
    end
    object QryShipmentsEDI_CREATED: TStringField
      DisplayWidth = 1
      FieldName = 'EDI_CREATED'
      Origin = 'EDI_CREATED'
      Visible = False
      Size = 1
    end
    object QryShipmentsTRACKING_NUM: TStringField
      DisplayWidth = 50
      FieldName = 'TRACKING_NUM'
      Origin = 'TRACKING_NUM'
      Visible = False
      Size = 50
    end
    object QryShipmentsVMI: TStringField
      DisplayWidth = 1
      FieldName = 'VMI'
      Origin = 'VMI'
      Visible = False
      Size = 1
    end
    object QryShipmentsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 's.ID'
      Required = True
      Visible = False
      Size = 0
    end
    object QryShipmentsPALLET_COUNT: TBCDField
      FieldName = 'PALLET_COUNT'
      Origin = 'PALLET_COUNT'
      Visible = False
      Size = 0
    end
    object QryShipmentsSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Origin = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object QryShipmentsFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Origin = 'FREIGHT_ID'
      Visible = False
      Size = 0
    end
    object QryShipmentsPS_TICKET_ID: TBCDField
      FieldName = 'PS_TICKET_ID'
      Origin = 'PS_TICKET_ID'
      Visible = False
      Size = 0
    end
    object QryShipmentsAUTO_FREIGHT_PRICE: TBCDField
      FieldName = 'AUTO_FREIGHT_PRICE'
      Origin = 'AUTO_FREIGHT_PRICE'
      currency = True
      Size = 2
    end
    object QryShipmentsNeedInventoryVerification: TStringField
      FieldKind = fkCalculated
      FieldName = 'NeedInventoryVerification'
      Size = 1
      Calculated = True
    end
    object QryShipmentsPS_TICKET_BATCH: TBCDField
      FieldName = 'PS_TICKET_BATCH'
      Origin = 'PS_TICKET_BATCH'
      Size = 0
    end
    object QryShipmentsEPlant_Name: TStringField
      FieldKind = fkCalculated
      FieldName = 'EPlant_Name'
      Size = 50
      Calculated = True
    end
    object QryShipmentsBILL_TO_ID: TBCDField
      FieldName = 'BILL_TO_ID'
      Size = 0
    end
    object QryShipmentsShipVia: TStringField
      FieldKind = fkCalculated
      FieldName = 'ShipVia'
      Size = 30
      Calculated = True
    end
    object QryShipmentsVOID_DATE: TDateTimeField
      FieldName = 'VOID_DATE'
    end
  end
  object SrcShip_Dtl: TDataSource
    DataSet = QryShipDetail
    Left = 197
    Top = 299
  end
  object QryShipDetail: TFDQuery
    Tag = 1
    OnCalcFields = QryShipDetailCalcFields
    CachedUpdates = True
    MasterSource = SrcShipments
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select s.id,'
      '       s.shipments_id,'
      '       s.order_dtl_id,'
      '       s.qtyshipped,'
      '       s.backorder_qty,'
      '       a.invoiced_qty as invoiced_qty,'
      '       b.invoiced_qty as ord_invoiced_qty,'
      '       s.cmtline,'
      
        '       decode( h.id, NULL,  d.comment1, h.comment1 ) as ord_deta' +
        'il_cmtline,'
      '       decode( ho.id, NULL, o.orderno,  ho.orderno ) as orderno,'
      '       m.shipment_type,'
      '       decode( h.id, NULL, d.unit,  h.unit ) as uom,'
      '       o.crm_quote_id,'
      '       q.rfq as crm_quote_rfq,'
      '       q.project as crm_quote_descrip,'
      '       s.ran,'
      '       decode( ho.id, NULL, o.pono,  ho.pono ) as pono'
      '  from shipments_void m,'
      '       shipment_dtl_void s,'
      '       ord_detail d,'
      '       hist_ord_detail h,'
      '       orders o,'
      '       hist_orders ho,'
      '       c_arinvoice_ship_sum a,'
      '       c_arinvoice_ord_sum b,'
      '       crm_quote q'
      ' where'
      '       s.shipments_id = :ID'
      
        '   and m.id = s.shipments_id                -- to get shipment_t' +
        'ype'
      '   and s.id = a.shipment_dtl_id(+)'
      '   and s.order_dtl_id = b.ord_detail_id(+)'
      
        '   and s.order_dtl_id = d.id(+)             -- link in current o' +
        'rders for comment1'
      
        '   and s.order_dtl_id = h.id(+)             -- same for hist ord' +
        'ers'
      
        '   and d.orders_id = o.id(+)                -- link in orders to' +
        ' get orderno'
      
        '   and h.orders_id = ho.id(+)               -- link in hist orde' +
        'rs to get orderno'
      
        '   and q.id(+) = o.crm_quote_id             -- linked CRM Quotat' +
        'ion'
      '   '
      'order by s.id'
      '')
    Left = 197
    Top = 277
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryShipDetailORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 7
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryShipDetailItemNo: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'ItemNo'
      Size = 25
      Calculated = True
    end
    object QryShipDetailDescription: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'Description'
      Size = 250
      Calculated = True
    end
    object QryShipDetailQTYSHIPPED: TBCDField
      DisplayLabel = 'Quantity ~Shipped'
      DisplayWidth = 11
      FieldName = 'QTYSHIPPED'
    end
    object QryShipDetailBACKORDER_QTY: TBCDField
      DisplayLabel = 'Backlog'
      DisplayWidth = 8
      FieldName = 'BACKORDER_QTY'
    end
    object QryShipDetailINVOICED_QTY: TBCDField
      DisplayLabel = 'Packing Slip ~Invoiced Quantity'
      DisplayWidth = 13
      FieldName = 'INVOICED_QTY'
    end
    object QryShipDetailORD_INVOICED_QTY: TBCDField
      DisplayLabel = 'Order ~Invoiced Quantity'
      DisplayWidth = 13
      FieldName = 'ORD_INVOICED_QTY'
    end
    object QryShipDetailSHIPMENT_TYPE: TStringField
      DisplayLabel = 'Shipment Type'
      DisplayWidth = 14
      FieldName = 'SHIPMENT_TYPE'
      Size = 50
    end
    object QryShipDetailUOM: TStringField
      DisplayLabel = 'Order UOM'
      DisplayWidth = 10
      FieldName = 'UOM'
      Size = 10
    end
    object QryShipDetailCRM_QUOTE_RFQ: TStringField
      DisplayLabel = 'Sales Quotation #'
      DisplayWidth = 13
      FieldName = 'CRM_QUOTE_RFQ'
      FixedChar = True
      Size = 10
    end
    object QryShipDetailRAN: TStringField
      DisplayLabel = 'R.A.N. / KanBan'
      DisplayWidth = 30
      FieldName = 'RAN'
      Size = 30
    end
    object QryShipDetailextDescrip: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'extDescrip'
      Size = 100
      Calculated = True
    end
    object QryShipDetailClass: TStringField
      DisplayLabel = 'Item Class'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'Class'
      Size = 2
      Calculated = True
    end
    object QryShipDetailRev: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'Rev'
      Size = 25
      Calculated = True
    end
    object QryShipDetailAKA_ItemNo: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 22
      FieldKind = fkCalculated
      FieldName = 'AKA_ItemNo'
      Size = 25
      Calculated = True
    end
    object QryShipDetailAKA_Descrip: TStringField
      DisplayLabel = 'AKA Description'
      DisplayWidth = 26
      FieldKind = fkCalculated
      FieldName = 'AKA_Descrip'
      Size = 50
      Calculated = True
    end
    object QryShipDetailAKA_Rev: TStringField
      DisplayLabel = 'AKA Rev'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'AKA_Rev'
      Size = 25
      Calculated = True
    end
    object QryShipDetailAKA_Descrip2: TStringField
      DisplayLabel = 'AKA Ext Description'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'AKA_Descrip2'
      Size = 100
      Calculated = True
    end
    object QryShipDetailOrder_id: TFloatField
      DisplayLabel = 'Order#~'
      DisplayWidth = 6
      FieldKind = fkCalculated
      FieldName = 'Order_id'
      Visible = False
      Calculated = True
    end
    object QryShipDetailID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryShipDetailSHIPMENTS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENTS_ID'
      Visible = False
      Size = 0
    end
    object QryShipDetailORDER_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDER_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryShipDetailArinvt_ID: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Arinvt_ID'
      LookupKeyFields = 'ID'
      LookupResultField = 'ARINVT_ID'
      KeyFields = 'ORDER_DTL_ID'
      Visible = False
      Calculated = True
    end
    object QryShipDetailCalc_Arinvt_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Arinvt_ID'
      Visible = False
      Calculated = True
    end
    object QryShipDetailCMTLINE: TStringField
      FieldName = 'CMTLINE'
      Visible = False
      Size = 2000
    end
    object QryShipDetailORD_DETAIL_CMTLINE: TStringField
      FieldName = 'ORD_DETAIL_CMTLINE'
      ReadOnly = True
      Visible = False
      Size = 2000
    end
    object QryShipDetailCRM_QUOTE_ID: TBCDField
      FieldName = 'CRM_QUOTE_ID'
      Visible = False
      Size = 0
    end
    object QryShipDetailCRM_QUOTE_DESCRIP: TStringField
      DisplayLabel = 'Sales Quotation Description'
      FieldName = 'CRM_QUOTE_DESCRIP'
      Visible = False
      Size = 35
    end
    object QryShipDetailPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Visible = False
      Size = 35
    end
  end
  object PkShipments: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.packslipno            as packslipno,'
      '       s.arcusto_company       as arcusto_company,'
      '       s.arcusto_prime_contact as arcusto_prime_contact,'
      '       s.arcusto_addr1         as arcusto_addr1,'
      '       s.arcusto_city          as arcusto_city,'
      '       s.arcusto_state         as arcusto_state,'
      '       s.arcusto_zip           as arcusto_zip,'
      '       s.arcusto_country       as arcusto_country,'
      '       s.arcusto_phone_number  as arcusto_phone_number,'
      '       s.ship_to_attn          as ship_to_attn,'
      '       s.ship_to_prime_contact as ship_to_prime_contact,'
      '       s.ship_to_addr1         as ship_to_addr1,'
      '       s.ship_to_city          as ship_to_city,'
      '       s.ship_to_state         as ship_to_state,'
      '       s.ship_to_zip           as ship_to_zip,'
      '       s.ship_to_country       as ship_to_country,'
      '       s.shipdate              as shipdate,'
      '       s.ps_date               as ps_date,'
      '       s.id                    as id,'
      '       s.eplant_id             as eplant_id,'
      '       NVL(s.archived, '#39'N'#39')    as archived,'
      '       s.ps_ticket_id          as ps_ticket_id,'
      '       s.ps_ticket_batch       as ps_ticket_batch,'
      '       h.pono                  as pono,'
      '       s.void_date             as void_date'
      ''
      '-- DO NOT REMOVE THE FOLLOWING LINE'
      '-- HPICK_FROM_START'
      '       '
      '  from shipments_void s, '
      '  '
      '       ( select count(*) cust_count '
      '           from s_user_crm_customers '
      '          where user_name = misc.GetUserName and rownum < 2 ) b,'
      '          '
      '       c_shipments_pono h '
      ''
      '-- DO NOT REMOVE THE FOLLOWING LINE'
      '-- HPICK_WHERE_START'
      ''
      ' where '
      '        NVL(s.shipment_type, '#39' '#39') <> '#39'CUM SHIP ADJUSTMENT'#39
      '        '
      '   and ( b.cust_count = 0 '
      '         or '
      
        '         s.arcusto_id in ( select arcusto_id from s_user_crm_cus' +
        'tomers where user_name = misc.GetUserName )) '
      '        '
      '   and s.id = h.shipments_id(+)'
      '  and  misc.eplant_filter(s.eplant_id) = 1'
      '   '
      ''
      '-- HPICK_EMPTY_DATASET_FILTER_START'
      'and 1 < 0'
      '-- HPICK_EMPTY_DATASET_FILTER_END'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcShipments
    AssociatedQueryNavigator = NavShipments
    ForceShowWaitForPrompt = False
    Left = 119
    Top = 278
    object PkShipmentsARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'S.ARCUSTO_COMPANY'
      Size = 60
    end
    object PkShipmentsARCUSTO_PRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_PRIME_CONTACT'
      Origin = 'S.ARCUSTO_PRIME_CONTACT'
      Size = 30
    end
    object PkShipmentsARCUSTO_ADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_ADDR1'
      Origin = 'S.ARCUSTO_ADDR1'
      Size = 60
    end
    object PkShipmentsARCUSTO_CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'ARCUSTO_CITY'
      Origin = 'S.ARCUSTO_CITY'
      Size = 30
    end
    object PkShipmentsARCUSTO_STATE: TStringField
      DisplayLabel = 'State/Region'
      DisplayWidth = 12
      FieldName = 'ARCUSTO_STATE'
      Origin = 'S.ARCUSTO_STATE'
    end
    object PkShipmentsARCUSTO_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ARCUSTO_ZIP'
      Origin = 'S.ARCUSTO_ZIP'
    end
    object PkShipmentsARCUSTO_COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 12
      FieldName = 'ARCUSTO_COUNTRY'
      Origin = 'S.ARCUSTO_COUNTRY'
      FixedChar = True
      Size = 100
    end
    object PkShipmentsSHIPDATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 12
      FieldName = 'SHIPDATE'
      Origin = 'S.SHIPDATE'
    end
    object PkShipmentsPS_DATE: TDateTimeField
      DisplayLabel = 'Packing Slip Date'
      DisplayWidth = 12
      FieldName = 'PS_DATE'
      Origin = 'S.PS_DATE'
    end
    object PkShipmentsID: TBCDField
      FieldName = 'ID'
      Origin = 'S.ID'
      Visible = False
      Size = 0
    end
    object PkShipmentsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'S.EPLANT_ID'
      Size = 0
    end
    object PkShipmentsPACKSLIPNO: TStringField
      DisplayLabel = 'Packing Slip #'
      FieldName = 'PACKSLIPNO'
      Origin = 'S.PACKSLIPNO'
      Size = 15
    end
    object PkShipmentsARCHIVED: TStringField
      DisplayLabel = 'Archived'
      FieldName = 'ARCHIVED'
      Origin = 'S.ARCHIVED'
      Size = 1
    end
    object PkShipmentsPS_TICKET_ID: TBCDField
      DisplayLabel = 'Pick Ticket #'
      FieldName = 'PS_TICKET_ID'
      Origin = 'S.PS_TICKET_ID'
      Size = 0
    end
    object PkShipmentsPS_TICKET_BATCH: TBCDField
      DisplayLabel = 'Batch'
      FieldName = 'PS_TICKET_BATCH'
      Origin = 'S.PS_TICKET_BATCH'
      Size = 0
    end
    object PkShipmentsSHIP_TO_PRIME_CONTACT: TStringField
      DisplayLabel = 'Ship To Contact'
      FieldName = 'SHIP_TO_PRIME_CONTACT'
      Origin = 'S.SHIP_TO_PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkShipmentsSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To Company'
      DisplayWidth = 20
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'S.SHIP_TO_ATTN'
      FixedChar = True
      Size = 60
    end
    object PkShipmentsSHIP_TO_ADDR1: TStringField
      DisplayLabel = 'Ship To Address 1'
      FieldName = 'SHIP_TO_ADDR1'
      Origin = 'S.SHIP_TO_ADDR1'
      Size = 60
    end
    object PkShipmentsSHIP_TO_CITY: TStringField
      DisplayLabel = 'Ship To City'
      FieldName = 'SHIP_TO_CITY'
      Origin = 'S.SHIP_TO_CITY'
      FixedChar = True
      Size = 30
    end
    object PkShipmentsSHIP_TO_STATE: TStringField
      DisplayLabel = 'Ship To State/Region'
      FieldName = 'SHIP_TO_STATE'
      Origin = 'S.SHIP_TO_STATE'
    end
    object PkShipmentsSHIP_TO_ZIP: TStringField
      DisplayLabel = 'Ship To Postal Code'
      FieldName = 'SHIP_TO_ZIP'
      Origin = 'S.SHIP_TO_ZIP'
      FixedChar = True
    end
    object PkShipmentsSHIP_TO_COUNTRY: TStringField
      DisplayLabel = 'Ship To Country'
      FieldName = 'SHIP_TO_COUNTRY'
      Origin = 'S.SHIP_TO_COUNTRY'
      FixedChar = True
      Size = 100
    end
    object PkShipmentsPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Size = 35
    end
    object PkShipmentsVOID_DATE: TDateTimeField
      DisplayLabel = 'Void Date'
      FieldName = 'VOID_DATE'
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 80
    Top = 277
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
    ModuleName = 'FrmPSVoided'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193291 $'
    BuildVersion = '176554'
    Left = 80
    Top = 310
  end
end
