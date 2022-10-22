inherited QuickAddCntrType: TQuickAddCntrType
  ClientHeight = 179
  Caption = 'Add Center Type'
  ExplicitHeight = 218
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 140
    ExplicitTop = 140
  end
  inherited PageControl1: TUniPageControl
    Height = 140
    ExplicitHeight = 140
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 298
      ExplicitHeight = 112
      object Splitter1: TUniSplitter
        Left = 78
        Top = 0
        Width = 6
        Height = 112
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel3: TUniPanel
        Left = 0
        Top = 0
        Width = 78
        Height = 112
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 3
          Top = 18
          Width = 60
          Height = 13
          Hint = ''
          Caption = 'Center Type'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 3
          Top = 42
          Width = 44
          Height = 13
          Hint = ''
          Caption = 'EPlant ID'
          TabOrder = 2
        end
      end
      object Panel4: TUniPanel
        Left = 84
        Top = 0
        Width = 214
        Height = 112
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          214
          112)
        object sbtnEPlant: TUniSpeedButton
          Left = 90
          Top = 37
          Width = 22
          Height = 22
          Hint = 'Assign EPlant'
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
          OnClick = sbtnEPlantClick
        end
        object DBEdit1: TUniDBEdit
          Left = 0
          Top = 14
          Width = 210
          Height = 21
          Hint = ''
          DataField = 'NAME'
          DataSource = DataSource1
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object DBEdit2: TUniDBEdit
          Left = 0
          Top = 38
          Width = 89
          Height = 21
          Hint = ''
          DataField = 'EPLANT_ID'
          DataSource = DataSource1
          TabOrder = 1
          ReadOnly = True
        end
      end
    end
  end
  inherited Table1: TFDTable
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'CNTR_TYPE'
    TableName = 'CNTR_TYPE'
    object Table1ID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object Table1NAME: TStringField
      FieldName = 'NAME'
    end
    object Table1EPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
end
