inherited Snd_Process: TSnd_Process
  Left = 116
  Top = 184
  HelpContext = 5000249
  ClientHeight = 398
  ClientWidth = 596
  Caption = 'Processes'
  ExplicitWidth = 612
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TUniSplitter
    Top = 230
    Width = 596
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitTop = 230
    ExplicitWidth = 596
  end
  inherited PageControlHeader: TUniPageControl
    Width = 596
    Height = 203
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheetTable
    ExplicitWidth = 596
    ExplicitHeight = 203
    inherited TabSheetForm: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 588
      ExplicitHeight = 175
      object Splitter4: TUniSplitter [0]
        Left = 273
        Top = 0
        Width = 6
        Height = 156
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      inherited PnlHeader01: TUniPanel
        Width = 273
        Height = 156
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 273
        ExplicitHeight = 174
        inherited SplitterHeader01: TUniSplitter
          Height = 156
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitHeight = 156
        end
        inherited PnlHeaderLeft01: TUniPanel
          Height = 154
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitHeight = 154
          inherited Label2: TUniLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited Label7: TUniLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited Label1: TUniLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          object Label4: TUniLabel
            Left = 8
            Top = 76
            Width = 60
            Height = 13
            Hint = ''
            Caption = 'Center Type'
            TabOrder = 4
          end
          object Label9: TUniLabel
            Left = 8
            Top = 100
            Width = 51
            Height = 13
            Hint = ''
            Caption = 'Multiple Of'
            TabOrder = 5
          end
          object Label8: TUniLabel
            Left = 8
            Top = 124
            Width = 36
            Height = 13
            Hint = ''
            Caption = 'Yield %'
            TabOrder = 6
          end
        end
        inherited PnlHeaderClient01: TUniPanel
          Width = 186
          Height = 154
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 186
          ExplicitHeight = 154
          DesignSize = (
            186
            154)
          object sbtnCenterType: TUniSpeedButton [0]
            Left = 167
            Top = 72
            Width = 19
            Height = 22
            Hint = ''
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
            Anchors = [akTop, akRight]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnCenterTypeClick
          end
          object dblcCenterType: TUniDBLookupComboBox [1]
            Left = 1
            Top = 72
            Width = 164
            Height = 21
            Hint = 
              'Type of work center required to perform process - used to calcul' +
              'ate Rough Cut Capacity'
            ShowHint = True
            ParentShowHint = False
            ListFieldIndex = 0
            DataField = 'CNTR_TYPE'
            DataSource = SndDM.SrcSndOp
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Color = clWindow
          end
          object DBEdit4: TUniDBEdit [2]
            Left = 1
            Top = 96
            Width = 164
            Height = 21
            Hint = 
              'Quantity of parts produced in one cycle - Used with the Cycle Ti' +
              'me & Unit of Measure to determine rate of production'
            ShowHint = True
            ParentShowHint = False
            DataField = 'MULTIPLES'
            DataSource = SndDM.SrcSndOp
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
          object DBEdit3: TUniDBEdit [3]
            Left = 1
            Top = 120
            Width = 51
            Height = 21
            Hint = 
              'Standard percentage of product yielded from this process.  It is' +
              ' the inverse of scrap'
            ShowHint = True
            ParentShowHint = False
            DataField = 'SCRAP_DISP'
            DataSource = SndDM.SrcSndOp
            TabOrder = 5
          end
          inherited dbeOpNo: TUniDBEdit
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited dbeClass: TUniDBEdit
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited dbeOpDesc: TUniDBEdit
            Width = 164
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitWidth = 164
          end
          inherited dbchkPkHide: TUniDBCheckBox
            Top = 143
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 6
            ExplicitTop = 143
          end
          inherited dbchkSupermarket: TUniDBCheckBox
            Top = 158
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitTop = 158
          end
        end
      end
      object PnlHeader02: TUniPanel
        Left = 279
        Top = 0
        Width = 309
        Height = 156
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter3: TUniSplitter
          Left = 101
          Top = 0
          Width = 6
          Height = 156
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlHeaderLeft02: TUniPanel
          Left = 1
          Top = 1
          Width = 101
          Height = 154
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label3: TUniLabel
            Left = 8
            Top = 5
            Width = 30
            Height = 13
            Hint = ''
            Caption = 'EPlant'
            TabOrder = 1
          end
          object Label5: TUniLabel
            Left = 8
            Top = 29
            Width = 23
            Height = 13
            Hint = ''
            Caption = 'UOM'
            TabOrder = 2
          end
          object Label6: TUniLabel
            Left = 8
            Top = 53
            Width = 51
            Height = 13
            Hint = ''
            Caption = 'Cycle Time'
            TabOrder = 3
          end
          object Label16: TUniLabel
            Left = 8
            Top = 77
            Width = 59
            Height = 13
            Hint = ''
            Caption = 'Setup Hours'
            TabOrder = 4
          end
          object Label17: TUniLabel
            Left = 6
            Top = 101
            Width = 84
            Height = 13
            Hint = ''
            Caption = 'Take Down Hours'
            TabOrder = 5
          end
        end
        object PnlHeaderClient02: TUniPanel
          Left = 107
          Top = 1
          Width = 202
          Height = 154
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            202
            154)
          object DBEdit1: TUniDBEdit
            Left = 1
            Top = 1
            Width = 190
            Height = 21
            Hint = ''
            DataField = 'EPLANT_ID'
            DataSource = SndDM.SrcSndOp
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Color = clBtnFace
            ReadOnly = True
          end
          object DBComboBox1: TUniDBComboBox
            Left = 1
            Top = 25
            Width = 190
            Height = 21
            Hint = 
              'Unit of measure of cycle time value - Used with Cycle Time and M' +
              'ultiples Of to determine rate of production'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akLeft, akTop, akRight]
            DataField = 'UOM'
            DataSource = SndDM.SrcSndOp
            Style = csDropDownList
            Items.Strings = (
              'SEC'
              'MIN'
              'HOUR'
              'DAY')
            TabOrder = 1
          end
          object DBEdit2: TUniDBEdit
            Left = 1
            Top = 49
            Width = 190
            Height = 21
            Hint = 
              'Time required to perform process - Used with Multiples Of and UO' +
              'M to determine rate of production.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'CYCLETM_DISP'
            DataSource = SndDM.SrcSndOp
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object DBEdit5: TUniDBEdit
            Left = 1
            Top = 73
            Width = 190
            Height = 21
            Hint = 'Hours required to Setup this process'
            ShowHint = True
            ParentShowHint = False
            DataField = 'SETUPHRS'
            DataSource = SndDM.SrcSndOp
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object DBEdit6: TUniDBEdit
            Left = 1
            Top = 97
            Width = 190
            Height = 21
            Hint = 'Hours required to Take Down this process'
            ShowHint = True
            ParentShowHint = False
            DataField = 'SETUPHRS2'
            DataSource = SndDM.SrcSndOp
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object pnlSndOpPrRight01: TUniPanel
            Left = 179
            Top = 1
            Width = 23
            Height = 152
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 5
            Caption = ''
            object sbtnEPlant: TUniSpeedButton
              Left = 1
              Top = 1
              Width = 22
              Height = 22
              Hint = 'Assign Plant'
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
              OnClick = sbtnEPlantClick
            end
          end
        end
      end
      object PnlHeaderCheckboxes: TUniPanel
        Left = 0
        Top = 156
        Width = 588
        Height = 19
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        DesignSize = (
          588
          19)
        object dbchkFABAllowAllWC: TUniDBCheckBox
          Left = 1
          Top = 1
          Width = 380
          Height = 17
          Hint = 'Allow process login for any workcenter in FabData'
          ShowHint = True
          ParentShowHint = False
          DataField = 'FAB_ALLOW_ALL_WC'
          DataSource = SndDM.SrcSndOp
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Allow login for any workcenter'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
    end
    inherited TabSheetTable: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 588
      ExplicitHeight = 175
      inherited dbgOperHeader: TIQUniGridControl
        Width = 588
        Height = 175
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        IQComponents.Grid.Width = 371
        IQComponents.Grid.Height = 89
        IQComponents.HiddenPanel.Left = 371
        IQComponents.HiddenPanel.Height = 89
        IQComponents.HiddenPanel.ExplicitLeft = 371
        IQComponents.HiddenPanel.ExplicitHeight = 89
        IQComponents.FormTab.ExplicitWidth = 580
        IQComponents.FormTab.ExplicitHeight = 118
        Columns = <
          item
            FieldName = 'OP_CLASS'
            Title.Caption = 'Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPNO'
            Title.Caption = 'Oper #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPDESC'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER1'
            Title.Caption = 'CUSER1'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER2'
            Title.Caption = 'CUSER2'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER3'
            Title.Caption = 'CUSER3'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER4'
            Title.Caption = 'CUSER4'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER5'
            Title.Caption = 'CUSER5'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER6'
            Title.Caption = 'CUSER6'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER7'
            Title.Caption = 'CUSER7'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER8'
            Title.Caption = 'CUSER8'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER9'
            Title.Caption = 'CUSER9'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER10'
            Title.Caption = 'CUSER10'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER1'
            Title.Caption = 'NUSER1'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER2'
            Title.Caption = 'NUSER2'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER3'
            Title.Caption = 'NUSER3'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER4'
            Title.Caption = 'NUSER4'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER5'
            Title.Caption = 'NUSER5'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER6'
            Title.Caption = 'NUSER6'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER7'
            Title.Caption = 'NUSER7'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER8'
            Title.Caption = 'NUSER8'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER9'
            Title.Caption = 'NUSER9'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER10'
            Title.Caption = 'NUSER10'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'IS_SUPERMARKET'
            Title.Caption = 'Supermarket'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitWidth = 588
        ExplicitHeight = 175
        Marker = 0
      end
    end
  end
  inherited PageControlDetails: TUniPageControl
    Top = 233
    Width = 596
    Height = 165
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheetOpInfo
    ExplicitTop = 233
    ExplicitWidth = 596
    ExplicitHeight = 165
    inherited TabSheetOpInfo: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Qualified WorkCenters'
      ExplicitWidth = 588
      ExplicitHeight = 137
      object Bevel1: TUniPanel
        Left = 0
        Top = 27
        Width = 588
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
      end
      object Panel3: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 588
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object navWorkCenters: TUniDBNavigator
          Left = 363
          Top = 1
          Width = 225
          Height = 25
          Hint = ''
          DataSource = SndDM.SrcSndop_WC
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object wwDBGridWorkCenters: TIQUniGridControl
        Left = 0
        Top = 30
        Width = 588
        Height = 107
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 371
        IQComponents.Grid.Height = 21
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SndDM.SrcSndop_WC
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
        IQComponents.Navigator.DataSource = SndDM.SrcSndop_WC
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 371
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 21
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SndDM.SrcSndop_WC
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = '#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EqNo'
            Title.Caption = 'Work Center #'
            Width = 106
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Cntr_Desc'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Cntr_Type'
            Title.Caption = 'Center Type'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object wwDBComboBoxEqno: TUniDBComboBox
        Left = 160
        Top = 65
        Width = 121
        Height = 21
        Hint = ''
        Style = csDropDownList
        TabOrder = 2
        OnDropDown = wwDBComboBoxEqnoDropDown
      end
    end
    object TabJobs: TUniTabSheet [1]
      Hint = ''
      ImageIndex = 4
      Caption = 'Certified Jobs'
      object Bevel4: TUniPanel
        Left = 0
        Top = 27
        Width = 588
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
      end
      object Panel5: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 588
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object navJobs: TUniDBNavigator
          Left = 363
          Top = 1
          Width = 225
          Height = 25
          Hint = ''
          DataSource = SndDM.SrcSndopJobs
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object wwDBGrid1: TIQUniGridControl
        Left = 0
        Top = 30
        Width = 588
        Height = 107
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 371
        IQComponents.Grid.Height = 21
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SndDM.SrcSndopJobs
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
        IQComponents.Navigator.DataSource = SndDM.SrcSndopJobs
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 371
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 21
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SndDM.SrcSndopJobs
        Columns = <
          item
            FieldName = 'JobDescrip'
            Title.Caption = 'Job Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CERT_LEVEL'
            Title.Caption = 'Certification Level'
            Width = 100
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SUPERVISOR_RIGHTS'
            Title.Caption = 'Supervisor Rights'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object wwDBComboBoxJobDescrip: TUniDBComboBox
        Left = 87
        Top = 75
        Width = 121
        Height = 21
        Hint = ''
        TabOrder = 2
        OnDropDown = wwDBComboBoxJobDescripDropDown
      end
    end
    object TabInspection: TUniTabSheet [2]
      Hint = ''
      ImageIndex = 3
      Caption = 'Inspections'
      object Bevel5: TUniPanel
        Left = 0
        Top = 27
        Width = 588
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
      end
      object Panel4: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 588
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object navInsp: TUniDBNavigator
          Left = 363
          Top = 1
          Width = 225
          Height = 25
          Hint = ''
          DataSource = SndDM.SrcSndop_Insp
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object wwDBGridInspection: TIQUniGridControl
        Left = 0
        Top = 30
        Width = 588
        Height = 107
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 371
        IQComponents.Grid.Height = 21
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SndDM.SrcSndop_Insp
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
        IQComponents.Navigator.DataSource = SndDM.SrcSndop_Insp
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 371
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 21
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SndDM.SrcSndop_Insp
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = '#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Name'
            Title.Caption = 'Inspection'
            Width = 118
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Descrip'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRE_INSPECT'
            Title.Caption = 'Pre-Inspection'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'POST_INSPECT'
            Title.Caption = 'Post-Inspection'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object wwDBComboBoxInspection: TUniDBComboBox
        Left = 111
        Top = 70
        Width = 121
        Height = 21
        Hint = ''
        TabOrder = 2
        OnDropDown = wwDBComboBoxInspectionDropDown
      end
    end
    inherited TabSheetMaterials: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 588
      ExplicitHeight = 137
      inherited Splitter2: TUniSplitter
        Left = 310
        Height = 137
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        ExplicitLeft = 310
        ExplicitHeight = 137
      end
      inherited pnlMaterials: TUniPanel
        Width = 310
        Height = 137
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ExplicitWidth = 310
        ExplicitHeight = 137
        object Bevel6: TUniPanel [0]
          Left = 1
          Top = 27
          Width = 308
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Caption = ''
        end
        inherited GridMaterials: TUniDBGrid
          Top = 30
          Width = 308
          Height = 107
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ShowHint = True
          ParentShowHint = False
          Columns = <
            item
              FieldName = 'ItemNo'
              Title.Caption = 'Item #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PTSPER_DISP'
              Title.Caption = 'Parts Per'
              Width = 50
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Class'
              Title.Caption = 'Class'
              Width = 30
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Descrip'
              Title.Caption = 'Description'
              Width = 96
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ALLOC_REQ'
              Title.Caption = 'Allocation Required'
              Width = 99
              PickList.Strings = (
                'Y'
                'N')
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UNIT'
              Title.Caption = 'UOM'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Descrip2'
              Title.Caption = 'Ext Description'
              Width = 214
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Rev'
              Title.Caption = 'Rev'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Uom'
              Title.Caption = 'Native UOM'
              Width = 72
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STARTUP_QTY'
              Title.Caption = 'Startup Qty'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INCLUDE_STARTUP_QTY_STD_COST'
              Title.Caption = 'Include Startup Qty in Std Cost'
              Width = 154
              PickList.Strings = (
                'Y'
                'N')
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        inherited Panel1: TUniPanel
          Width = 308
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 308
          inherited navMaterials: TUniDBNavigator
            Left = 182
            Width = 126
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            ExplicitLeft = 182
            ExplicitWidth = 126
          end
        end
      end
      inherited pnlMatQPB: TUniPanel
        Left = 314
        Width = 274
        Height = 137
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ExplicitLeft = 314
        ExplicitWidth = 274
        ExplicitHeight = 137
        object Bevel7: TUniPanel [0]
          Left = 1
          Top = 27
          Width = 272
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Caption = ''
        end
        inherited GridQtyBreaks: TUniDBGrid
          Top = 30
          Width = 272
          Height = 107
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Columns = <
            item
              FieldName = 'QUAN'
              Title.Caption = 'Quantity'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QPRICE'
              Title.Caption = 'Price Break'
              Width = 72
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        inherited Panel2: TUniPanel
          Width = 272
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 272
          inherited navMatQPB: TUniDBNavigator
            Left = 147
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 147
          end
        end
      end
    end
    object TabSheetCosting: TUniTabSheet [4]
      Hint = ''
      ImageIndex = 5
      Caption = 'Standard Cost'
      object Splitter7: TUniSplitter
        Left = 245
        Top = 0
        Width = 6
        Height = 137
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLabor01: TUniPanel
        Left = 0
        Top = 0
        Width = 245
        Height = 137
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object PnlLaborHeaderBar: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 243
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -12
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object lblLaborHeader: TUniLabel
            Left = 1
            Top = 1
            Width = 35
            Height = 14
            Hint = ''
            Caption = 'Labor'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object PnlLaborInner01: TUniPanel
          Left = 1
          Top = 20
          Width = 243
          Height = 117
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter5: TUniSplitter
            Left = 81
            Top = 0
            Width = 6
            Height = 117
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLaborLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 81
            Height = 115
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label11: TUniLabel
              Left = 8
              Top = 7
              Width = 73
              Height = 14
              Hint = ''
              Caption = 'Cost Element'
              ParentFont = False
              Font.Height = -12
              TabOrder = 1
            end
            object lOperators: TUniLabel
              Left = 8
              Top = 31
              Width = 49
              Height = 13
              Hint = ''
              Caption = 'Operators'
              TabOrder = 2
            end
            object Label10: TUniLabel
              Left = 8
              Top = 55
              Width = 22
              Height = 13
              Hint = ''
              Caption = 'Cost'
              TabOrder = 3
            end
          end
          object PnlLaborClient01: TUniPanel
            Left = 87
            Top = 1
            Width = 156
            Height = 115
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 84
            ExplicitWidth = 161
            DesignSize = (
              156
              115)
            object wwDBLookupComboLbrElem: TUniDBLookupComboBox
              Left = 1
              Top = 3
              Width = 159
              Height = 21
              Hint = ''
              ListFieldIndex = 0
              DataField = 'ELEMENTS_ID_LBR'
              DataSource = SndDM.SrcSndOp
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Color = clWindow
            end
            object wwcomboOperator: TUniDBComboBox
              Left = 1
              Top = 27
              Width = 159
              Height = 21
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'OPERATOR'
              DataSource = SndDM.SrcSndOp
              TabOrder = 1
              ReadOnly = True
              OnDropDown = wwcomboOperatorDropDown
            end
            object wwDBComboBoxLbrCost: TUniDBComboBox
              Left = 1
              Top = 51
              Width = 159
              Height = 21
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'STD_COST_LBR'
              DataSource = SndDM.SrcSndOp
              TabOrder = 2
              OnDropDown = wwDBComboBoxLbrCostDropDown
            end
          end
        end
      end
      object PnlOverhead01: TUniPanel
        Left = 251
        Top = 0
        Width = 337
        Height = 137
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 248
        ExplicitWidth = 340
        object PnlOverheadHeaderBar: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 335
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -12
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object lblOverheadHeader: TUniLabel
            Left = 1
            Top = 1
            Width = 58
            Height = 14
            Hint = ''
            Caption = 'Overhead'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object PnlOverheadInner01: TUniPanel
          Left = 1
          Top = 20
          Width = 335
          Height = 117
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter6: TUniSplitter
            Left = 81
            Top = 0
            Width = 6
            Height = 117
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlOverheadLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 81
            Height = 115
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label12: TUniLabel
              Left = 8
              Top = 7
              Width = 73
              Height = 14
              Hint = ''
              Caption = 'Cost Element'
              ParentFont = False
              Font.Height = -12
              TabOrder = 1
            end
            object Label13: TUniLabel
              Left = 8
              Top = 31
              Width = 22
              Height = 13
              Hint = ''
              Caption = 'Cost'
              TabOrder = 2
            end
          end
          object PnlOverheadClient01: TUniPanel
            Left = 87
            Top = 1
            Width = 248
            Height = 115
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 84
            ExplicitWidth = 256
            DesignSize = (
              248
              115)
            object wwDBLookupComboOvhElem: TUniDBLookupComboBox
              Left = 1
              Top = 3
              Width = 261
              Height = 21
              Hint = ''
              ListFieldIndex = 0
              DataField = 'ELEMENTS_ID_OH'
              DataSource = SndDM.SrcSndOp
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Color = clWindow
            end
            object wwDBComboBoxOvhCost: TUniDBComboBox
              Left = 1
              Top = 27
              Width = 261
              Height = 21
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'STD_COST_OH'
              DataSource = SndDM.SrcSndOp
              TabOrder = 1
              OnDropDown = wwDBComboBoxOvhCostDropDown
            end
          end
        end
      end
    end
    inherited TabSheet1: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 588
      ExplicitHeight = 137
      inherited PageControl1: TUniPageControl
        Width = 588
        Height = 137
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = tabDocExternal
        ExplicitWidth = 588
        ExplicitHeight = 137
        inherited tabDocInternal: TUniTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 580
          ExplicitHeight = 109
          inherited IQDocs1: TIQWebDocs
            Width = 580
            Height = 109
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitWidth = 580
            ExplicitHeight = 109
          end
        end
        inherited tabDocExternal: TUniTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 580
          ExplicitHeight = 109
          inherited IQExtDoc1: TIQWebExtDoc
            Width = 580
            Height = 109
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitWidth = 580
            ExplicitHeight = 109
          end
        end
      end
    end
  end
  inherited pnlToolBar: TUniPanel
    Width = 596
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 596
    inherited sbtnSearch: TUniSpeedButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited sbtnTableForm: TUniSpeedButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited sbtnOpCost: TUniSpeedButton
      Left = 107
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 107
    end
    inherited sbtnEquip: TUniSpeedButton
      Left = 82
      Hint = 'Tool Info'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Visible = True
      ExplicitLeft = 82
    end
    inherited sbtnQtyPrice: TUniSpeedButton
      Left = 132
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 132
    end
    inherited bvToolbarBreak1: TUniPanel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited bbtnRouteNote: TUniSpeedButton
      Left = 57
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 57
    end
    inherited NavMain: TUniDBNavigator
      Left = 362
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 362
    end
  end
  object popmInspection: TUniPopupMenu [4]
    Left = 420
    Top = 173
    object JumptoInspection1: TUniMenuItem
      Caption = 'Jump to Inspection'
      OnClick = JumptoInspection1Click
    end
  end
  object QryElemLabor: TFDQuery [5]
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, elem_descrip'
      '  from elements'
      ' where elem_type = '#39'LABOR'#39
      ''
      ' ')
    Left = 363
    Top = 61
    object QryLaborELEM_DESCRIP: TStringField
      DisplayLabel = 'Labor Cost Element'
      DisplayWidth = 30
      FieldName = 'ELEM_DESCRIP'
      Origin = 'IQ.ELEMENTS.ELEM_DESCRIP'
      FixedChar = True
      Size = 30
    end
    object QryLaborID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.ELEMENTS.ID'
      Visible = False
      Size = 0
    end
  end
  object QryElemOverhead: TFDQuery [6]
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, elem_descrip'
      '  from elements'
      ' where elem_type = '#39'OVERHEAD'#39)
    Left = 513
    Top = 149
    object QryElemOverheadELEM_DESCRIP: TStringField
      DisplayLabel = 'Overhead Cost Element'
      DisplayWidth = 30
      FieldName = 'ELEM_DESCRIP'
      Origin = 'IQ.ELEMENTS.ELEM_DESCRIP'
      FixedChar = True
      Size = 30
    end
    object QryElemOverheadID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ELEMENTS.ID'
      Visible = False
      Size = 0
    end
  end
  object procLaborCost: TFDStoredProc [7]
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.APPDEF_SNDOP.GET_STD_LABOR_EXA'
    Left = 164
    Top = 164
    ParamData = <
      item
        Name = 'v_sndop_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_labor_rate'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'v_labor_hrs'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end>
  end
  object procOverheadCost: TFDStoredProc [8]
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.APPDEF_SNDOP.GET_STD_OVERHEAD_EXA'
    Left = 192
    Top = 164
    ParamData = <
      item
        Name = 'v_sndop_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_overhead_rate'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'v_overhead_hrs'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end>
  end
  object procOverheadCostLaborBased: TFDStoredProc [9]
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.APPDEF_SNDOP.GET_STD_OVERHEAD_LABOR_BASED'
    Left = 220
    Top = 165
    ParamData = <
      item
        Name = 'v_sndop_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_overhead_rate'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'v_overhead_hrs'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'v_mfgtype'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_is_fixed'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
  inherited MainMenu1: TUniMainMenu
    Left = 251
    Top = 65535
    inherited File1: TUniMenuItem
      object CloneProcess1: TUniMenuItem [5]
        Caption = 'Clone Process'
        OnClick = CloneProcess1Click
      end
      inherited SearchAll1: TUniMenuItem
        Visible = False
      end
    end
    inherited View1: TUniMenuItem
      inherited N4: TUniMenuItem
        Visible = False
      end
      inherited AttachedPackaging1: TUniMenuItem
        Visible = False
      end
      inherited AttachedComponents1: TUniMenuItem
        Visible = False
      end
      inherited Blends1: TUniMenuItem
        Visible = False
      end
      inherited Generic1: TUniMenuItem
        Caption = 'Process / Standard Operation'
        Visible = False
      end
    end
    inherited Options1: TUniMenuItem
      object N1: TUniMenuItem
        Caption = '-'
      end
      object CalculateOverheadforAllProcesses1: TUniMenuItem
        Caption = 'Calculate Overhead for All Processes'
        OnClick = RecalcOverheadForALLProcesses1Click
      end
      object CalculateLaborforAllProcesses1: TUniMenuItem
        Caption = 'Calculate Labor for All Processes'
        OnClick = RecalcLaborForALLProcesses1Click
      end
    end
  end
  inherited IQAbout1: TIQWebAbout
    ModuleName = 'PROCESS'
    Left = 308
    Top = 0
  end
  inherited IQRepDef1: TIQWebRepDef
    App_ID = 'SndProcess'
    Left = 280
    Top = 65535
  end
  inherited PrinterSetupDialog1: TPrinterSetupDialog
    Left = 223
    Top = 65535
  end
  inherited popmMaterials: TUniPopupMenu
    Left = 389
  end
  inherited IQJumpInv: TIQWebJump
    Left = 336
    Top = 0
  end
  object IQWebHpick1: TIQWebHpick
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 493
    Top = 68
  end
end
