object FrmPage_Master: TFrmPage_Master
  Left = 267
  Top = 243
  ClientHeight = 281
  ClientWidth = 544
  Caption = 'Master Page'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 26
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnRecord: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 24
      Hint = 'Play/Record WAV files'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000C21E0000C21E00000001000000000000363636003939
        39003C3C3C003F3F3F003D3F400040424200464646004E434300444648004848
        48004B4B4B00484B4D004D4D4D004E4E4E004F4F4F0053454500525252005353
        530054545400565757005B5C5D00595C5E005C5D5D005D5D5D005E5E5E006146
        47006161610061636300606466006A67670065696B00666A6C006B6A6A00686C
        6E006C6C6C006D6D6D0071717100737373007573730076797B00787878007979
        79007A7A7A00787C7F007C7C7C007F7F7F0086696A0088686900857272008E75
        75009779790094797A00977A7A009A7979007A7F8100FF00FF007C8082007D81
        830080808000818181008383830085858500878787008185880083888B008888
        88008A8A8A008D8D8D008E8E8E008F8F8F00888E9000898F92008B9092009494
        940096969600999999009A9A9A009D9898009C9C9C009F9F9F00A98B8B00A791
        9100999FA300A89DA0009EA4A700A0A0A000A3A3A300A5A2A500A5A5A500A1A7
        AA00A4ABAE00A8A8A800AAAAAA00ABABAB00ACACAC00AFAFAF00A7AEB100AAB1
        B400B0B0B000B2B2B200B6B6B600B7B7B700B3BABE00BBBBBB00BCBCBC00BDBD
        BD00BFBFBF00CE919200CF9A9A00C99C9D00D0929400D9969700D19B9C00DD98
        9900E1979700E09F9F00C3A2A300C1A5A800DEA6A700CAADB000CAB8BB00D0BA
        BA00E2A1A200E2A9AA00ECA9A900ECADAD00ECAEAE00E8BABB00EBBDBD00F5BD
        BD00B5BCC000B7BEC200B9C0C300B9C0C400BAC1C400BBC2C600BCC3C700BFC6
        CA00C1C1C100C2C2C200C3C3C300C4C4C400C6C6C600C7C7C700C0C7CB00C1C9
        CD00C8C8C800C9C9C900CACACA00CCCCCC00CFCFCF00C6CED200C7CFD300D0D0
        D000F3C4C500F6C4C500F4CDCE00E1CFD100E5CFD100F7F7F700F9F7F700FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000373737373737
        3737377D7B783737373737373737373737373737373737373737373737373737
        373737379E816F37373737373737373737373737373737373737373737978661
        5A60826C76779A713737373737968B635E5F693737373737373737379766471E
        151C3686757E779B6E3737379667453A3A3A2D8B373737373737373788274123
        2314081F868072377C3737378D29413A3A3A3A3A8B8A3737373737984841555C
        5F8B41042186746B9C7037993A3A555C5F8B413A3A8B373737379887162A5D8F
        935F6A410B4086739D7A998C3A3A5D8F935F6A413A418B3737379046121D0F0F
        4D955E4E051E616D377F92443A3A3A3A4B955E4E3A3A633737375719100F3035
        18658E6441155A373737563A3A3A3A3A3A658E643A3A5E3737372F3406244228
        31128F5E23155A3737373A3A3A3A3A3A3A3A8F5E3A3A5E3737373279023C8F4C
        26126258231C603737373A683A3C8F4C3A3A62583A3A5F37373733A00A0EA18F
        25204A49232B663737373A9F3A3AA18F3A3A4A493A2C67373737535193010D22
        12222D3E1B52913737374F3A933A3A3A3A3A2D3E3A4F9437373737502E070109
        11171A233F833737373737433A3A3A3A3A3A3A3A3D6A37373737373737373800
        030C1339859737373737373737373A3A3A3A3A3B8A9637373737373737373789
        5954849737373737373737373737378F5B588A96373737373737}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnRecordClick
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 26
    Width = 544
    Height = 255
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 327
    IQComponents.Grid.Height = 169
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcPage_Ctrl
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
    IQComponents.Navigator.DataSource = SrcPage_Ctrl
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 327
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 169
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcPage_Ctrl
    Columns = <
      item
        FieldName = 'CODE'
        Title.Caption = 'Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WAV_FILE_NAME'
        Title.Caption = 'WAV File Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TYPE'
        Title.Caption = 'Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'INTERVAL'
        Title.Caption = 'Interval'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REPEAT_COUNT'
        Title.Caption = 'Repeat Count'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDBComboDlgFileName: TUniEdit
    Left = 184
    Top = 144
    Width = 121
    Height = 21
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 2
  end
  object wwDBComboBoxType: TUniDBComboBox
    Left = 184
    Top = 120
    Width = 121
    Height = 21
    Hint = ''
    Visible = False
    Style = csDropDownList
    Items.Strings = (
      'EXCEPTION'
      'ANNOUNCEMENT')
    TabOrder = 3
  end
  object wwDBComboBoxCode: TUniDBComboBox
    Left = 16
    Top = 120
    Width = 121
    Height = 21
    Hint = ''
    Visible = False
    Items.Strings = (
      'FAST'
      'SLOW'
      'DOWN'
      'SETUP'
      'MATERIAL'
      'OVERRUN'
      'RTPM ALARM'
      'SCRAP')
    TabOrder = 4
  end
  object SrcPage_Ctrl: TDataSource
    DataSet = TblPage_Ctrl
    Left = 72
    Top = 64
  end
  object TblPage_Ctrl: TFDTable
    BeforePost = TblPage_CtrlBeforePost
    OnNewRecord = TblPage_CtrlNewRecord
    IndexFieldNames = 'CODE'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PAGE_MASTER'
    TableName = 'PAGE_MASTER'
    Left = 72
    Top = 80
    object TblPage_CtrlCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Size = 15
    end
    object TblPage_CtrlDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 17
      FieldName = 'DESCRIP'
      Size = 35
    end
    object TblPage_CtrlWAV_FILE_NAME: TStringField
      DisplayLabel = 'WAV File Name'
      DisplayWidth = 22
      FieldName = 'WAV_FILE_NAME'
      Size = 150
    end
    object TblPage_CtrlTYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 14
      FieldName = 'TYPE'
      Required = True
      Size = 15
    end
    object TblPage_CtrlINTERVAL: TBCDField
      DisplayLabel = 'Interval'
      DisplayWidth = 7
      FieldName = 'INTERVAL'
      MaxValue = 9999.000000000000000000
      MinValue = 15.000000000000000000
      Size = 0
    end
    object TblPage_CtrlREPEAT_COUNT: TBCDField
      DisplayLabel = 'Repeat Count'
      DisplayWidth = 11
      FieldName = 'REPEAT_COUNT'
      MaxValue = 99.000000000000000000
      MinValue = 1.000000000000000000
      Size = 0
    end
    object TblPage_CtrlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'wav'
    Filter = 'WAV (*.wav)|*.wav|All files (*.*)|*.*'
    Left = 104
    Top = 80
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'TblPage_Ctrl'
      'sbtnRecord')
    SecurityCode = 'FRMPAGE_MASTER'
    Left = 137
    Top = 80
  end
end
