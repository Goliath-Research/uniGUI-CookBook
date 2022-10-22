object FrmPOArchiveBatch: TFrmPOArchiveBatch
  Left = 271
  Top = 279
  ClientHeight = 343
  ClientWidth = 724
  Caption = 'Archive Batch Of Closed Purchase Orders'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 724
    Height = 302
    Hint = 'Mark Purchase Orders ...'
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 507
    IQComponents.Grid.Height = 216
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcPO
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
    IQComponents.Navigator.DataSource = SrcPO
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 507
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 216
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcPO
    Columns = <
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'KIND'
        Title.Caption = 'Kind'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PO_DATE'
        Title.Caption = 'PO Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Vendor Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VENDORNO'
        Title.Caption = 'Vendor #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'APPROVED_BY'
        Title.Caption = 'Approved By'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BUYERID'
        Title.Caption = 'Buyer'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'Taken By'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REQUESTED_BY'
        Title.Caption = 'Req By'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 302
    Width = 724
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 512
      Top = 1
      Width = 212
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 144
    Top = 48
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
    ModuleName = 'FrmPOArchiveBatch'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194103 $'
    BuildVersion = '176554'
    Left = 176
    Top = 48
  end
  object QryPO: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id as id,'
      '       case'
      
        '            when upper(nvl(p.approved_by,'#39'Not Approved'#39')) = '#39'NOT' +
        ' APPROVED'#39' or upper(p.approved_by) = '#39'DENIED'#39' then'
      
        '                 decode( iqsys2.disp_po_id_as_requisition, '#39'Y'#39', ' +
        'to_char(p.id), p.pono )'
      '            else'
      '                p.pono'
      '       end as pono,'
      '       decode( upper(nvl(p.approved_by,'#39'Not Approved'#39')),'
      '               '#39'NOT APPROVED'#39', '#39'Requisition'#39','
      '               '#39'DENIED'#39', '#39'Requisition'#39','
      '               '#39'PO'#39' ) as kind,'
      '       p.vendor_id as vendor_id,'
      '       p.po_date as po_date,'
      '       v.company as company,'
      '       v.vendorno as vendorno,'
      '       p.approved_by as approved_by,'
      '       p.eplant_id as eplant_id,'
      '       p.buyerid as buyerid,'
      '       p.userid as userid,'
      
        '       rtrim(ltrim(rtrim(emp.first_name) || '#39' '#39' || emp.last_name' +
        ')) as requested_by'
      '  from po p,'
      '       vendor v,'
      '       iqsys2,'
      '       pr_emp emp'
      ' where p.vendor_id = v.id(+)'
      '   and misc.eplant_filter( p.eplant_id ) = 1'
      
        '   and not exists (select 1 from po_detail where po_id = p.id an' +
        'd NVL(closed, '#39'N'#39') = '#39'N'#39')'
      '   and p.pr_emp_id_rqstnr = emp.id(+)'
      ''
      '')
    Left = 64
    Top = 48
    object QryPOPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 15
      FieldName = 'PONO'
      Origin = 
        'case when upper(nvl(p.approved_by,'#39'Not Approved'#39')) = '#39'NOT APPROV' +
        'ED'#39' or upper(p.approved_by) = '#39'DENIED'#39' then decode( iqsys2.disp_' +
        'po_id_as_requisition, '#39'Y'#39', to_char(p.id), p.pono ) else p.pono e' +
        'nd'
      Size = 40
    end
    object QryPOKIND: TStringField
      DisplayLabel = 'Kind'
      DisplayWidth = 11
      FieldName = 'KIND'
      Origin = 
        'decode( upper(nvl(p.approved_by,'#39'Not Approved'#39')),'#39'NOT APPROVED'#39',' +
        ' '#39'Requisition'#39', '#39'DENIED'#39', '#39'Requisition'#39', '#39'PO'#39' ) '
      Size = 11
    end
    object QryPOPO_DATE: TDateTimeField
      DisplayLabel = 'PO Date'
      DisplayWidth = 18
      FieldName = 'PO_DATE'
      Origin = 'p.po_date'
    end
    object QryPOCOMPANY: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'v.COMPANY'
      Size = 60
    end
    object QryPOVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'v.VENDORNO'
      FixedChar = True
      Size = 10
    end
    object QryPOEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'p.EPLANT_ID'
      Size = 0
    end
    object QryPOAPPROVED_BY: TStringField
      DisplayLabel = 'Approved By'
      DisplayWidth = 20
      FieldName = 'APPROVED_BY'
      Origin = 'p.approved_by'
      Size = 35
    end
    object QryPOBUYERID: TStringField
      DisplayLabel = 'Buyer'
      DisplayWidth = 20
      FieldName = 'BUYERID'
      Origin = 'p.BUYERID'
      Size = 35
    end
    object QryPOUSERID: TStringField
      DisplayLabel = 'Taken By'
      DisplayWidth = 20
      FieldName = 'USERID'
      Origin = 'p.userid'
      Size = 35
    end
    object QryPOREQUESTED_BY: TStringField
      DisplayLabel = 'Req By'
      DisplayWidth = 20
      FieldName = 'REQUESTED_BY'
      Origin = 'rtrim(ltrim(rtrim(emp.first_name) || '#39' '#39' || emp.last_name))'
      Size = 61
    end
    object QryPOID: TBCDField
      FieldName = 'ID'
      Origin = 'p.id'
      Visible = False
      Size = 0
    end
    object QryPOVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'p.vendor_id'
      Visible = False
      Size = 0
    end
  end
  object SrcPO: TDataSource
    DataSet = QryPO
    Left = 64
    Top = 72
  end
end
