object ProdSummary: TProdSummary
  Left = 319
  Top = 182
  HelpContext = 1064302
  ClientHeight = 221
  ClientWidth = 278
  Caption = 'Production Summary'
  BorderStyle = bsSingle
  OldCreateOrder = True
  OnActivate = FormActivate
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 9
    Top = 10
    Width = 264
    Height = 167
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet1
    TabBarVisible = True
    TabOrder = 0
    object TabSheet1: TUniTabSheet
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Short Summary'
      object Label1: TUniLabel
        Left = 8
        Top = 9
        Width = 41
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Rec CPH'
        TabOrder = 5
      end
      object Label2: TUniLabel
        Left = 8
        Top = 32
        Width = 37
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Eff CPH'
        TabOrder = 6
      end
      object Label3: TUniLabel
        Left = 8
        Top = 56
        Width = 39
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Std CPH'
        TabOrder = 7
      end
      object Label4: TUniLabel
        Left = 8
        Top = 80
        Width = 41
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '% Scrap'
        TabOrder = 8
      end
      object Label5: TUniLabel
        Left = 8
        Top = 104
        Width = 28
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '% Eff'
        TabOrder = 9
      end
      object Edit1: TUniEdit
        Left = 95
        Top = 5
        Width = 88
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        TabOrder = 0
      end
      object Edit2: TUniEdit
        Left = 95
        Top = 29
        Width = 88
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        TabOrder = 1
      end
      object Edit3: TUniEdit
        Left = 95
        Top = 53
        Width = 88
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        TabOrder = 2
      end
      object Edit4: TUniEdit
        Left = 95
        Top = 77
        Width = 88
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        TabOrder = 3
      end
      object Edit5: TUniEdit
        Left = 95
        Top = 101
        Width = 88
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        TabOrder = 4
      end
    end
  end
  object Button1: TUniButton
    Left = 173
    Top = 187
    Width = 97
    Height = 25
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object AppDef1: TIQWebAppDef
    AppCode = 'PROD'
    DataField = 'MFG_TYPE'
    DataSource = DataSource1
    Left = 152
    Top = 184
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select h.mfg_type'
      '  from dayprod d, hist_illum_rt h'
      ' where d.id = :dayprod_id'
      '   and d.hist_illum_rt_id = h.id')
    Left = 56
    Top = 184
    ParamData = <
      item
        Name = 'dayprod_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1MFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 104
    Top = 184
  end
end
