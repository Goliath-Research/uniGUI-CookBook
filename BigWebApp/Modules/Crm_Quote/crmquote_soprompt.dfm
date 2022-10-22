object FrmCRMQuoteConvertPrompt: TFrmCRMQuoteConvertPrompt
  Left = 230
  Top = 208
  ClientHeight = 187
  ClientWidth = 423
  Caption = 'Create Sales Order'
  OnShow = FormShow
  Position = poOwnerFormCenter
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrlMain: TUniPageControl
    Left = 0
    Top = 0
    Width = 423
    Height = 187
    Hint = ''
    ActivePage = tabCreateNewSalesOrder
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tabSelectSalesOrder: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'tabSelectSalesOrder'
      object Panel1: TUniPanel
        Tag = 1999
        Left = 0
        Top = 118
        Width = 415
        Height = 41
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Panel2: TUniPanel
          Tag = 1999
          Left = 103
          Top = 1
          Width = 312
          Height = 39
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object btnUpdateSalesOrder: TUniButton
            Left = 1
            Top = 8
            Width = 97
            Height = 25
            Hint = ''
            Caption = '&Update'
            ModalResult = 1
            TabOrder = 1
            Default = True
          end
          object btnUpdateSalesOrderNo: TUniButton
            Left = 104
            Top = 8
            Width = 97
            Height = 25
            Hint = ''
            Caption = '&Cancel'
            Cancel = True
            ModalResult = 2
            TabOrder = 2
          end
          object btnUpdateSalesOrderCreateNew: TUniButton
            Left = 209
            Top = 8
            Width = 97
            Height = 25
            Hint = ''
            Caption = '&New Sales Order'
            Cancel = True
            TabOrder = 3
            OnClick = btnUpdateSalesOrderCreateNewClick
          end
        end
      end
      object Panel3: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 415
        Height = 35
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Label1: TUniLabel
          Left = 8
          Top = 8
          Width = 193
          Height = 13
          Hint = ''
          Caption = 'Update a sales order for this Quotation?'
          TabOrder = 1
        end
      end
      object Panel4: TUniPanel
        Left = 0
        Top = 35
        Width = 415
        Height = 83
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object IQSearch1: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 413
          Height = 81
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 196
          IQComponents.Grid.Height = 434
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
          IQComponents.HiddenPanel.Left = 196
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 434
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = wwDataSource1
          Columns = <
            item
              FieldName = 'ORDERNO'
              Title.Caption = 'Sales Order #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PONO'
              Title.Caption = 'PO #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CUSTNO'
              Title.Caption = 'Cust #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COMPANY'
              Title.Caption = 'Company Name'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EPLANT_ID'
              Title.Caption = 'EPlant ID'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
    object tabCreateNewSalesOrder: TUniTabSheet
      Hint = ''
      TabVisible = False
      ImageIndex = 1
      Caption = 'tabCreateNewSalesOrder'
      object PnlPrompt: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 415
        Height = 35
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object lblPrompt: TUniLabel
          Left = 8
          Top = 8
          Width = 191
          Height = 13
          Hint = ''
          Caption = 'Create a sales order for this Quotation?'
          TabOrder = 1
        end
      end
      object PnlCheckboxes: TUniPanel
        Tag = 1999
        Left = 0
        Top = 35
        Width = 415
        Height = 83
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          415
          83)
        object chkIncludeInternalDocs: TUniCheckBox
          Left = 24
          Top = 1
          Width = 164
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Include Internal Documents'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object chkIncludeExternalDocs: TUniCheckBox
          Left = 24
          Top = 16
          Width = 165
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Include External Documents'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object chkEMailCorr: TUniCheckBox
          Left = 24
          Top = 32
          Width = 165
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Email Correspondence'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object chkCombineSalesConfigurations: TUniCheckBox
          Left = 24
          Top = 48
          Width = 313
          Height = 17
          Hint = ''
          Caption = 'Combine quoted Sales Configurations on one Sales Order'
          TabOrder = 3
        end
      end
      object PnlButtons: TUniPanel
        Tag = 1999
        Left = 0
        Top = 118
        Width = 415
        Height = 41
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object PnlButtonsInner: TUniPanel
          Tag = 1999
          Left = 205
          Top = 1
          Width = 210
          Height = 39
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object btnCreateNewSalesOrderOk: TUniButton
            Left = 1
            Top = 8
            Width = 97
            Height = 25
            Hint = ''
            Caption = '&Yes'
            ModalResult = 1
            TabOrder = 1
            Default = True
          end
          object btnCancel: TUniButton
            Left = 104
            Top = 8
            Width = 97
            Height = 25
            Hint = ''
            Caption = '&No'
            Cancel = True
            ModalResult = 2
            TabOrder = 2
          end
        end
      end
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 63
    Top = 95
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select o.id  as id, '
      '       o.orderno as orderno, '
      '       o.pono as pono, '
      '       a.custno  as custno,'
      '       a.company as company, '
      '       o.eplant_id'
      '  from orders o,'
      '       arcusto a'
      ' where o.crm_quote_id = :crm_quote_id'
      '   and o.arcusto_id = a.id(+)'
      '   and misc.eplant_filter(o.eplant_id) = 1'
      ''
      '')
    Left = 63
    Top = 107
    ParamData = <
      item
        Name = 'crm_quote_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1ORDERNO: TStringField
      DisplayLabel = 'Sales Order #'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'o.orderno'
      Size = 15
    end
    object wwQuery1PONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 20
      FieldName = 'PONO'
      Origin = 'o.pono'
      Size = 35
    end
    object wwQuery1CUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'a.custno'
      FixedChar = True
      Size = 10
    end
    object wwQuery1COMPANY: TStringField
      DisplayLabel = 'Company Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object wwQuery1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'o.eplant_id'
      Size = 0
    end
    object wwQuery1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnUpdateSalesOrder'
      'btnUpdateSalesOrderCreateNew'
      'btnCreateNewSalesOrderOk'
      'chkIncludeInternalDocs'
      'chkIncludeExternalDocs'
      'chkEMailCorr')
    SecurityCode = 'FRMCRMQUOTECONVERTPROMPT'
    Left = 100
    Top = 108
  end
  object MainMenu1: TUniMainMenu
    Left = 205
    Top = 108
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmCRMQuoteConvertPrompt'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193702 $'
    BuildVersion = '176554'
    Left = 237
    Top = 108
  end
end
