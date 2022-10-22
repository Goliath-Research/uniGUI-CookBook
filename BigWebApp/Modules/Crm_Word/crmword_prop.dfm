object FrmCRMWordDocProperties: TFrmCRMWordDocProperties
  Left = 386
  Top = 154
  ClientHeight = 194
  ClientWidth = 263
  Caption = 'Properties'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 3
    Width = 263
    Height = 191
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'General'
      object Panel1: TUniPanel
        Left = 0
        Top = 0
        Width = 255
        Height = 163
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = 'Panel1'
      end
    end
  end
  object PnlSpacer: TUniPanel
    Left = 0
    Top = 0
    Width = 263
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object diProp: TwwDataInspector
    Left = 0
    Top = 3
    Width = 263
    Height = 191
    DisableThemes = False
    Align = alClient
    BorderStyle = bsNone
    PopupMenu = PMain
    TabOrder = 2
    DataSource = CRMWORD_DM.SrcCRMWordDoc
    Items = <
      item
        DataSource = CRMWORD_DM.SrcCRMWordDoc
        DataField = 'USERID'
        Caption = 'Created By'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = CRMWORD_DM.SrcCRMWordDoc
        DataField = 'NAME'
        Caption = 'Name'
        WordWrap = False
      end
      item
        DataSource = CRMWORD_DM.SrcCRMWordDoc
        DataField = 'DESCRIPTION'
        Caption = 'Description'
        CellHeight = 19
        Resizeable = True
        WordWrap = True
      end
      item
        DataSource = CRMWORD_DM.SrcCRMWordDoc
        DataField = 'FILENAME'
        Caption = 'File Name'
        CustomControl = cmbFileName
        PickList.Style = csDropDownList
        PickList.ShowMatchText = False
        PickList.ButtonStyle = cbsCustom
        Options = []
        WordWrap = False
      end
      item
        DataSource = CRMWORD_DM.SrcCRMWordDoc
        DataField = 'TEMPLATENAME'
        Caption = 'Template Name'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = CRMWORD_DM.SrcCRMWordDoc
        DataField = 'DatasetDescrip'
        Caption = 'Dataset'
        ReadOnly = True
        WordWrap = False
      end>
    CaptionWidth = 123
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 255
    ExplicitHeight = 163
    DesignSize = (
      263
      191)
    object cmbDataset: TUniDBComboBox
      Left = 124
      Top = 83
      Width = 196
      Height = 21
      Hint = ''
      Visible = False
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DATASET_INDEX'
      DataSource = CRMWORD_DM.SrcCRMWordDoc
      Items.Strings = (
        'Customers'#9'1'
        'Vendors'#9'2'
        'Employees'#9'3')
      ItemIndex = 1
      TabStop = False
      TabOrder = 0
      Color = clBtnFace
      ReadOnly = True
      ExplicitWidth = 171
    end
    object cmbFileName: TUniEdit
      Left = 124
      Top = 51
      Width = 138
      Height = 15
      Hint = ''
      Visible = False
      BorderStyle = ubsNone
      Text = ''
      TabOrder = 1
      TabStop = False
    end
  end
  object PMain: TUniPopupMenu
    Left = 68
    Top = 139
    object EditMergeDocument1: TUniMenuItem
      Caption = 'Edit Merge Document'
      OnClick = EditMergeDocument1Click
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.doc'
    Filter = 'Document (*.doc)|*.doc'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 100
    Top = 139
  end
end
