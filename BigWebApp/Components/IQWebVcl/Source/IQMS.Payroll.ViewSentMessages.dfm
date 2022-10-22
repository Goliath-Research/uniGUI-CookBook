object FrmViewSentMsgs: TFrmViewSentMsgs
  Left = 0
  Top = 0
  ClientHeight = 654
  ClientWidth = 635
  Caption = 'View My Sent Messages'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TUniPageControl
    Left = 0
    Top = 0
    Width = 635
    Height = 654
    Hint = ''
    ActivePage = tabAllMessages
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitHeight = 570
    object tabAllMessages: TUniTabSheet
      Hint = ''
      Caption = 'Sent Messages'
      object Splitter1: TUniSplitter
        Left = 0
        Top = 200
        Width = 627
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object pnlTop: TUniPanel
        Left = 0
        Top = 0
        Width = 627
        Height = 200
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object wwdbGridMsg: TIQUniGridControl
          Left = 1
          Top = 27
          Width = 625
          Height = 173
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 408
          IQComponents.Grid.Height = 87
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcPR_EMP_MESSAGE
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
          IQComponents.Navigator.DataSource = SrcPR_EMP_MESSAGE
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 408
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 87
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcPR_EMP_MESSAGE
          Columns = <
            item
              FieldName = 'SENT_DATE'
              Title.Caption = 'Sent Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SENT_TO'
              Title.Caption = 'Sent To'
              Width = 350
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SUBJECT'
              Title.Caption = 'Subject'
              Width = 350
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'OPENED'
              Title.Caption = 'Opened'
              Width = 7
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ATTACHMENTS'
              Title.Caption = 'Attachments'
              Width = 7
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ARCHIVED'
              Title.Caption = 'Archived'
              Width = 7
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object Panel1: TUniPanel
          Left = 1
          Top = 1
          Width = 625
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object PickMsg: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = ''
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
              90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
              40905030773818FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
              00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820FF00FFB09080FFF8FF
              E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
              B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
              00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830FF00FFC09880FFFFFF
              F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
              B0C08870804830FF00FFC3A494B08870A068509050308048308048208038108F
              4C26B08870A06850905830904830804020703810905830FF00FFDEC4B4B08870
              FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
              50803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0D8C0B0806080482096
              5732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FFFF00FFFF00FFF8E2D2
              C09880B08060A068509050309058409D6842B07860B08870A070508048308048
              20ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0C0B0C09070804820FF
              00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FFFF00FFFF00FFFF00FF
              CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
              37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFFF8F0814527FF00FFFF
              00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = PickMsgClick
          end
          object navEmp: TUniDBNavigator
            Left = 525
            Top = 1
            Width = 100
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = SrcPR_EMP_MESSAGE
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
      object pnlMid: TUniPanel
        Left = 0
        Top = 203
        Width = 627
        Height = 185
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object pnlBody: TUniPanel
          Left = 1
          Top = 1
          Width = 625
          Height = 183
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object memMsgBody: TUniMemo
            Left = 1
            Top = 1
            Width = 623
            Height = 181
            Hint = ''
            ScrollBars = ssVertical
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object pnlBottom: TUniPanel
        Left = 0
        Top = 388
        Width = 627
        Height = 238
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        ExplicitHeight = 154
        object Splitter2: TUniSplitter
          Left = 0
          Top = 27
          Width = 627
          Height = 1
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object pnlAttachments: TUniPanel
          Left = 1
          Top = 28
          Width = 625
          Height = 210
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object grpAttachments: TUniGroupBox
            Left = 1
            Top = 1
            Width = 623
            Height = 208
            Hint = ''
            Caption = 'Attachments'
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            ExplicitHeight = 122
            object wwgridAttach: TIQUniGridControl
              Left = 2
              Top = 15
              Width = 619
              Height = 191
              Layout = 'border'
              ParentAlignmentControl = False
              AlignmentControl = uniAlignmentClient
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              Font.Color = clBlue
              Font.Style = [fsUnderline]
              TabOrder = 0
              ParentFont = False
              IQComponents.Grid.Left = 0
              IQComponents.Grid.Top = 29
              IQComponents.Grid.Width = 402
              IQComponents.Grid.Height = 105
              IQComponents.Grid.Hint = ''
              IQComponents.Grid.DataSource = SrcPR_EMP_MESSAGE_ATTACH
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
              IQComponents.Navigator.DataSource = SrcPR_EMP_MESSAGE_ATTACH
              IQComponents.Navigator.LayoutConfig.Region = 'east'
              IQComponents.Navigator.TabOrder = 3
              IQComponents.HiddenPanel.Left = 402
              IQComponents.HiddenPanel.Top = 29
              IQComponents.HiddenPanel.Width = 209
              IQComponents.HiddenPanel.Height = 105
              IQComponents.HiddenPanel.Hint = ''
              IQComponents.HiddenPanel.Visible = True
              IQComponents.HiddenPanel.Align = alRight
              IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
              IQComponents.FormTab.Hint = ''
              IQComponents.FormTab.ImageIndex = 1
              IQComponents.FormTab.Caption = 'Form'
              IQComponents.FormTab.Layout = 'border'
              DataSource = SrcPR_EMP_MESSAGE_ATTACH
              Columns = <
                item
                  FieldName = 'FILE_NAME'
                  Title.Caption = 'Filename'
                  Width = 1785
                  CheckBoxField.FieldValues = 'true;false'
                end>
              Marker = 0
            end
            object wwDBComboDlg1: TUniEdit
              Left = 157
              Top = 64
              Width = 121
              Height = 21
              Cursor = crHandPoint
              Hint = ''
              Text = ''
              TabOrder = 1
              OnClick = wwDBComboDlg1Click
            end
          end
        end
        object Panel2: TUniPanel
          Left = 1
          Top = 1
          Width = 625
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object sbtnOpenAttachment: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Open Attachment'
            Enabled = False
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF404040404040FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404040
              4040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E00000C020404040FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1A6
              A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E00000E00000C020404040FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1C1
              C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E00000E00000E00000C020404040FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1C1
              C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E00000FF0000E00000E00000C020404040FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1DC
              DCDCC1C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E02000E00000FF0000E00000E00000C0204040
              40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC2C2C2C1
              C1C1DCDCDCC1C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800040E00000E02000E00000FF0000E00000E00000C0
              20404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC2C2C2C2
              C2C2C1C1C1DCDCDCC1C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800040E0A000FF0000E02000E00000FF0000E00000E0
              00008000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DCDCDCDDC
              DCDCC2C2C2C1C1C1DCDCDCC1C1C1C1C1C16D6D6DFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800040E0A000FF0000FF0000E02000E00040E0A00080
              00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DCDCDCDDC
              DCDCDCDCDCC2C2C2C1C1C1CDCDCD6D6D6DFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800080E02000FF0000FF0000FF0000E020008000FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC4C4C4DC
              DCDCDCDCDCDCDCDCC2C2C26D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800080E02000FF0000FF0080E020008000FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC4C4C4DC
              DCDCDCDCDCC4C4C46D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF008000C0DCC000FF0080E020008000FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DD5D5D5DC
              DCDCC4C4C46D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF008000C0DCC0C0DCC0008000FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DD5D5D5D5
              D5D56D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF008000C0DCC0008000FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DD5D5D56D
              6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF008000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnOpenAttachmentClick
          end
          object DBNavigator1: TUniDBNavigator
            Left = 525
            Top = 1
            Width = 100
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = SrcPR_EMP_MESSAGE_ATTACH
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
  end
  object SrcPR_EMP_MESSAGE: TDataSource
    DataSet = QryPR_EMP_MESSAGE
    OnDataChange = SrcPR_EMP_MESSAGEDataChange
    Left = 69
    Top = 95
  end
  object QryPR_EMP_MESSAGE: TFDQuery
    BeforeOpen = QryPR_EMP_MESSAGEBeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select m.id as id,'
      
        '       substrB( iqstring.Concat3w( p.First_Name, p.Middle_Name, ' +
        'p.Last_Name), 1, 255) as SENT_TO,'
      '       m.sent_date as SENT_DATE,'
      '       m.subject as SUBJECT,'
      '       m.message as MESSAGE,'
      '       nvl(m.opened, '#39'N'#39') as OPENED,'
      '       nvl(m.archived, '#39'N'#39') as ARCHIVED,'
      '       (select count(id)'
      '            from pr_emp_message_attach a'
      '           where pr_emp_message_id = m.id'
      '             and a.file_name is not null'
      '             and m.id = a.pr_emp_message_id) as NUMATTACHMENTS,'
      '       case'
      '         when'
      '         ( select count(id)'
      '            from pr_emp_message_attach a'
      '           where pr_emp_message_id = m.id'
      '             and a.file_name is not null'
      '             and m.id = a.pr_emp_message_id ) > 0 then '#39'Y'#39
      '         else '#39'N'#39
      '       end as ATTACHMENTS'
      'from  pr_emp p,'
      '      pr_emp_message m'
      'where m.sent_by = :currentuser'
      '  and p.id = m.pr_emp_id'
      '  and nvl(m.archived, '#39'N'#39') = :archived'
      'order by m.id desc'
      '')
    Left = 68
    Top = 109
    ParamData = <
      item
        Name = 'currentuser'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'archived'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryPR_EMP_MESSAGEID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryPR_EMP_MESSAGESENT_TO: TStringField
      FieldName = 'SENT_TO'
      Size = 255
    end
    object QryPR_EMP_MESSAGESENT_DATE: TDateTimeField
      FieldName = 'SENT_DATE'
    end
    object QryPR_EMP_MESSAGESUBJECT: TStringField
      FieldName = 'SUBJECT'
      Size = 250
    end
    object QryPR_EMP_MESSAGEMESSAGE: TStringField
      FieldName = 'MESSAGE'
      Size = 2000
    end
    object QryPR_EMP_MESSAGEOPENED: TStringField
      FieldName = 'OPENED'
      Size = 1
    end
    object QryPR_EMP_MESSAGEATTACHMENTS: TStringField
      FieldName = 'ATTACHMENTS'
      FixedChar = True
      Size = 1
    end
    object QryPR_EMP_MESSAGEARCHIVED: TStringField
      FieldName = 'ARCHIVED'
      Size = 1
    end
    object QryPR_EMP_MESSAGENUMATTACHMENTS: TFMTBCDField
      FieldName = 'NUMATTACHMENTS'
      Size = 38
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 128
    Top = 5
    object File1: TUniMenuItem
      Caption = 'File'
      object RecallMessage1: TUniMenuItem
        Caption = '&Recall Message'
        OnClick = RecallMessage1Click
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
      object ViewArchived1: TUniMenuItem
        Caption = 'View Archived'
        OnClick = ViewArchived1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmViewSentMsgs'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190887 $'
    BuildVersion = '176554'
    Left = 184
    Top = 6
  end
  object PkMsg: TIQWebHpick
    BeforeOpen = QryPR_EMP_MESSAGEBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select m.id as id,'
      
        '       substrB( iqstring.Concat3w( p.First_Name, p.Middle_Name, ' +
        'p.Last_Name), 1, 255) as SENT_TO,'
      '       m.sent_date as SENT_DATE,'
      '       m.subject as SUBJECT,'
      '       nvl(m.opened, '#39'N'#39') as OPENED,'
      '       nvl(m.archived, '#39'N'#39') as ARCHIVED'
      'from  pr_emp p,'
      '      pr_emp_message m'
      'where m.sent_by =:currentuser'
      '  and p.id = m.pr_emp_id'
      '  and nvl(m.archived, '#39'N'#39') = :archived'
      'order by m.id desc'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 236
    Top = 7
    ParamData = <
      item
        Name = 'currentuser'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'archived'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkMsgID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object PkMsgSENT_TO: TStringField
      DisplayLabel = 'Sent To'
      FieldName = 'SENT_TO'
      Size = 255
    end
    object PkMsgSENT_DATE: TDateTimeField
      DisplayLabel = 'Sent Date'
      FieldName = 'SENT_DATE'
    end
    object PkMsgSUBJECT: TStringField
      DisplayLabel = 'Subject'
      FieldName = 'SUBJECT'
      Size = 250
    end
    object PkMsgOPENED: TStringField
      DisplayLabel = 'Opened'
      FieldName = 'OPENED'
      Size = 1
    end
    object PkMsgATTACHMENTS: TStringField
      DisplayLabel = 'Attachments'
      FieldName = 'ATTACHMENTS'
      FixedChar = True
      Size = 1
    end
    object PkMsgARCHIVED: TStringField
      DisplayLabel = 'Archived'
      FieldName = 'ARCHIVED'
      Size = 1
    end
  end
  object SrcPR_EMP_MESSAGE_ATTACH: TDataSource
    DataSet = QryPR_EMP_MESSAGE_ATTACH
    OnDataChange = SrcPR_EMP_MESSAGE_ATTACHDataChange
    Left = 506
    Top = 482
  end
  object QryPR_EMP_MESSAGE_ATTACH: TFDQuery
    MasterSource = SrcPR_EMP_MESSAGE
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.pr_emp_message_id,'
      '       a.file_name,'
      '       a.file_data'
      ' from pr_emp_message_attach a'
      'where a.pr_emp_message_id = :id'
      '')
    Left = 506
    Top = 498
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryPR_EMP_MESSAGE_ATTACHFILE_NAME: TStringField
      DisplayWidth = 255
      FieldName = 'FILE_NAME'
      Origin = 'IQ.PR_EMP_MESSAGE_ATTACH.FILE_NAME'
      Size = 255
    end
    object QryPR_EMP_MESSAGE_ATTACHID: TBCDField
      DisplayLabel = 'Attachment ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.PR_EMP_MESSAGE_ATTACH.ID'
      Visible = False
      Size = 0
    end
    object QryPR_EMP_MESSAGE_ATTACHPR_EMP_MESSAGE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_MESSAGE_ID'
      Origin = 'IQ.PR_EMP_MESSAGE_ATTACH.PR_EMP_MESSAGE_ID'
      Visible = False
      Size = 0
    end
    object QryPR_EMP_MESSAGE_ATTACHFILE_DATA: TBlobField
      FieldName = 'FILE_DATA'
      Origin = 'IQ.PR_EMP_MESSAGE_ATTACH.FILE_DATA'
    end
  end
end
