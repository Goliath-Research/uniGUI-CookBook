object FrmCRMCCMain: TFrmCRMCCMain
  Left = 354
  Top = 254
  ClientHeight = 224
  ClientWidth = 461
  Caption = 'CRM Call Center'
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF004444
    4444444444444FFFFFFFFFFFFFF44FFFFFF00FFFFFF44FFFF007300FFFF44FF0
    0BBF83300FF44F0BBFF8B8330FF44F3FF84F8B8000F44FF383F4F808B0F44FFF
    0838780BB0F44FF38087000880F44FF38B00BB833FF44FFF3888833FFFF44FFF
    F3333FFFFFF44FFFFFFFFFFFFFF44FFFFFFFFFFFFFF444444444444444440000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 461
    Height = 5
    Hint = ''
    Visible = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 5
    Width = 461
    Height = 219
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlPageControl: TUniPanel
      Left = 1
      Top = 1
      Width = 459
      Height = 181
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object PnlMain: TUniPanel
        Left = 1
        Top = 1
        Width = 457
        Height = 179
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object PnlGrid: TUniPanel
          Left = 1
          Top = 1
          Width = 455
          Height = 177
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Bevel3: TUniPanel
            Left = 1
            Top = 28
            Width = 453
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
          end
          object PnlToolbar: TUniPanel
            Left = 1
            Top = 1
            Width = 453
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object sbtnCustomTelephoneList: TUniSpeedButton
              Left = 1
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Custom Telephone List'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF707070505850000000D5DCDEFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF70
                7070555555000000DCDCDCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFA0A0A0FFFFFF5090B0101010D8E1E4FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0
                A0A0FFFFFF949494101010E2E2E2FF00FFFF00FFFF00FFFF00FFFF00FF807060
                807060807060807060807060807060A0A0A090B8C070D0E05098B0101010D8E1
                E4FF00FFFF00FFFF00FFFF00FF6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6EA0
                A0A0B7B7B7CFCFCF9A9A9A101010E2E2E2FF00FFFF00FFFF00FFFF00FFC0A890
                FFF0F0FFF0F0FFF0F0FFF0F0FFF0F0DFE7EB50A0B090E0F060C0D05098B01010
                10D8DFE1FF00FFFF00FFFF00FFA5A5A5F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2E8
                E8E8A0A0A0E0E0E0BFBFBF9A9A9A101010DFDFDFFF00FFFF00FFFF00FFC0A890
                FFF8F0FFF8F0FFF8F0FFF0F0FFF0F0FFF0F0DFE7EB50A0B090E0F060C0D05098
                B0101010D8DFE1FF00FFFF00FFA5A5A5F7F7F7F7F7F7F7F7F7F2F2F2F2F2F2F2
                F2F2E8E8E8A0A0A0E0E0E0BFBFBF9A9A9A101010DFDFDFFF00FFFF00FFC0A890
                FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF0F0DFE7EB70B0C090E0F070C8
                E0808880303890BEC0D7FF00FFA5A5A5F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
                F7F7F2F2F2E8E8E8B1B1B1E0E0E0C9C9C9868686545454C5C5C5FF00FFC0A8A0
                FFF8F0D0B0A0D0B0A0D0B0A0D0B0A0D0B0A0C0A890C0A090DFE7EB80B0C0D0B8
                B07088D06070B0303890FF00FFA8A8A8F7F7F7AFAFAFAFAFAFAFAFAFAFAFAFAF
                AFAFA5A5A5A0A0A0E8E8E8B1B1B1B8B8B89A9A9A808080545454FF00FFB0A890
                FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF0F0DFE7EB6070
                B07090E06078D06070B0FF00FFA4A4A4F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
                F7F7F7F7F7F7F7F7F2F2F2E8E8E8808080A4A4A48F8F8F808080FF00FFC0A890
                FFF8F0A08880A08870A08870A08870A08870A08070907860907060FFF8F0D2D7
                EB6070B06070B0E1E5F3FF00FFA5A5A5F7F7F788888885858585858585858585
                8585808080757575707070F7F7F7DCDCDC808080808080E8E8E8FF00FFC0A890
                FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF0F0FFF0F0F0F0F08068
                60FF00FFFF00FFFF00FFFF00FFA5A5A5F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
                F7F7F7F7F7F2F2F2F2F2F2F0F0F0686868FF00FFFF00FFFF00FFFF00FFC0A890
                FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF0F0FFF0F08068
                50FF00FFFF00FFFF00FFFF00FFA5A5A5F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
                F7F7F7F7F7F7F7F7F2F2F2F2F2F2656565FF00FFFF00FFFF00FFFF00FFE09060
                E09060E09060E09060E08860E08860E08050D08050D07840D07040D07030D068
                30FF00FFFF00FFFF00FFFF00FF9090909090909090909090908A8A8A8A8A8A82
                82828080807979797373737272726C6C6CFF00FFFF00FFFF00FFFF00FFE09060
                F0C0A0FFF0F0FFF0E0FFE8E0FFE8E0FFE8D0FFE0D0F0A080F0A080F0A070D068
                30FF00FFFF00FFFF00FFFF00FF909090BEBEBEF2F2F2EEEEEEE9E9E9E9E9E9E6
                E6E6E0E0E0A2A2A2A2A2A2A0A0A06C6C6CFF00FFFF00FFFF00FFFF00FFE3A481
                F0C0B0F0C0A0F0B8A0F0B890F0B090F0B090F0A880F0A880F0A080F0A080DB9F
                7BFF00FFFF00FFFF00FFFF00FFA3A3A3C1C1C1BEBEBEB8B8B8B6B6B6B0B0B0B0
                B0B0A8A8A8A8A8A8A2A2A2A2A2A29E9E9EFF00FFFF00FFFF00FFFF00FFFBF1EB
                E5AA8AE09060E08860E08860E08860E08050E08050D08050D08050E7AB93F3E1
                D5FF00FFFF00FFFF00FFFF00FFF1F1F1A9A9A99090908A8A8A8A8A8A8A8A8A82
                8282828282808080808080ACACACE0E0E0FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = CustomTelephoneList1Click
            end
            object NavMain: TUniDBNavigator
              Left = 252
              Top = 1
              Width = 200
              Height = 25
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataSource = SrcCallHist
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object GridCallHistory: TIQUniGridControl
            Left = 1
            Top = 31
            Width = 453
            Height = 145
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 236
            IQComponents.Grid.Height = 59
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcCallHist
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
            IQComponents.Navigator.DataSource = SrcCallHist
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 236
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 59
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcCallHist
            Columns = <
              item
                FieldName = 'DATETIME_STAMP'
                Title.Caption = 'Time of Call'
                Width = 126
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CALLERNAME'
                Title.Caption = 'Caller ID'
                Width = 210
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PHONE_NUMBER'
                Title.Caption = 'Telephone #'
                Width = 175
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 182
      Width = 459
      Height = 36
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PnlButtonsInner: TUniPanel
        Left = 230
        Top = 1
        Width = 228
        Height = 34
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object sbtnHide: TUniButton
          Left = 5
          Top = 6
          Width = 105
          Height = 25
          Hint = ''
          Caption = 'Hide'
          TabOrder = 1
          OnClick = sbtnHideClick
        end
        object sbtnExit: TUniButton
          Left = 117
          Top = 6
          Width = 105
          Height = 25
          Hint = ''
          Caption = 'Exit'
          TabOrder = 2
          OnClick = sbtnExitClick
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 348
    Top = 88
    object File1: TUniMenuItem
      Caption = '&File'
      object CustomTelephoneList1: TUniMenuItem
        Caption = 'Custom Telephone List'
        OnClick = CustomTelephoneList1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'CRM Call Center'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195000 $'
    BuildVersion = '176554'
    Left = 404
    Top = 88
  end
  object System: TDdeServerConv
    OnExecuteMacro = SystemExecuteMacro
    Left = 320
    Top = 88
  end
  object PMain: TUniPopupMenu
    Left = 376
    Top = 88
    object Show1: TUniMenuItem
      Caption = 'Show'
      OnClick = Show1Click
    end
    object Exit2: TUniMenuItem
      Caption = 'Exit'
      OnClick = Exit1Click
    end
  end
  object SrcCallHist: TDataSource
    DataSet = QryCallHist
    Left = 235
    Top = 81
  end
  object QryCallHist: TFDQuery
    BeforeInsert = DoPreventEdits
    BeforeEdit = DoPreventEdits
    BeforeDelete = QryCallHistBeforeDelete
    CachedUpdates = True
    OnUpdateRecord = QryCallHistUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        '  SELECT id, datetime_stamp, phone_number, callername, direction' +
        ', userid,'
      '         pr_emp_id'
      '    FROM crm_callhist'
      '   WHERE userid = misc.getusername'
      'ORDER BY datetime_stamp')
    Left = 240
    Top = 88
    object QryCallHistDATETIME_STAMP: TDateTimeField
      DisplayLabel = 'Time of Call'
      DisplayWidth = 18
      FieldName = 'DATETIME_STAMP'
      Origin = 'DATETIME_STAMP'
    end
    object QryCallHistCALLERNAME: TStringField
      DisplayLabel = 'Caller ID'
      DisplayWidth = 30
      FieldName = 'CALLERNAME'
      Origin = 'CALLERNAME'
      Size = 250
    end
    object QryCallHistPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      Origin = 'PHONE_NUMBER'
      Size = 25
    end
    object QryCallHistDIRECTION: TStringField
      DisplayLabel = 'In/Out'
      DisplayWidth = 5
      FieldName = 'DIRECTION'
      Origin = 'DIRECTION'
      Visible = False
      Size = 5
    end
    object QryCallHistID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object QryCallHistUSERID: TStringField
      DisplayWidth = 35
      FieldName = 'USERID'
      Origin = 'USERID'
      Visible = False
      Size = 35
    end
    object QryCallHistPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Origin = 'PR_EMP_ID'
      Visible = False
      Size = 0
    end
  end
end
