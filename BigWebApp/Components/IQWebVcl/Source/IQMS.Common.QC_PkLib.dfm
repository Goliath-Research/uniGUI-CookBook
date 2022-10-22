inherited FrmQC_PkLib: TFrmQC_PkLib
  ClientHeight = 536
  ClientWidth = 558
  Caption = 'Select Document Library'
  OldCreateOrder = True
  ExplicitWidth = 576
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 17
  inherited IQSearch1: TIQUniGridControl
    Width = 558
    Height = 487
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitWidth = 558
    ExplicitHeight = 487
    inherited PageControl: TUniPageControl
      Width = 558
      Height = 458
      ExplicitWidth = 463
      ExplicitHeight = 125
      inherited GridTab: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 455
        ExplicitHeight = 97
      end
      inherited FormTab: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 455
        ExplicitHeight = 97
      end
    end
    inherited TopToolBar: TUniToolBar
      Width = 558
      ExplicitWidth = 463
    end
  end
  inherited Panel1: TUniPanel
    Top = 487
    Width = 558
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 487
    ExplicitWidth = 558
    inherited Panel2: TUniPanel
      Left = 286
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 286
      inherited btnOK: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited btnCancel: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
    end
  end
  inherited wwQuery1: TFDQuery
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       descrip2,'
      '       path,'
      '       type,'
      '       eplant_id'
      '  from doc_library'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1'
      
        '   and qc_doc_misc.can_access_library( doc_library.id, misc.getu' +
        'sername ) = 1'
      ''
      '')
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Library'
      DisplayWidth = 17
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 60
    end
    object wwQuery1TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 13
      FieldName = 'TYPE'
      Origin = 'TYPE'
      Size = 15
    end
    object wwQuery1PATH: TStringField
      DisplayLabel = 'UNC Path'
      DisplayWidth = 22
      FieldName = 'PATH'
      Origin = 'PATH'
      Size = 150
    end
    object wwQuery1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'eplant_id'
      Size = 0
    end
    object wwQuery1ID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object wwQuery1DESCRIP2: TStringField
      DisplayLabel = 'Library Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
end
