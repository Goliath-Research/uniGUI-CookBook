object FrmCCTransDetails: TFrmCCTransDetails
  Left = 696
  Top = 307
  ClientHeight = 319
  ClientWidth = 538
  Caption = 'Transaction Details'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 538
    Height = 319
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 536
      Height = 317
      Hint = ''
      ActivePage = TabResponse
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabResponse: TUniTabSheet
        Hint = ''
        Caption = 'Transaction Response'
        object GridResponse: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 528
          Height = 289
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 311
          IQComponents.Grid.Height = 203
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcResponse
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
          IQComponents.Navigator.DataSource = SrcResponse
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 311
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 203
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcResponse
          Columns = <
            item
              FieldName = 'DISPLAYNAME'
              Title.Caption = 'Parameter'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'VALUE'
              Title.Caption = 'Value'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object cmbGridResponseExpand: TUniEdit
          Left = 168
          Top = 176
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 1
        end
      end
      object TabAggregate: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Aggregate'
        object rtfAggregate: TRichEdit
          Left = 0
          Top = 0
          Width = 530
          Height = 291
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PlainText = True
          PopupMenu = PAggregate
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WantTabs = True
          WordWrap = False
        end
      end
    end
  end
  object SrcResponse: TDataSource
    DataSet = QryResponse
    Left = 208
    Top = 136
  end
  object QryResponse: TFDQuery
    BeforeOpen = DoBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT displayname, value'
      '    FROM credit_card_response'
      '   WHERE credit_card_trans_id = :ID AND'
      '         value IS NOT NULL AND'
      '         UPPER(VALUE) <> '#39'NULL'#39
      'ORDER BY id')
    Left = 216
    Top = 144
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryResponseDISPLAYNAME: TStringField
      DisplayLabel = 'Parameter'
      DisplayWidth = 40
      FieldName = 'DISPLAYNAME'
      Origin = 'IQ.CREDIT_CARD_RESPONSE.DISPLAYNAME'
      Size = 60
    end
    object QryResponseVALUE: TStringField
      DisplayLabel = 'Value'
      DisplayWidth = 40
      FieldName = 'VALUE'
      Origin = 'IQ.CREDIT_CARD_RESPONSE.DISPLAYNAME'
      Size = 250
    end
  end
  object SrcTransaction: TDataSource
    DataSet = QryTransaction
    Left = 344
    Top = 184
  end
  object QryTransaction: TFDQuery
    BeforeOpen = DoBeforeOpen
    AfterOpen = QryTransactionAfterOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT id AS id,'
      
        '       iqms.cc_encrypt.get_decrypted_clob(response_data) AS resp' +
        'onse_data'
      '  FROM credit_card_trans'
      ' WHERE id = :ID')
    Left = 344
    Top = 208
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTransactionID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CREDIT_CARD_TRANS.ID'
      Size = 0
    end
    object QryTransactionRESPONSE_DATA: TMemoField
      FieldName = 'RESPONSE_DATA'
      Origin = 'IQ.CREDIT_CARD_TRANS.RESPONSE_DATA'
      BlobType = ftMemo
    end
  end
  object PAggregate: TUniPopupMenu
    OnPopup = PAggregatePopup
    Left = 372
    Top = 144
    object WrapText1: TUniMenuItem
      Caption = 'Wrap Text'
      OnClick = WrapText1Click
    end
  end
end
