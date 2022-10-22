object FrmMfgConversion: TFrmMfgConversion
  Left = 197
  Top = 170
  ClientHeight = 161
  ClientWidth = 414
  Caption = 'User-Defined Conversions'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 27
    Width = 414
    Height = 134
    Hint = ''
    DataSource = SrcMfg_Conv
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Columns = <
      item
        FieldName = 'FIELD_NAME'
        Title.Caption = 'Field Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DefaultUOM'
        Title.Caption = 'Default Caption'
        Width = 80
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UOM'
        Title.Caption = 'UD UOM'
        Width = 80
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CAPTION'
        Title.Caption = 'UD Caption'
        Width = 80
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FACTOR'
        Title.Caption = 'Factor'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 189
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcMfg_Conv
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
    object DropDownButton1: TIQWebDropDownButton
      Left = 1
      Top = 1
      Width = 37
      Height = 25
      Hint = 'Add All Fields'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FF604830
        604830604830604830604830604830604830FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF46464646464646464646464646464646464646
        4646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0B0A0FFFFFF
        F0E8E0F0E0D0F0E0D0F0D8C0FFD0B0604830FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFAEAEAEFFFFFFE7E7E7DEDEDEDEDEDED5D5D5CECECE46
        4646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0B0A0FFFFFF
        FFFFFFFFF8F0FFF0F0FFF0E0F0D8C0604830FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFF7F7F7F2F2F2EEEEEED5D5D546
        4646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0B0A0D0B0A0
        C0A890C09880B09080B08870A07860604830FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFAFAFAFAFAFAFA5A5A59797978F8F8F87878777777746
        4646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0B8A0FFFFFF
        F0E8E0F0E0D0F0E0D0F0D8C0FFD0C06048306048306048306048306048306048
        30604830604830604830B5B5B5FFFFFFE7E7E7DEDEDEDEDEDED5D5D5D1D1D146
        4646464646464646464646464646464646464646464646464646D0B8B0FFFFFF
        FFFFFFFFF8F0FFF8F0FFF0F0FFE0D0807060FFE8D0F0E0D0F0D8C0C09880F0D0
        C0F0D0B0F0D0B0604830B8B8B8FFFFFFFFFFFFF7F7F7F7F7F7F2F2F2E0E0E06E
        6E6EE6E6E6DEDEDED5D5D5979797D0D0D0CDCDCDCDCDCD464646D0B8B0D0C0B0
        D0C0B0D0C0B0E0C8C0E0D0C0E0C8C0B0A8A0D0C0B0D0B8B0C0A890B09080C0B0
        A0C0A890C0A090604830B8B8B8BEBEBEBEBEBEBEBEBEC9C9C9CECECEC9C9C9A7
        A7A7BEBEBEB8B8B8A5A5A58F8F8FAEAEAEA5A5A5A0A0A0464646D0C0B0FFFFFF
        F0E8E0F0E8E0805840604030503830605850A09890E0D8D0FFE0D0C0A080F0D8
        C0F0D0C0F0D0B0604830BEBEBEFFFFFFE7E7E7E7E7E757575740404038383857
        5757979797D7D7D7E0E0E09D9D9DD5D5D5D0D0D0CDCDCD464646D0C0B0FFF8FF
        FFF8F0FFF0F0FFF0F0E0D0C0D0B8B0A09890605040A09090D0C0B0C0A090C0B0
        A0C0A890C0A090604830BEBEBEFAFAFAF7F7F7F2F2F2F2F2F2CECECEB8B8B897
        97974E4E4E919191BEBEBEA0A0A0AEAEAEA5A5A5A0A0A0464646D0C0B0C0A8A0
        B09880A08870907870907870907870A09080A08880705850F0E8E0C0A890FFE0
        D0F0D8C0F0D8C0604830BEBEBEA8A8A89595958585857878787878787878788E
        8E8E888888585858E7E7E7A5A5A5E0E0E0D5D5D5D5D5D5464646FF00FFFF00FF
        FF00FFA08870C0A8A0C0A8A0C0B0A0D0B8B0C0B0A0504030E0D0D0E0C8C0D0B8
        B0C0B0A0C0A090604830FF00FFFF00FFFF00FF858585A8A8A8A8A8A8AEAEAEB8
        B8B8AEAEAE3E3E3ED2D2D2C9C9C9B8B8B8AEAEAEA0A0A0464646FF00FFFF00FF
        FF00FFA09080FFF8F0FFF8FFF0E8E0C07850906040503820403020503820F0D0
        C0F0E0D0F0E0D0604830FF00FFFF00FFFF00FF8E8E8EF7F7F7FAFAFAE7E7E779
        79795F5F5F3636362E2E2E363636D0D0D0DEDEDEDEDEDE464646FF00FFFF00FF
        FF00FFB09080B09070C09880C0A890E0B8A0D08050905840704830D0B0A0B088
        70A07050A06040705040FF00FFFF00FFFF00FF8F8F8F8D8D8D979797A5A5A5B7
        B7B78080805A5A5A484848AFAFAF8787876F6F6F616161505050FF00FFFF00FF
        FF00FFB0A090D0C0C0B0B0B0B0A8A0C0A890E0C0B0D07850D0B8B0C0A090C0B0
        A0B0A0A0A09890604830FF00FFFF00FFFF00FF9E9E9EC2C2C2B0B0B0A7A7A7A5
        A5A5C0C0C07A7A7AB8B8B8A0A0A0AEAEAEA2A2A2979797464646FF00FFFF00FF
        FF00FFC0A8A0D0C8C0C0C0B0C0B0B0C09880E0D0D0E0C0B0D0C0C0B09080C0B0
        B0C0B0B0B0A0A0604830FF00FFFF00FFFF00FFA8A8A8C7C7C7BDBDBDB1B1B197
        9797D2D2D2C0C0C0C2C2C28F8F8FB1B1B1B1B1B1A2A2A2464646FF00FFFF00FF
        FF00FFC0B0A0C0A890C0A890C0A090B09880A09080A08880A08070A08070A080
        60A07860A07860A08070FF00FFFF00FFFF00FFAEAEAEA5A5A5A5A5A5A0A0A095
        95958E8E8E8888888080808080807D7D7D777777777777808080}
      OnClick = sbtnAddAllClick
      AssociatedPopupMenu = popMenu
      Flat = True
      Caption = ''
    end
  end
  object SrcMfg_Conv: TDataSource
    DataSet = TblMfg_Conv
    Left = 56
    Top = 64
  end
  object AppDef1: TIQWebAppDef
    AppCode = 'BOM'
    DataField = 'MFGTYPE'
    AfterMfgTypeChanged = AppDef1AfterMfgTypeChanged
    Left = 164
    Top = 88
  end
  object popMenu: TUniPopupMenu
    Left = 208
    Top = 88
  end
  object TblMfg_Conv: TFDQuery
    BeforePost = TblMfg_ConvBeforePost
    OnCalcFields = TblMfg_ConvCalcFields
    OnNewRecord = TblMfg_ConvNewRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       mfgtype,'
      '       field_name,'
      '       caption,'
      '       uom,'
      '       factor'
      '  from mfg_conv'
      ' where rtrim(mfgtype) = rtrim(:mfgtype)'
      ' order by field_name'
      ' ')
    Left = 56
    Top = 96
    ParamData = <
      item
        Name = 'MFGTYPE'
        DataType = ftString
        ParamType = ptInput
        Value = 'U-GEN-X'
      end>
    object TblMfg_ConvID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblMfg_ConvMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFGTYPE'
      Required = True
      Size = 10
    end
    object TblMfg_ConvFIELD_NAME: TStringField
      DisplayLabel = 'Field Name'
      FieldName = 'FIELD_NAME'
      Required = True
      Size = 30
    end
    object TblMfg_ConvCAPTION: TStringField
      DisplayLabel = 'UD Caption'
      FieldName = 'CAPTION'
      Required = True
      Size = 30
    end
    object TblMfg_ConvUOM: TStringField
      DisplayLabel = 'UD UOM'
      FieldName = 'UOM'
    end
    object TblMfg_ConvFACTOR: TFMTBCDField
      DisplayLabel = 'Factor'
      FieldName = 'FACTOR'
      Size = 6
    end
    object TblMfg_ConvDefaultUOM: TStringField
      DisplayLabel = 'Default UOM'
      FieldKind = fkCalculated
      FieldName = 'DefaultUOM'
      Calculated = True
    end
  end
end
