object FrmStatAllocValues: TFrmStatAllocValues
  Left = 0
  Top = 0
  ClientHeight = 492
  ClientWidth = 634
  Caption = 'Statistical / Allocation Account Definition Segment Values '
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PC: TUniPageControl
    Left = 0
    Top = 0
    Width = 634
    Height = 452
    Hint = ''
    ActivePage = TabAcct
    TabBarVisible = False
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSegment: TUniTabSheet
      Hint = ''
      Caption = 'TabSegment'
      object IQSearch1: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 626
        Height = 424
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 409
        IQComponents.Grid.Height = 338
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcSeg
        IQComponents.Grid.Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
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
        IQComponents.Navigator.DataSource = SrcSeg
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 409
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 338
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcSeg
        Columns = <
          item
            FieldName = 'VALUE'
            Title.Caption = 'Value'
            Width = 363
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object TabAcct: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'TabAcct'
      object IQSearch2: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 626
        Height = 424
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 409
        IQComponents.Grid.Height = 338
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcAcct
        IQComponents.Grid.Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
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
        IQComponents.Navigator.DataSource = SrcAcct
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 409
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 338
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcAcct
        Columns = <
          item
            FieldName = 'VALUE'
            Title.Caption = 'Value'
            Width = 359
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object TabSubType: TUniTabSheet
      Hint = ''
      ImageIndex = 2
      Caption = 'TabSubType'
      object IQSearch3: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 626
        Height = 424
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 409
        IQComponents.Grid.Height = 338
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcSub
        IQComponents.Grid.Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
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
        IQComponents.Navigator.DataSource = SrcSub
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 409
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 338
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcSub
        Columns = <
          item
            FieldName = 'VALUE'
            Title.Caption = 'Value'
            Width = 362
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 452
    Width = 634
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 420
      Top = 1
      Width = 213
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        213
        38)
      object BtnYes: TUniButton
        Tag = 1
        Left = 7
        Top = 8
        Width = 97
        Height = 24
        Hint = ''
        Caption = '&Yes'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 111
        Top = 8
        Width = 97
        Height = 24
        Hint = ''
        Caption = '&No'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        OnClick = BtnNoClick
      end
    end
  end
  object QrySeg: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select value from ('
      'select distinct account as value from v_glacct)')
    Left = 104
    Top = 88
    object QrySegVALUE: TStringField
      DisplayLabel = 'Value'
      DisplayWidth = 4
      FieldName = 'VALUE'
      Origin = 'value'
      Size = 16
    end
  end
  object QryAcct: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select acct as value'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      ' where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39)
    Left = 160
    Top = 88
    object QryAcctVALUE: TStringField
      DisplayLabel = 'Value'
      DisplayWidth = 50
      FieldName = 'VALUE'
      Origin = 'acct'
      Size = 50
    end
  end
  object QrySub: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct descrip as value'
      ' from glsub_acct_type')
    Left = 216
    Top = 88
    object QrySubVALUE: TStringField
      DisplayLabel = 'Value'
      DisplayWidth = 35
      FieldName = 'VALUE'
      Origin = 'descrip'
      Size = 35
    end
  end
  object SrcSeg: TDataSource
    DataSet = QrySeg
    Left = 104
    Top = 136
  end
  object SrcAcct: TDataSource
    DataSet = QryAcct
    Left = 160
    Top = 136
  end
  object SrcSub: TDataSource
    DataSet = QrySub
    Left = 216
    Top = 136
  end
end
