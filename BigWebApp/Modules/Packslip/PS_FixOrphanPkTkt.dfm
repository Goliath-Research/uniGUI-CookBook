object FrmPSFixOrphanedPkTkt: TFrmPSFixOrphanedPkTkt
  Left = 216
  Top = 168
  HelpContext = 1093621
  ClientHeight = 324
  ClientWidth = 563
  Caption = 'Orphaned Pick Ticket Releases'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 157
    Width = 563
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlPkTktOrdDtl: TUniPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 157
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 561
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      ExplicitTop = 27
    end
    object wwGridPkTktOrdDtl: TIQUniGridControl
      Left = 1
      Top = 3
      Width = 561
      Height = 154
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 344
      IQComponents.Grid.Height = 68
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcPkTktOrdDetail
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 100
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcPkTktOrdDetail
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 344
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 68
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 41
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 70
      DataSource = SrcPkTktOrdDetail
      Columns = <
        item
          FieldName = 'ORDERNO'
          Title.Caption = 'Order #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PONO'
          Title.Caption = 'PO #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Revision'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BACKLOG_QTY'
          Title.Caption = 'Total Backlog'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DOCKID'
          Title.Caption = 'Dock ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitTop = 30
      ExplicitHeight = 127
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 160
    Width = 563
    Height = 164
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 255
      Top = 0
      Width = 6
      Height = 164
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlPkTktDtl: TUniPanel
      Left = 1
      Top = 1
      Width = 255
      Height = 162
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Bevel2: TUniPanel
        Left = 1
        Top = 47
        Width = 253
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
      end
      object wwGridPkTktDtl: TIQUniGridControl
        Left = 1
        Top = 50
        Width = 253
        Height = 112
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 36
        IQComponents.Grid.Height = 26
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = wwSrcPS_Detail
        IQComponents.Grid.LoadMask.Message = 'Loading data...'
        IQComponents.Grid.Align = alClient
        IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
        IQComponents.Grid.TabOrder = 0
        IQComponents.Navigator.Left = 410
        IQComponents.Navigator.Top = 0
        IQComponents.Navigator.Width = 100
        IQComponents.Navigator.Height = 25
        IQComponents.Navigator.Hint = ''
        IQComponents.Navigator.ShowHint = True
        IQComponents.Navigator.DataSource = wwSrcPS_Detail
        IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 36
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 26
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = wwSrcPS_Detail
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = '#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SHIP_QUAN'
            Title.Caption = 'Ship Quantity'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MUST_SHIP_DATE'
            Title.Caption = 'Must Ship'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CMTLINE'
            Title.Caption = 'Comment'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PTS_PER_PKG'
            Title.Caption = 'Parts / Package'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object Panel1: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 253
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Panel3: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 251
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object Label4: TUniLabel
            Left = 1
            Top = 1
            Width = 109
            Height = 13
            Hint = ''
            Caption = 'Orphaned Releases'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
    end
    object Panel5: TUniPanel
      Left = 289
      Top = 1
      Width = 274
      Height = 162
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Bevel3: TUniPanel
        Left = 1
        Top = 47
        Width = 272
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
      end
      object wwGridReleases: TIQUniGridControl
        Left = 1
        Top = 50
        Width = 272
        Height = 112
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 55
        IQComponents.Grid.Height = 26
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcReleases
        IQComponents.Grid.LoadMask.Message = 'Loading data...'
        IQComponents.Grid.Align = alClient
        IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
        IQComponents.Grid.TabOrder = 0
        IQComponents.Navigator.Left = 410
        IQComponents.Navigator.Top = 0
        IQComponents.Navigator.Width = 100
        IQComponents.Navigator.Height = 25
        IQComponents.Navigator.Hint = ''
        IQComponents.Navigator.ShowHint = True
        IQComponents.Navigator.DataSource = SrcReleases
        IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 55
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 26
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcReleases
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = '#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QUAN'
            Title.Caption = 'Quantity'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REQUEST_DATE'
            Title.Caption = 'Requested'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROMISE_DATE'
            Title.Caption = 'Promised'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'RAN'
            Title.Caption = 'RAN #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FORECAST'
            Title.Caption = 'Forecast'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'LEFT_TO_SHIP'
            Title.Caption = 'Left To Ship'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object Panel10: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 272
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Panel11: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 270
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object Label5: TUniLabel
            Left = 1
            Top = 1
            Width = 174
            Height = 13
            Hint = ''
            Caption = 'Available Sales Order Releases'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object Panel12: TUniPanel
          Tag = 1999
          Left = 1
          Top = 20
          Width = 270
          Height = 27
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object sbtnHideShipped: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 26
            Height = 23
            Hint = 'Hide Shipped Releases'
            ShowHint = True
            ParentShowHint = False
            GroupIndex = 1
            AllowAllUp = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
              20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
              5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
              B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
              D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
              E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
              F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
              B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
              E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
              4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
              F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
              E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
              CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
              FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
              F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
              8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
              FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
              F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
              E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
              FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
              FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
              8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
              FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
              FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
              F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
              FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
              60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
              9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
              F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
              8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnHideShippedClick
          end
        end
      end
    end
    object Panel8: TUniPanel
      Left = 261
      Top = 1
      Width = 28
      Height = 162
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Caption = ''
      object sbtnAssociateRelease: TUniSpeedButton
        Left = 1
        Top = 67
        Width = 23
        Height = 22
        Hint = 
          'Associate the selected, orphaned Pick Ticket release with the se' +
          'lected Sales Order release'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000130B0000130B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAC2B2
          AE92818162517253439A7761C6AA91FF00FFDABDA9AD8E7B80604F725140966F
          56BE997BFF00FFFF00FFFF00FFC1C1C1808080626262535353767676A7A7A7FF
          00FFBBBBBB8D8D8D6060605151516E6E6E979797FF00FFFF00FFDFCAB8B9A18A
          D0B8B0F0D8D0E0C8C0B09880816151B59C85B9A089D0B8B0F0D8D0E0C8C0B098
          807F5E4DBD9376FF00FFC8C8C89E9E9EB8B8B8D9D9D9C9C9C995959561616199
          99999D9D9DB8B8B8D9D9D9C9C9C99595955E5E5EFF00FFFF00FFC7B19BE0D8D0
          B69988A48568BEA68E502810402810402810402810725941A28264BCA28ACCB1
          98C0A0908C6349FF00FFAFAFAFD7D7D7989898828282A3A3A328282826262626
          26262626265656567F7F7F9F9F9FAEAEAEA0A0A0626262FF00FFC3A494FFFFFF
          653F27DFC6B4D8B9A9FFFFFFFFFFF0FFF0E0FFE0D0F0D8C098745BE1BFA4B89E
          86F0D8C0684736FF00FFA4A4A4FFFFFF3F3F3FC5C5C5B8B8B8FFFFFFFDFDFDEE
          EEEEE0E0E0D5D5D5727272BDBDBD9B9B9BD5D5D5474747FF00FFD2B6A6F0E8E0
          B699886F4B337C644DC7AF97D0B8A0D0B0A0E0C0B0D2B2A26E4E3D7B6149C09F
          8CD0B0A097735FFF00FFB5B5B5E7E7E79898984A4A4A626262ACACACB5B5B5AF
          AFAFC0C0C0B1B1B14E4E4E5F5F5F9E9E9EAFAFAF727272FF00FFE9D2C2D5B6A6
          F0E0D0FFFFFFFFF8F0E0C8B0AB927BC8AA97D5B5A5F0E0D0FFFFFFFFF8F0E0C8
          B0A98F77CCA48BFF00FFD1D1D1B5B5B5DEDEDEFFFFFFF7F7F7C5C5C5909090A9
          A9A9B4B4B4DEDEDEFFFFFFF7F7F7C5C5C58D8D8DA3A3A3FF00FFFF00FFE9D1C1
          D6BAA9C7A898B9A189C2A993DFC3AAFF00FFE9CCB8D5B6A3C6A695B89F86BEA2
          88D7B294FF00FFFF00FFFF00FFD0D0D0B9B9B9A7A7A79E9E9EA7A7A7C0C0C0FF
          00FFCBCBCBB5B5B5A5A5A59C9C9C9F9F9FB0B0B0FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnAssociateReleaseClick
      end
    end
  end
  object wwSrcPS_Detail: TDataSource
    DataSet = wwQryPS_Detail
    Left = 80
    Top = 79
  end
  object wwQryPS_Detail: TFDQuery
    MasterSource = SrcPkTktOrdDetail
    MasterFields = 'PS_TICKET_ID;ORD_DETAIL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select '
      '       p.id,'
      '       p.release_id,'
      '       p.seq,'
      '       p.must_ship_date,'
      '       p.ship_quan,'
      '       p.pts_per_pkg,'
      '       p.cmtline'
      '  from '
      '       ps_ticket_dtl p,'
      '       releases r'
      ' where '
      '       p.ps_ticket_id = :ps_ticket_id'
      '   and p.ord_detail_id = :ord_detail_id'
      '   and p.release_id = r.id(+)'
      '   and r.id is NULL'
      ' order by '
      '       seq'
      ' ')
    Left = 79
    Top = 93
    ParamData = <
      item
        Name = 'PS_TICKET_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'ORD_DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object wwQryPS_DetailSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 2
      FieldName = 'SEQ'
      Origin = 'PS_TICKET_DTL.SEQ'
      Size = 0
    end
    object wwQryPS_DetailSHIP_QUAN: TBCDField
      DisplayLabel = 'Ship Quantity'
      DisplayWidth = 10
      FieldName = 'SHIP_QUAN'
    end
    object wwQryPS_DetailMUST_SHIP_DATE: TDateTimeField
      DisplayLabel = 'Must Ship'
      DisplayWidth = 11
      FieldName = 'MUST_SHIP_DATE'
      ReadOnly = True
    end
    object wwQryPS_DetailCMTLINE: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 27
      FieldName = 'CMTLINE'
      Origin = 'PS_TICKET_DTL.CMTLINE'
      Size = 2000
    end
    object wwQryPS_DetailPTS_PER_PKG: TFMTBCDField
      DisplayLabel = 'Parts / Package'
      DisplayWidth = 10
      FieldName = 'PTS_PER_PKG'
      Size = 6
    end
    object wwQryPS_DetailID: TBCDField
      FieldName = 'ID'
      Origin = 'PS_TICKET_DTL.ID'
      Visible = False
      Size = 0
    end
    object wwQryPS_DetailRELEASE_ID: TBCDField
      FieldName = 'RELEASE_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcReleases: TDataSource
    DataSet = QryReleases
    Left = 120
    Top = 79
  end
  object QryReleases: TFDQuery
    Tag = 1
    OnFilterRecord = QryReleasesFilterRecord
    MasterSource = SrcPkTktOrdDetail
    MasterFields = 'ORD_DETAIL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select r.seq,'
      '       r.request_date,'
      '       r.promise_date,'
      '       r.quan,'
      '       r.forecast,'
      '       r.ran,'
      '       r.id,'
      '       decode( r.ship_date, '
      '               NULL, decode( NVL(shipped_quan,0),'
      '                             0, r.quan,'
      
        '                             greatest( 0, NVL(quan,0) - NVL(ship' +
        'ped_quan,0) )),'
      '               0 ) as left_to_ship'
      '  from '
      '       releases r,'
      '       ps_ticket_dtl p'
      ' where'
      '       r.ord_detail_id = :ord_detail_id'
      '   and r.id = p.release_id(+)'
      '   and p.id is NULL'
      ' order by   '
      '       r.seq')
    Left = 120
    Top = 93
    ParamData = <
      item
        Name = 'ORD_DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryReleasesSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 3
      FieldName = 'SEQ'
      Size = 0
    end
    object QryReleasesQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 11
      FieldName = 'QUAN'
    end
    object QryReleasesREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Requested'
      DisplayWidth = 15
      FieldName = 'REQUEST_DATE'
    end
    object QryReleasesPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promised'
      DisplayWidth = 14
      FieldName = 'PROMISE_DATE'
    end
    object QryReleasesRAN: TStringField
      DisplayLabel = 'RAN #'
      DisplayWidth = 15
      FieldName = 'RAN'
      Size = 30
    end
    object QryReleasesFORECAST: TStringField
      DisplayLabel = 'Forecast'
      DisplayWidth = 7
      FieldName = 'FORECAST'
      FixedChar = True
      Size = 1
    end
    object QryReleasesLEFT_TO_SHIP: TFMTBCDField
      DisplayLabel = 'Left To Ship'
      DisplayWidth = 11
      FieldName = 'LEFT_TO_SHIP'
      Size = 38
    end
    object QryReleasesID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcPkTktOrdDetail: TDataSource
    DataSet = QryPkTktOrdDetail
    Left = 40
    Top = 79
  end
  object QryPkTktOrdDetail: TFDQuery
    BeforeOpen = QryPkTktOrdDetailBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      '       p.ps_ticket_id,'
      '       p.ord_detail_id,'
      '       o.orderno,'
      '       o.pono,'
      '       a.class,'
      
        '       decode( d.arinvt_id, NULL, '#39'Misc Item'#39', a.itemno) as item' +
        'no,'
      '       a.rev,'
      
        '       decode( d.arinvt_id, NULL, misc_item, a.descrip) as descr' +
        'ip,'
      
        '       NVL(d.total_qty_ord,0) - NVL(cumm_shipped,0) as backlog_q' +
        'ty,'
      '       d.dockid'
      
        '  from                                                          ' +
        '   '
      '       ps_ticket_dtl p,'
      '       ord_detail d,'
      '       orders o,'
      '       arinvt a,'
      '       releases r'
      ' where '
      '       p.ps_ticket_id = :id'
      '   and p.phantom_ps_ticket_dtl_id is null'
      '   and p.ord_detail_id = d.id(+)'
      '   and d.orders_id = o.id(+)'
      '   and d.arinvt_id = a.id(+)'
      '   and p.release_id = r.id(+)'
      '   and r.id is NULL'
      ' ')
    Left = 40
    Top = 92
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPkTktOrdDetailORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryPkTktOrdDetailPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 12
      FieldName = 'PONO'
      Size = 35
    end
    object QryPkTktOrdDetailCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryPkTktOrdDetailITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryPkTktOrdDetailREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 8
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryPkTktOrdDetailDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 38
      FieldName = 'DESCRIP'
      Size = 250
    end
    object QryPkTktOrdDetailBACKLOG_QTY: TFMTBCDField
      DisplayLabel = 'Total Backlog'
      DisplayWidth = 13
      FieldName = 'BACKLOG_QTY'
      Size = 38
    end
    object QryPkTktOrdDetailDOCKID: TStringField
      DisplayLabel = 'Dock ID'
      DisplayWidth = 10
      FieldName = 'DOCKID'
      Size = 30
    end
    object QryPkTktOrdDetailPS_TICKET_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PS_TICKET_ID'
      Visible = False
      Size = 0
    end
    object QryPkTktOrdDetailORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
  end
end
