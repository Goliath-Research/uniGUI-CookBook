object FrmPrnOtherAttachments: TFrmPrnOtherAttachments
  Left = 317
  Top = 190
  ClientHeight = 233
  ClientWidth = 443
  Caption = 'Other attachments'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 253
      Top = 1
      Width = 190
      Height = 26
      Hint = ''
      DataSource = SrcAttachment
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbInsert, nbDelete]
      ConfirmDelete = False
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 194
    Width = 443
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel3: TUniPanel
      Left = 221
      Top = 1
      Width = 222
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 7
        Width = 95
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 116
        Top = 7
        Width = 95
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 28
    Width = 443
    Height = 166
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 441
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 3
      Width = 441
      Height = 163
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 224
      IQComponents.Grid.Height = 77
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcAttachment
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
      IQComponents.Navigator.DataSource = SrcAttachment
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 224
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 77
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcAttachment
      Columns = <
        item
          FieldName = 'fldFileName'
          Title.Caption = 'File Name'
          Width = 469
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object wwDBComboDlgFileName: TUniEdit
    Left = 136
    Top = 72
    Width = 161
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
    ReadOnly = True
  end
  object SrcAttachment: TDataSource
    DataSet = cdsAttachment
    Left = 80
    Top = 96
  end
  object cdsAttachment: TClientDataSet
    PersistDataPacket.Data = {
      3A0000009619E0BD0100000018000000010000000000030000003A000B666C64
      46696C654E616D65010049000000010005574944544802000200FA000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'fldFileName'
        DataType = ftString
        Size = 250
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeDelete = cdsAttachmentBeforeDelete
    Left = 80
    Top = 80
  end
  object UniFileUpload1: TUniFileUpload
    OnCompleted = UniFileUpload1Completed
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 169
    Top = 68
  end
end
