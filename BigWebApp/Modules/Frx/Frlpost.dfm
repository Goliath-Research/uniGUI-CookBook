object FrmUnpostedBatches: TFrmUnpostedBatches
  Left = 50
  Top = 161
  ClientHeight = 354
  ClientWidth = 416
  Caption = 'View Unposted (to FRx) GL Batches'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBSave: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 26
      Height = 26
      Hint = 'Post selected batches'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4A592
        C06860B05850A05050A05050A050509048509048409048408040408038408038
        40703840703830FF00FFFF00FFA7A7A770707060606059595959595959595952
        52524E4E4E4E4E4E4747474242424242424040403D3D3DFF00FFFF00FFD06870
        F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
        30A03830703840FF00FFFF00FF7575759A9A9A8A8A8A5050502E2E2EB7B7B7B7
        B7B7C2C2C2C7C7C75050504A4A4A4A4A4A454545404040FF00FFFF00FFD07070
        FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
        40A04030803840FF00FFFF00FF7A7A7AA4A4A49292928A8A8A5858583D3D3D78
        7878E2E2E2E7E7E77E7E7E4A4A4A4C4C4C4A4A4A424242FF00FFFF00FFD07870
        FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
        40A04040804040FF00FFFF00FF7F7F7FAAAAAA9A9A9A9292925858580000003D
        3D3DD9D9D9DEDEDE7474745454545454544C4C4C474747FF00FFFF00FFD07880
        FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
        50B04840804040FF00FFFF00FF838383B2B2B2AAAAAA9A9A9A58585858585858
        58585858585E5E5E6868686363635C5C5C545454474747FF00FFFF00FFE08080
        FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
        50B05050904840FF00FFFF00FF8A8A8AB7B7B7B7B7B7AAAAAA9A9A9A9292928A
        8A8A8585857A7A7A7575756B6B6B6363635C5C5C4E4E4EFF00FFFF00FFE08890
        FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
        60C05850904840FF00FFFF00FF929292C0C0C0BDBDBD6E6E6E6868686363635C
        5C5C5757575252524848484242426B6B6B6363634E4E4EFF00FFFF00FFE09090
        FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
        10C06060904850FF00FFFF00FF989898C6C6C6727272E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E74242426B6B6B525252FF00FFFF00FFE098A0
        FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
        20D06860A05050FF00FFFF00FFA1A1A1C6C6C67A7A7AE7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7484848727272595959FF00FFFF00FFF0A0A0
        FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
        30D07070A05050FF00FFFF00FFA8A8A8C6C6C6828282E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E75252527A7A7A595959FF00FFFF00FFF0A8A0
        FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
        30E07880A05050FF00FFFF00FFADADADC6C6C68A8A8AE7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7575757858585595959FF00FFFF00FFF0B0B0
        FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
        40603030B05850FF00FFFF00FFB6B6B6C6C6C6959595E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E75C5C5C353535606060FF00FFFF00FFF0B0B0
        FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
        50B05860B05860FF00FFFF00FFB6B6B6C6C6C69C9C9CE7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7636363646464646464FF00FFFF00FFF0B8B0
        F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
        80D07870D07070FF00FFFF00FFBCBCBCBCBCBCB6B6B6B6B6B6B0B0B0A8A8A8A1
        A1A19898989898989292928A8A8A8383837F7F7F7A7A7AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SBSaveClick
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 28
    Width = 416
    Height = 326
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 199
    IQComponents.Grid.Height = 240
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcGlBatchId
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
    IQComponents.Navigator.DataSource = SrcGlBatchId
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 199
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 240
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcGlBatchId
    Columns = <
      item
        FieldName = 'SOURCE'
        Title.Caption = 'Source'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BATCHNUMBER'
        Title.Caption = 'Batch#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BATCH_DATE'
        Title.Caption = 'Batch date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TIME_STAMP'
        Title.Caption = 'Posted Time Stamp'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PERIOD'
        Title.Caption = 'Period'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'START_DATE'
        Title.Caption = 'Period Start Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_DATE'
        Title.Caption = 'Period End Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 272
    object File1: TUniMenuItem
      Caption = '&File'
      object Postselectedbatches1: TUniMenuItem
        Caption = '&Post selected batches'
        OnClick = SBSaveClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcGlBatchId: TDataSource
    DataSet = QryGlBatchId
    Left = 24
    Top = 100
  end
  object QryGlBatchId: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.source,'
      '       a.batchnumber,'
      '       a.glperiods_id,'
      '       a.tablename,'
      '       a.batch_date,'
      '       a.userid,'
      '       a.system_date,'
      '       a.time_stamp,'
      '       b.start_date,'
      '       b.end_date,'
      '       b.period'
      '  from glbatchid a,'
      '       glperiods b'
      ' where a.posted_in_frx is null'
      '   and a.glperiods_id = b.id'
      ' ')
    Left = 39
    Top = 101
    object QryGlBatchIdSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 2
      FieldName = 'SOURCE'
      Origin = 'a.SOURCE'
      Size = 2
    end
    object QryGlBatchIdBATCHNUMBER: TBCDField
      DisplayLabel = 'Batch#'
      DisplayWidth = 10
      FieldName = 'BATCHNUMBER'
      Origin = 'a.BATCHNUMBER'
      Size = 0
    end
    object QryGlBatchIdBATCH_DATE: TDateTimeField
      DisplayLabel = 'Batch date'
      DisplayWidth = 18
      FieldName = 'BATCH_DATE'
      Origin = 'a.BATCH_DATE'
    end
    object QryGlBatchIdUSERID: TStringField
      DisplayLabel = 'User ID'
      DisplayWidth = 35
      FieldName = 'USERID'
      Origin = 'a.USERID'
      Size = 35
    end
    object QryGlBatchIdTIME_STAMP: TDateTimeField
      DisplayLabel = 'Posted Time Stamp'
      DisplayWidth = 18
      FieldName = 'TIME_STAMP'
      Origin = 'a.TIME_STAMP'
    end
    object QryGlBatchIdPERIOD: TBCDField
      DisplayLabel = 'Period'
      DisplayWidth = 10
      FieldName = 'PERIOD'
      Origin = 'b.PERIOD'
      Size = 0
    end
    object QryGlBatchIdSTART_DATE: TDateTimeField
      DisplayLabel = 'Period Start Date'
      DisplayWidth = 18
      FieldName = 'START_DATE'
      Origin = 'b.START_DATE'
    end
    object QryGlBatchIdEND_DATE: TDateTimeField
      DisplayLabel = 'Period End Date'
      DisplayWidth = 18
      FieldName = 'END_DATE'
      Origin = 'b.END_DATE'
    end
    object QryGlBatchIdTABLENAME: TStringField
      DisplayLabel = 'Table Name'
      DisplayWidth = 255
      FieldName = 'TABLENAME'
      Origin = 'a.TABLENAME'
      Visible = False
      Size = 255
    end
    object QryGlBatchIdSYSTEM_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'SYSTEM_DATE'
      Origin = 'a.SYSTEM_DATE'
      Visible = False
    end
    object QryGlBatchIdID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLBATCHID.ID'
      Visible = False
      Size = 0
    end
    object QryGlBatchIdGLPERIODS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLPERIODS_ID'
      Origin = 'GLBATCHID.GLPERIODS_ID'
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'View Unposted (to FRx) GL Batches'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194111 $'
    BuildVersion = '176554'
    Left = 72
    Top = 100
  end
end
