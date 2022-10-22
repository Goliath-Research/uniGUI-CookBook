object FrmWebModules: TFrmWebModules
  Left = 287
  Top = 168
  HelpContext = 1098478
  ClientHeight = 265
  ClientWidth = 327
  Caption = 'WebDirect - Available Modules'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 327
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 327
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnAddAll: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Add all available modules'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
        7DB3977DB3977DB3977DFF00FFFF00FF94949494949494949494949494949494
        9494949494949494949494949494949494949494949494949494FF00FFFF00FF
        B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
        FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
        D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
        B3977D24B9FF28BEFF2BC4FF31CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
        FF8EF2FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D6
        D6D6DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F3949494FF00FFFF00FF
        B3977DA1A1A09393928787857E7D7C7978767978777F7E7C888685908F8D9796
        93979694979694B3977DFF00FFFF00FF949494A1A1A19393938787877D7D7D78
        78787878787E7E7E8686868F8F8F959595969696969696949494FF00FFFF00FF
        B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
        FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
        D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
        B3977D24B9FF28BEFF2BC4FF31CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
        FF8EF2FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D6
        D6D6DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F3949494FF00FFFF00FF
        508050407040305030203820B9B9B9ADADADA0A0A09292918686867D7D7D7A7A
        7A7B7A7A838281B3977DFF00FFFF00FF757575656565484848323232B9B9B9AD
        ADADA0A0A09292928686867D7D7D7A7A7A7A7A7A828282949494FF00FFFF00FF
        50905060A86050885030503031CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
        FF8EF1FFA3F5FFB3977DFF00FFFF00FF8282829898987B7B7B484848D2D2D2D7
        D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F394949470A88060A070
        60986070B0705098504070403050302038203DD9FF45DEFF52E4FF63E9FF78ED
        FF8EF2FFA3F5FFB3977D9D9D9D9494948B8B8BA2A2A288888865656548484832
        3232DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F394949480B090A0D8A0
        70C08070B87060A060509050408840305030A17A57A17A57A17A57A17A57A17A
        57A17A57A17A57A17A57A7A7A7CACACAB0B0B0A8A8A891919182828279797948
        484877777777777777777777777777777777777777777777777790B8A0B0D8B0
        A0D8A090D0A070B87060A860509850407040FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB1B1B1CECECECACACAC3C3C3A8A8A898989888888865
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90C0A090B8A0
        80B090A0D8A070C080609860509050508050FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB7B7B7B1B1B1A7A7A7CACACAB0B0B08B8B8B82828275
        7575FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        90B8A0B0D8B0A0D8A060A070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1CECECECACACA949494FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        90C0A090B8A080B09070A880FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFB7B7B7B1B1B1A7A7A79D9D9DFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnAddAllClick
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 327
    Height = 235
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 110
    IQComponents.Grid.Height = 149
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwDataSource1
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
    IQComponents.Navigator.DataSource = wwDataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 110
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 149
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 68
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 97
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'NAME'
        Title.Caption = 'Module Name'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 189
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitHeight = 154
    Marker = 0
  end
  object wwDBComboBox1: TUniDBComboBox
    Left = 80
    Top = 80
    Width = 121
    Height = 21
    Hint = ''
    DataField = 'NAME'
    DataSource = wwDataSource1
    Style = csDropDownList
    Items.Strings = (
      'EXISTING ORDERS'
      'SHOPPING CART'
      'PRODUCTS'
      'SHIPMENTS'
      'REPORTS'
      'CHECKOUT')
    TabOrder = 2
  end
  object wwDataSource1: TDataSource
    DataSet = wwTable1
    Left = 24
    Top = 64
  end
  object wwTable1: TFDTable
    BeforePost = wwTable1BeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'WEB_MODULE'
    TableName = 'WEB_MODULE'
    Left = 56
    Top = 104
    object wwTable1NAME: TStringField
      DisplayLabel = 'Module Name'
      DisplayWidth = 15
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object wwTable1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 27
      FieldName = 'DESCRIP'
      Size = 50
    end
    object wwTable1ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
end
