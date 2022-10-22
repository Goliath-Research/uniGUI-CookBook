object FrmVMIPickLocation: TFrmVMIPickLocation
  Left = 487
  Top = 341
  ClientHeight = 142
  ClientWidth = 356
  Caption = 'VMI Location'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 356
    Height = 98
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 96
    object Label1: TUniLabel
      Left = 14
      Top = 20
      Width = 40
      Height = 13
      Hint = ''
      Caption = 'Location'
      TabOrder = 4
    end
    object Label2: TUniLabel
      Left = 14
      Top = 68
      Width = 26
      Height = 13
      Hint = ''
      Caption = 'Lot #'
      TabOrder = 5
    end
    object sbtnFgLotNo: TUniSpeedButton
      Left = 323
      Top = 64
      Width = 22
      Height = 22
      Hint = 'Assign FG Lot #'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFD000000FDFDFDFDFDFDFDFDFDFDFDFDFD000000FDFDFDFDFDFDFDFDFDFD
        FDFDFDFD002A00FDFDFDFDFDFDFDFDFDFDFDFDFD00A400FDFDFDFDFDFDFDFDFD
        FDFDFDFDFD00B21AFDFDFDFDFDFDFDFDFDFDFDFDFD00F75BFDFDFDFDFDFDFDFD
        FDFDFDFDFD00BA1AFDFDFDFDFDFDFDFDFDFDFDFDFD00075BFDFDFDFDFDFDFDFD
        00FDFDFDFD00BA1AFDFDFDFDFDFDFDFD00FDFDFDFD00075BFDFDFDFDFDFDFD00
        00FDFDFDFD00BE1AFDFDFDFDFDFDFD0000FDFDFDFD00085BFDFDFDFDFDFD002A
        00FDFDFD00B2F61AFDFDFDFDFDFD00A400FDFDFD00F7FF5BFDFDFDFDFD002AB2
        00000000B2BE1AFDFDFDFDFDFD00A4F700000000F7085BFDFDFDFDFD002AB2B2
        B22A2ABABEF61AFDFDFDFDFD00A4F7F7F7A4A40708FF5BFDFDFDFD002AB2BABA
        BABABEF6F61AFDFDFDFDFD00A4F70707070708FFFF5BFDFDFDFDFDFD00BABABE
        F6F6F61A1AFDFDFDFDFDFDFD00070708FFFFFF5B5BFDFDFDFDFDFDFDFD00BEF6
        1A1A1AFDFDFDFDFDFDFDFDFDFD0008FF5B5B5BFDFDFDFDFDFDFDFDFDFDFD00F6
        1AFDFDFDFDFDFDFDFDFDFDFDFDFD00FF5BFDFDFDFDFDFDFDFDFDFDFDFDFDFD00
        1AFDFDFDFDFDFDFDFDFDFDFDFDFDFD005BFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        1AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD5BFDFDFDFDFDFDFDFDFD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnFgLotNoClick
    end
    object Label3: TUniLabel
      Left = 15
      Top = 44
      Width = 54
      Height = 13
      Hint = ''
      Caption = 'Location ID'
      TabOrder = 7
    end
    object cmbLocations: TUniDBLookupComboBox
      Left = 114
      Top = 16
      Width = 206
      Height = 21
      Hint = ''
      ListField = 'DESCRIP'
      ListSource = ds_Locations
      KeyField = 'LOC_DESC'
      ListFieldIndex = 0
      TabOrder = 0
      Color = clWindow
      OnChange = cmbLocationsChange
    end
    object EditLotNo: TUniEdit
      Left = 114
      Top = 64
      Width = 206
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object edLocation_ID: TUniEdit
      Left = 114
      Top = 40
      Width = 206
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
      Color = clBtnFace
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 98
    Width = 356
    Height = 44
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 354
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel3: TUniPanel
      Left = 131
      Top = 3
      Width = 224
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 115
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
  object wwQryLocations: TFDQuery
    BeforeOpen = wwQryLocationsBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select loc.loc_desc,'
      '       loc.descrip,'
      '       loc.eplant_id,'
      '       loc.id'
      '  from ship_to_vmi v,'
      '       locations loc'
      ' where v.ship_to_id = :ship_to_id'
      '   and v.locations_id = loc.id'
      '   and misc.eplant_filter( loc.eplant_id ) = 1'
      ' order by loc_desc'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 60
    Top = 11
    ParamData = <
      item
        Name = 'ship_to_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryLocationsLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object wwQryLocationsDESCRIP: TStringField
      DisplayLabel = 'Location Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 50
    end
    object wwQryLocationsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlantID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryLocationsID: TBCDField
      DisplayLabel = 'Location ID'
      DisplayWidth = 12
      FieldName = 'ID'
      Size = 0
    end
  end
  object ds_Locations: TDataSource
    DataSet = wwQryLocations
    Left = 56
    Top = 72
  end
end
