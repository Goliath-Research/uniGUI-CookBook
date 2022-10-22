object FrmBOMWeightWorkSheetThermo: TFrmBOMWeightWorkSheetThermo
  Left = 728
  Top = 108
  ClientHeight = 398
  ClientWidth = 308
  Caption = 'Weight WorkSheet'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 357
    Width = 308
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 91
      Top = 1
      Width = 217
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
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
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 308
    Height = 357
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter5: TUniSplitter
      Left = 0
      Top = 107
      Width = 308
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Splitter3: TUniSplitter
      Left = 0
      Top = 234
      Width = 308
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Panel11: TUniPanel
      Left = 1
      Top = 1
      Width = 306
      Height = 107
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Splitter4: TUniSplitter
        Left = 101
        Top = 20
        Width = 6
        Height = 87
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel13: TUniPanel
        Left = 107
        Top = 20
        Width = 199
        Height = 87
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object sbtnVolume: TUniSpeedButton
          Left = 102
          Top = 30
          Width = 22
          Height = 22
          Hint = 'Calculate volume based on part length and width below'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
            00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
            F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
            F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
            F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
            F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
            F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnVolumeClick
        end
        object lblVolumeUOM: TUniLabel
          Left = 135
          Top = 35
          Width = 35
          Height = 13
          Hint = ''
          Caption = '(Cu.In)'
          TabOrder = 5
        end
        object DBEdit1: TUniDBEdit
          Left = 1
          Top = 4
          Width = 99
          Height = 21
          Hint = ''
          DataField = 'SPG'
          DataSource = SrcArinvt
          TabOrder = 0
        end
        object edVolume: TUniEdit
          Left = 1
          Top = 29
          Width = 99
          Height = 21
          Hint = ''
          Text = '0'
          TabOrder = 1
        end
        object DBEdit2: TUniDBEdit
          Left = 1
          Top = 54
          Width = 99
          Height = 21
          Hint = ''
          DataField = 'GAUGE'
          DataSource = SrcArinvt
          TabOrder = 2
        end
      end
      object Panel14: TUniPanel
        Left = 1
        Top = 20
        Width = 101
        Height = 87
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        object Label1: TUniLabel
          Left = 3
          Top = 8
          Width = 19
          Height = 13
          Hint = ''
          Caption = 'SPG'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 3
          Top = 32
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'Volume'
          TabOrder = 2
        end
        object Label3: TUniLabel
          Left = 3
          Top = 56
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Gauge'
          TabOrder = 3
        end
      end
      object PnlSPGCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 304
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 2
        Caption = ''
        Color = clBtnShadow
        object lblSPGLabel: TUniLabel
          Left = 1
          Top = 1
          Width = 70
          Height = 13
          Hint = ''
          Caption = 'SPG/Volume'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object pnlDim: TUniPanel
      Left = 1
      Top = 111
      Width = 306
      Height = 123
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 101
        Top = 20
        Width = 6
        Height = 103
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object pnlClient01: TUniPanel
        Left = 107
        Top = 20
        Width = 199
        Height = 103
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 97
          Top = 0
          Width = 6
          Height = 103
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object pnlClient03: TUniPanel
          Left = 103
          Top = 1
          Width = 96
          Height = 101
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            96
            101)
          object edSpaceTrimWidth: TUniEdit
            Left = 1
            Top = 46
            Width = 95
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = UpdateResults
          end
          object edSpaceEdgeWidth: TUniEdit
            Left = 1
            Top = 70
            Width = 95
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            OnChange = UpdateResults
          end
          object Panel9: TUniPanel
            Left = 1
            Top = 1
            Width = 94
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = 'Width'
            object Bevel4: TUniPanel
              Left = 1
              Top = 18
              Width = 92
              Height = 2
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 1
              Caption = ''
            end
          end
          object edWidth: TUniEdit
            Left = 1
            Top = 22
            Width = 94
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = UpdateResults
          end
        end
        object pnlLeft03: TUniPanel
          Left = 1
          Top = 1
          Width = 97
          Height = 101
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            97
            101)
          object edSpaceTrimLength: TUniEdit
            Left = 1
            Top = 46
            Width = 99
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = UpdateResults
          end
          object edSpaceEdgeLength: TUniEdit
            Left = 1
            Top = 70
            Width = 99
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            OnChange = UpdateResults
          end
          object Panel8: TUniPanel
            Left = 1
            Top = 1
            Width = 95
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = 'Length'
            object Bevel3: TUniPanel
              Left = 1
              Top = 18
              Width = 93
              Height = 2
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 1
              Caption = ''
            end
          end
          object edLength: TUniEdit
            Left = 1
            Top = 22
            Width = 99
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = UpdateResults
          end
        end
      end
      object pnlLeft01: TUniPanel
        Left = 1
        Top = 20
        Width = 101
        Height = 103
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        object Label5: TUniLabel
          Left = 3
          Top = 50
          Width = 88
          Height = 13
          Hint = ''
          Caption = 'Space Trim to Trim'
          TabOrder = 1
        end
        object Label6: TUniLabel
          Left = 3
          Top = 72
          Width = 74
          Height = 13
          Hint = ''
          Caption = 'Space at Edges'
          TabOrder = 2
        end
      end
      object PnlDimensionsCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 304
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 2
        Caption = ''
        Color = clBtnShadow
        object lblDimensions: TUniLabel
          Left = 1
          Top = 1
          Width = 65
          Height = 13
          Hint = ''
          Caption = 'Dimensions'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object pnlResults: TUniPanel
      Left = 1
      Top = 238
      Width = 306
      Height = 119
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object ScrollBox1: TUniScrollBox
        Left = 0
        Top = 20
        Width = 306
        Height = 99
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object wwDBGridLength: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 178
          Height = 272
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 434
          IQComponents.Grid.Height = 186
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcResultsLength
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
          IQComponents.Navigator.DataSource = SrcResultsLength
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = -39
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 186
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitLeft = 0
          IQComponents.FormTab.ExplicitTop = 0
          IQComponents.FormTab.ExplicitWidth = 256
          IQComponents.FormTab.ExplicitHeight = 128
          DataSource = SrcResultsLength
          Columns = <
            item
              FieldName = 'UP_COUNT'
              Title.Caption = 'No. Up'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Part_Length'
              Title.Caption = 'Length'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object wwDBGridWidth: TIQUniGridControl
          Left = 178
          Top = 0
          Width = 123
          Height = 272
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 434
          IQComponents.Grid.Height = 186
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcResultsWidth
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
          IQComponents.Navigator.DataSource = SrcResultsWidth
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = -94
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 186
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitLeft = 0
          IQComponents.FormTab.ExplicitTop = 0
          IQComponents.FormTab.ExplicitWidth = 256
          IQComponents.FormTab.ExplicitHeight = 128
          DataSource = SrcResultsWidth
          Columns = <
            item
              FieldName = 'Part_Width'
              Title.Caption = 'Width'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
      object PnlResultsCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 304
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object lblResultsLabel: TUniLabel
          Left = 1
          Top = 1
          Width = 42
          Height = 13
          Hint = ''
          Caption = 'Results'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object Label9: TUniLabel
          Left = 42
          Top = 1
          Width = 10
          Height = 13
          Hint = ''
          Caption = ' - '
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
        end
        object lblResults: TUniLabel
          Left = 52
          Top = 1
          Width = 3
          Height = 13
          Hint = ''
          Caption = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 3
        end
      end
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 232
    Top = 4
  end
  object SrcResultsLength: TDataSource
    DataSet = QryResultsLength
    OnDataChange = UpdateResultPanel
    Left = 94
    Top = 298
  end
  object QryResultsLength: TFDQuery
    OnCalcFields = QryResultsLengthCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select 1 as up_count from dual'
      'union all'
      'select 2 from dual'
      'union all'
      'select 3 from dual'
      'union all'
      'select 4 from dual'
      'union all'
      'select 5 from dual'
      'union all'
      'select 6 from dual'
      'union all'
      'select 7 from dual'
      'union all'
      'select 8 from dual'
      'union all'
      'select 9 from dual'
      'union all'
      'select 10 from dual'
      'union all'
      'select 11 from dual'
      'union all'
      'select 12 from dual'
      'union all'
      'select 13 from dual'
      'union all'
      'select 14 from dual'
      'union all'
      'select 15 from dual'
      '         ')
    Left = 95
    Top = 311
    object QryResultsLengthUP_COUNT: TFMTBCDField
      DisplayLabel = 'No. Up'
      DisplayWidth = 8
      FieldName = 'UP_COUNT'
      Size = 38
    end
    object QryResultsLengthPart_Length: TFloatField
      DisplayLabel = 'Length'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Part_Length'
      DisplayFormat = '########0.000'
      Calculated = True
    end
  end
  object SrcResultsWidth: TDataSource
    DataSet = QryResultsWidth
    OnDataChange = UpdateResultPanel
    Left = 132
    Top = 299
  end
  object QryResultsWidth: TFDQuery
    OnCalcFields = QryResultsWidthCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select 1 as up_count from dual'
      'union all'
      'select 2 from dual'
      'union all'
      'select 3 from dual'
      'union all'
      'select 4 from dual'
      'union all'
      'select 5 from dual'
      'union all'
      'select 6 from dual'
      'union all'
      'select 7 from dual'
      'union all'
      'select 8 from dual'
      'union all'
      'select 9 from dual'
      'union all'
      'select 10 from dual'
      'union all'
      'select 11 from dual'
      'union all'
      'select 12 from dual'
      'union all'
      'select 13 from dual'
      'union all'
      'select 14 from dual'
      'union all'
      'select 15 from dual'
      '         ')
    Left = 132
    Top = 312
    object QryResultsWidthPart_Width: TFloatField
      DisplayLabel = 'Width'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Part_Width'
      DisplayFormat = '########0.000'
      Calculated = True
    end
    object QryResultsWidthUP_COUNT: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'UP_COUNT'
      Visible = False
      Size = 38
    end
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    AfterPost = ApplyUpdates
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLArinvt
    SQL.Strings = (
      
        'select spg, gauge, id, eplant_id from arinvt where id = :arinvt_' +
        'id')
    Left = 232
    Top = 16
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtSPG: TFMTBCDField
      FieldName = 'SPG'
      Origin = 'IQ.ARINVT.SPG'
      Size = 6
    end
    object QryArinvtGAUGE: TFMTBCDField
      FieldName = 'GAUGE'
      Origin = 'IQ.ARINVT.GAUGE'
      Size = 6
    end
    object QryArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Size = 0
    end
    object QryArinvtEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.ARINVT.EPLANT_ID'
      Size = 0
    end
  end
  object wwDataSource1: TDataSource
    Left = 265
    Top = 4
  end
  object QryPartNo: TFDQuery
    BeforeOpen = QryPartNoBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id,'
      '       p.standard_id,'
      '       p.arinvt_id,'
      '       p.stdcav,'
      '       p.actcav,'
      '       p.ptwt_thermo_disp,'
      '       p.space_trim_length,'
      '       p.space_trim_width,'
      '       p.space_edge_length,'
      '       p.space_edge_width,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.length,'
      '       a.width'
      '  from partno p, arinvt a'
      ' where p.id = :partno_id'
      '   and p.arinvt_id = a.id'
      ''
      '')
    Left = 265
    Top = 16
    ParamData = <
      item
        Name = 'partno_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPartNoID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.PARTNO.ID'
      Size = 0
    end
    object QryPartNoSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.PARTNO.STANDARD_ID'
      Size = 0
    end
    object QryPartNoARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.PARTNO.ARINVT_ID'
      Size = 0
    end
    object QryPartNoSTDCAV: TFMTBCDField
      FieldName = 'STDCAV'
      Origin = 'IQ.PARTNO.STDCAV'
      Size = 6
    end
    object QryPartNoACTCAV: TFMTBCDField
      FieldName = 'ACTCAV'
      Origin = 'IQ.PARTNO.ACTCAV'
      Size = 6
    end
    object QryPartNoPTWT_THERMO_DISP: TFMTBCDField
      FieldName = 'PTWT_THERMO_DISP'
      Origin = 'IQ.PARTNO.PTWT_THERMO_DISP'
      Size = 6
    end
    object QryPartNoSPACE_TRIM_LENGTH: TFMTBCDField
      FieldName = 'SPACE_TRIM_LENGTH'
      Origin = 'IQ.PARTNO.SPACE_TRIM_LENGTH'
      Size = 6
    end
    object QryPartNoSPACE_TRIM_WIDTH: TFMTBCDField
      FieldName = 'SPACE_TRIM_WIDTH'
      Origin = 'IQ.PARTNO.SPACE_TRIM_WIDTH'
      Size = 6
    end
    object QryPartNoSPACE_EDGE_LENGTH: TFMTBCDField
      FieldName = 'SPACE_EDGE_LENGTH'
      Origin = 'IQ.PARTNO.SPACE_EDGE_LENGTH'
      Size = 6
    end
    object QryPartNoSPACE_EDGE_WIDTH: TFMTBCDField
      FieldName = 'SPACE_EDGE_WIDTH'
      Origin = 'IQ.PARTNO.SPACE_EDGE_WIDTH'
      Size = 6
    end
    object QryPartNoITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryPartNoDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object QryPartNoREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryPartNoLENGTH: TFMTBCDField
      FieldName = 'LENGTH'
      Size = 6
    end
    object QryPartNoWIDTH: TFMTBCDField
      FieldName = 'WIDTH'
      Size = 6
    end
  end
  object UpdateSQLArinvt: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into arinvt'
      '  (SPG, GAUGE)'
      'values'
      '  (:SPG, :GAUGE)')
    ModifySQL.Strings = (
      'update arinvt'
      'set'
      '  SPG = :SPG,'
      '  GAUGE = :GAUGE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arinvt'
      'where'
      '  ID = :OLD_ID')
    Left = 232
    Top = 39
  end
end
