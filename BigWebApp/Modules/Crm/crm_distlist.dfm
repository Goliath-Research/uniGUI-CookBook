object FrmCRMDistList: TFrmCRMDistList
  Left = 345
  Top = 246
  ClientHeight = 356
  ClientWidth = 594
  Caption = 'Email Distribution List Manager'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TUniPanel
    Left = 0
    Top = 60
    Width = 594
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Bevel1: TUniPanel
    Left = 0
    Top = 90
    Width = 594
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
    Top = 63
    Width = 594
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      594
      27)
    object NavMain: TUniDBNavigator
      Left = 369
      Top = 1
      Width = 224
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcDistList
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      BeforeAction = NavMainBeforeAction
    end
    object chkDistList: TUniCheckBox
      Left = 5
      Top = 5
      Width = 367
      Height = 17
      Hint = 
        'Email a Support Issue summary to this distribution list when a s' +
        'upport issue is either created or modified for this customer'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Email distribution list for Support Issues'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnClick = chkDistListClick
    end
  end
  object PnlGrid: TUniPanel
    Left = 0
    Top = 93
    Width = 594
    Height = 263
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Insufficient access rights'
    object PnlGridDisplay: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 592
      Height = 261
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = 'The email distribution list has not been enabled.'
      Color = clWhite
    end
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 592
      Height = 261
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 375
      IQComponents.Grid.Height = 175
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDistList
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Grid.OnCellClick = GridDBGridCellClick
      IQComponents.Grid.OnDrawColumnCell = GridDBGridDrawColumnCell
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcDistList
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 375
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 175
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcDistList
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCUSTO_ID'
          Title.Caption = 'ARCUSTO_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NAME'
          Title.Caption = 'NAME'
          Width = 700
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EMAIL'
          Title.Caption = 'EMAIL'
          Width = 1785
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
      object cmbGridEMail: TUniEdit
        Left = 200
        Top = 152
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        ParentFont = False
        Font.Color = clBlue
        TabOrder = 2
        OnMouseUp = cmbGridEMailMouseUp
      end
    end
  end
  object CaptionPanel1: TIQWebCaptionPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 60
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = 'Distribution List'
    ParentColor = True
    Text = 
      'Build a list of recipients who should receive a Support Issue su' +
      'mmary each time it is edited.'
    PictureLayout = plImageRight
    LayoutStyle = lsWindowsXP
    DesignSize = (
      594
      60)
  end
  object SrcDistList: TDataSource
    DataSet = QryDistList
    Left = 168
    Top = 51
  end
  object SrcMaster: TDataSource
    DataSet = QryMaster
    OnDataChange = SrcMasterDataChange
    Left = 88
    Top = 48
  end
  object QryMaster: TFDQuery
    BeforeOpen = QryMasterBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, custno, company, NVL( distlist, '#39'N'#39' ) as distlist'
      'from arcusto'
      'where id = :id')
    Left = 101
    Top = 56
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object QryDistList: TFDQuery
    BeforeOpen = QryDistListBeforeOpen
    AfterOpen = DoDataAfterOpen
    BeforePost = QryDistListBeforePost
    AfterPost = DoApplyUpdates
    BeforeDelete = QryDistListBeforeDelete
    AfterDelete = DoApplyUpdates
    OnNewRecord = QryDistListNewRecord
    CachedUpdates = True
    OnUpdateRecord = QryDistListUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARCUSTO_DIST'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'SELECT id AS id,'
      '       arcusto_id AS arcusto_id,'
      '       name AS name,'
      '       email AS email'
      '  FROM arcusto_dist'
      ' WHERE arcusto_id = :ID')
    Left = 188
    Top = 60
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
  end
  object PGrid: TUniPopupMenu
    Left = 308
    Top = 45
    object ClearAllRecipients1: TUniMenuItem
      Caption = 'Clear All Recipients'
      OnClick = ClearAllRecipients1Click
    end
    object SendEMailtoSelected1: TUniMenuItem
      Caption = 'Send Email to Selected'
      OnClick = SendEMailtoSelected1Click
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmCRMDistList')
    SecurityItems.Strings = (
      'ClearAllRecipients1'
      'Grid'
      'NavMain')
    SecurityCode = 'FRMCRMDISTLIST'
    Left = 248
    Top = 145
  end
  object MainMenu1: TUniMainMenu
    Left = 272
    Top = 5
    object File1: TUniMenuItem
      Caption = '&File'
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
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
    ModuleName = 'CRM Distribution List'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193419 $'
    BuildVersion = '176554'
    Left = 328
    Top = 5
  end
end
