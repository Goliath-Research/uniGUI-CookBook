object FrmPRW_Params: TFrmPRW_Params
  Left = 0
  Top = 0
  ClientHeight = 302
  ClientWidth = 298
  Caption = 'Parameters'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 261
    Width = 298
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 75
      Top = 1
      Width = 222
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 117
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 298
    Height = 261
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 1
      Top = 1
      Width = 296
      Height = 259
      DisableThemes = False
      Align = alClient
      TabOrder = 0
      DataSource = SrcParams
      Items = <
        item
          DataSource = SrcParams
          Caption = 'Reporting Steps'
          ReadOnly = True
          Expanded = True
          Items = <
            item
              DataSource = SrcParams
              DataField = 'QUANTITY_PAGE'
              Caption = 'Production Quantity'
              ReadOnly = True
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              WordWrap = False
            end
            item
              DataSource = SrcParams
              DataField = 'PRODHRS_PAGE'
              Caption = 'Prod Hours'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              WordWrap = False
            end
            item
              DataSource = SrcParams
              DataField = 'LABOR_PAGE'
              Caption = 'Labor'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              WordWrap = False
            end
            item
              DataSource = SrcParams
              DataField = 'REJECTS_PAGE'
              Caption = 'Rejects'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              WordWrap = False
            end
            item
              DataSource = SrcParams
              DataField = 'DISPOSITION_PAGE'
              Caption = 'Disposition'
              ReadOnly = True
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              WordWrap = False
            end
            item
              DataSource = SrcParams
              DataField = 'SUMMARY_PAGE'
              Caption = 'Summary'
              ReadOnly = True
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              WordWrap = False
            end
            item
              DataSource = SrcParams
              DataField = 'COSTING_PAGE'
              Caption = 'Costing'
              Expanded = True
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcParams
          Caption = 'Default Options'
          ReadOnly = True
          Expanded = True
          Items = <
            item
              DataSource = SrcParams
              DataField = 'WO_COMPLETE'
              Caption = 'Check WO Complete'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcParams
          DataField = 'WO_COMPLETE_PERCENT'
          Caption = 'WO Complete Within %'
          WordWrap = False
        end>
      DefaultRowHeight = 20
      CaptionWidth = 144
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      CaptionIndent = 15
    end
  end
  object SrcParams: TDataSource
    DataSet = QryParams
    Left = 208
    Top = 24
  end
  object QryParams: TFDQuery
    BeforePost = QryParamsBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    CachedUpdates = True
    OnUpdateRecord = QryParamsUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '#39'Y'#39' as quantity_page,'
      '       decode( nvl(labor_page  , 0), 1, '#39'Y'#39', '#39'N'#39') as labor_page,'
      
        '       decode( nvl(rejects_page, 0), 1, '#39'Y'#39', '#39'N'#39') as rejects_pag' +
        'e,'
      '       '#39'Y'#39' as disposition_page,'
      '       '#39'Y'#39' as summary_page,'
      
        '       decode( nvl(costing_page, 0), 1, '#39'Y'#39', '#39'N'#39') as costing_pag' +
        'e,'
      
        '       decode( nvl(prodhrs_page, 0), 1, '#39'Y'#39', '#39'N'#39') as prodhrs_pag' +
        'e,'
      '       post_act_cost_inv,'
      '       wo_complete,'
      '       wo_complete_percent'
      '  from prw_param')
    Left = 208
    Top = 48
    object QryParamsLABOR_PAGE: TStringField
      FieldName = 'LABOR_PAGE'
      Size = 1
    end
    object QryParamsREJECTS_PAGE: TStringField
      FieldName = 'REJECTS_PAGE'
      Size = 1
    end
    object QryParamsCOSTING_PAGE: TStringField
      FieldName = 'COSTING_PAGE'
      Size = 1
    end
    object QryParamsQUANTITY_PAGE: TStringField
      FieldName = 'QUANTITY_PAGE'
      FixedChar = True
      Size = 1
    end
    object QryParamsDISPOSITION_PAGE: TStringField
      FieldName = 'DISPOSITION_PAGE'
      FixedChar = True
      Size = 1
    end
    object QryParamsSUMMARY_PAGE: TStringField
      FieldName = 'SUMMARY_PAGE'
      FixedChar = True
      Size = 1
    end
    object QryParamsPRODHRS_PAGE: TStringField
      FieldName = 'PRODHRS_PAGE'
      Size = 1
    end
    object QryParamsPOST_ACT_COST_INV: TStringField
      FieldName = 'POST_ACT_COST_INV'
      Size = 1
    end
    object QryParamsWO_COMPLETE: TStringField
      FieldName = 'WO_COMPLETE'
      Size = 1
    end
    object QryParamsWO_COMPLETE_PERCENT: TBCDField
      FieldName = 'WO_COMPLETE_PERCENT'
      Size = 2
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMPRW_PARAMS'
    Left = 244
    Top = 48
  end
end
