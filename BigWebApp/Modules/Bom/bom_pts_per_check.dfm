inherited FrmBOMPtsPerException: TFrmBOMPtsPerException
  ClientHeight = 153
  ClientWidth = 416
  ExplicitWidth = 422
  ExplicitHeight = 182
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 416
    Height = 110
    ExplicitWidth = 416
    ExplicitHeight = 110
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 408
      ExplicitHeight = 82
      inherited Label1: TUniLabel
        Width = 89
        Caption = 'Process/Operation'
        ExplicitWidth = 89
      end
      inherited Label3: TUniLabel
        Width = 33
        Caption = 'Item #'
        ExplicitWidth = 33
      end
      inherited DBEdit1: TUniDBEdit
        Left = 117
        Width = 282
        DataField = 'OPDESC'
        ExplicitLeft = 117
        ExplicitWidth = 282
      end
      inherited DBEdit2: TUniDBEdit
        Left = 117
        Width = 282
        DataField = 'ITEMNO'
        ExplicitLeft = 117
        ExplicitWidth = 282
      end
      inherited DBEdit3: TUniDBEdit
        Left = 117
        Width = 282
        ExplicitLeft = 117
        ExplicitWidth = 282
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 110
    Width = 416
    ExplicitTop = 110
    ExplicitWidth = 416
    inherited Panel2: TUniPanel
      Left = 209
      ExplicitLeft = 209
    end
  end
  inherited Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    SQL.Strings = (
      'select sndop.opdesc || '#39' ['#39' || sndop.opno || '#39']'#39' as opdesc, '
      
        '       (select itemno from arinvt where id = :arinvt_id) as item' +
        'no, '
      '       '#39'Field '#39#39'Parts Per'#39#39' is 0'#39' as status_id'
      '  from sndop'
      ' where sndop.id = :id'
      '')
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
end
