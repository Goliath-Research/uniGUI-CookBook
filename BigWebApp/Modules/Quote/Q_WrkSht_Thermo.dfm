inherited FrmWeightWorkSheetThermo: TFrmWeightWorkSheetThermo
  Left = 336
  Top = 79
  ClientHeight = 422
  ClientWidth = 305
  Constraints.MaxHeight = 635
  ExplicitWidth = 321
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 381
    Width = 305
    ExplicitTop = 381
    ExplicitWidth = 305
    inherited Panel2: TUniPanel
      Left = 87
      ExplicitLeft = 87
    end
  end
  inherited Panel3: TUniPanel
    Width = 305
    Height = 381
    ExplicitWidth = 305
    ExplicitHeight = 381
    object Splitter5: TUniSplitter [0]
      Left = 1
      Top = 108
      Width = 303
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Splitter3: TUniSplitter [1]
      Left = 1
      Top = 235
      Width = 303
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    inherited Panel11: TUniPanel
      Width = 303
      Height = 107
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ExplicitWidth = 303
      ExplicitHeight = 107
      inherited Splitter4: TUniSplitter
        Left = 102
        Top = 21
        Height = 85
        ExplicitLeft = 102
        ExplicitTop = 21
        ExplicitHeight = 85
      end
      inherited Panel13: TUniPanel
        Left = 108
        Top = 21
        Width = 194
        Height = 85
        ExplicitLeft = 108
        ExplicitTop = 21
        ExplicitWidth = 194
        ExplicitHeight = 85
        inherited sbtnVolume: TUniSpeedButton
          Left = 102
          Hint = 'Calculate volume based on part length and width below'
          ExplicitLeft = 102
        end
        inherited lblVolumeUOM: TUniLabel
          Left = 135
          ExplicitLeft = 135
        end
        inherited DBEdit1: TUniDBEdit
          Left = 0
          Top = 4
          Width = 99
          ExplicitLeft = 0
          ExplicitTop = 4
          ExplicitWidth = 99
        end
        inherited edVolume: TUniEdit
          Left = 0
          Top = 29
          Width = 99
          ExplicitLeft = 0
          ExplicitTop = 29
          ExplicitWidth = 99
        end
        object DBEdit2: TUniDBEdit
          Left = 0
          Top = 54
          Width = 99
          Height = 21
          Hint = ''
          DataField = 'GAUGE'
          DataSource = SrcQinvt
          TabOrder = 2
        end
      end
      inherited Panel14: TUniPanel
        Top = 21
        Width = 101
        Height = 85
        ExplicitTop = 21
        ExplicitWidth = 101
        ExplicitHeight = 85
        inherited Label1: TUniLabel
          Left = 3
          Top = 8
          ExplicitLeft = 3
          ExplicitTop = 8
        end
        inherited Label2: TUniLabel
          Left = 3
          Top = 32
          ExplicitLeft = 3
          ExplicitTop = 32
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
        Width = 301
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
      Top = 112
      Width = 303
      Height = 123
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 102
        Top = 21
        Width = 6
        Height = 101
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object pnlClient01: TUniPanel
        Left = 108
        Top = 21
        Width = 194
        Height = 101
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 98
          Top = 1
          Width = 6
          Height = 99
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object pnlClient03: TUniPanel
          Left = 104
          Top = 1
          Width = 89
          Height = 99
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            89
            99)
          object edSpaceTrimWidth: TUniEdit
            Left = 0
            Top = 46
            Width = 88
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = UpdateResults
          end
          object edSpaceEdgeWidth: TUniEdit
            Left = 0
            Top = 70
            Width = 88
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
            Width = 87
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = 'Width'
            object Bevel4: TUniPanel
              Left = 1
              Top = 17
              Width = 85
              Height = 2
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 1
              Caption = ''
            end
          end
          object edWidth: TUniEdit
            Left = 0
            Top = 22
            Width = 89
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
          Height = 99
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            97
            99)
          object edSpaceTrimLength: TUniEdit
            Left = 0
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
            Left = 0
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
              Top = 17
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
            Left = 0
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
        Top = 21
        Width = 101
        Height = 101
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
        Width = 301
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
      Top = 239
      Width = 303
      Height = 141
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object ScrollBox1: TUniScrollBox
        Left = 1
        Top = 21
        Width = 301
        Height = 119
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ScrollHeight = 272
      end
      object PnlResultsCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 301
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
          Left = 43
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
          Left = 53
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
  inherited SrcQinvt: TDataSource
    Left = 253
    Top = 4
  end
  inherited TblQinvt: TFDTable
    Left = 268
    Top = 4
    inherited TblQinvtID: TBCDField
      Visible = False
    end
    inherited TblQinvtSPG: TFMTBCDField
      Visible = False
    end
    inherited TblQinvtITEMNO: TStringField
      Visible = False
    end
    inherited TblQinvtREV: TStringField
      Visible = False
    end
    object TblQinvtLENGTH: TFMTBCDField
      DisplayLabel = 'Part Length'
      DisplayWidth = 15
      FieldName = 'LENGTH'
    end
    object TblQinvtWIDTH: TFMTBCDField
      DisplayLabel = 'Part Width'
      DisplayWidth = 15
      FieldName = 'WIDTH'
    end
    object TblQinvtGAUGE: TFMTBCDField
      FieldName = 'GAUGE'
    end
    object TblQinvtSPACE_TRIM_LENGTH: TFMTBCDField
      FieldName = 'SPACE_TRIM_LENGTH'
    end
    object TblQinvtSPACE_TRIM_WIDTH: TFMTBCDField
      FieldName = 'SPACE_TRIM_WIDTH'
    end
    object TblQinvtSPACE_EDGE_LENGTH: TFMTBCDField
      FieldName = 'SPACE_EDGE_LENGTH'
    end
    object TblQinvtSPACE_EDGE_WIDTH: TFMTBCDField
      FieldName = 'SPACE_EDGE_WIDTH'
    end
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
end
