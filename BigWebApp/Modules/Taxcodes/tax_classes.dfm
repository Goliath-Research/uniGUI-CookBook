object FrmTaxClasses: TFrmTaxClasses
  Left = 0
  Top = 0
  Caption = 'Inventory Tax Classes'
  ClientHeight = 299
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 450
    Height = 272
    Align = alClient
    TabOrder = 0
    DataSource = srcTaxClass
              Columns = <
                item
                  FieldName = 'CODE'
                  Title.Caption = 'Code'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DESCRIPTION'
                  Title.Caption = 'Description'
                  Width = 420
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'INFORMATION'
                  Title.Caption = 'INFORMATION'
                  Width = 420
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'SST'
                  Title.Caption = 'SST'
                  Width = 7
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'Y;N'
                end>
              PendingWork.Strings = (
                'Field <INFORMATION> has custom editor <wwDBComboDlgInfo>'
                )
    object wwDBComboDlgInfo: TUniEdit
      Left = 185
      Top = 168
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
      Visible = False
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 27
    Align = alTop
    TabOrder = 1
    object sbtnAddDefault: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 23
      Height = 22
      Hint = 'Populate Defaults'
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
        FDED9292929292929292FDFDFDFDFDFDFDA4A4A4A4A4A4A4A4A4FDFDFDFDFDFD
        FDF5FFFFFFFFFFFFFF92FDFDFDFDFDFDFDA4FFFDFDFDFDFDFDA4FDFDFDFDFDFD
        FDF5FF0709FFF507FF92FDFDFDFDFDFDFDA4FFA4A4FDA4A4FDA4FDFDFDFDFDFD
        FDF5FFFFFFFFFFFFFF92FDFDFDFDFDFDFDA4FFFDFDFDFDFDFDA4FDFDFDFDFDFD
        FDF5FF0707FF0707FF92FDFDFDFDFDFDFDA4FFA4A4FDA4A4FDA4FDFDFDFDFDFD
        FDF5FFFFFFFFFFFFFF92FDFDFDFDFDFDFDA4FFFFFFFFFFFFFFA4FDFDFDFDFDFD
        FD090909ECECE3E3E2DAFDFDFDFDFDFDFDA4A4A4A4A4A4A4A4A4FDFDFDFDFDFD
        FD0909090909090909DAFDFDFDFFFFFFFFA4A4A4A4A4A4A4A4A4FDFD00000000
        FD09090909ECECEBE3E2FDFDA4A4A4A4FFA4A4A4A4A4A4A4A4A4FDFD00FFFF00
        FDFDFDFDFDFDFDFDFDFDFDFDA4FFFDA4FFFFFFFDFDFDFDFDFDFD000000FFFF00
        0000FDFDFDFDFDFDFDFDA4A4A4FFFDA4A4A4FFFDFDFDFDFDFDFD00FFFFFFFFFF
        FF00FDFDFDFDFDFDFDFDA4FFFDFDFDFDFDA4FFFDFDFDFDFDFDFD00FFFFFFFFFF
        FF00FDFDFDFDFDFDFDFDA4FFFFFFFDFDFDA4FFFDFDFDFDFDFDFD000000FFFF00
        0000FDFDFDFDFDFDFDFDA4A4A4FFFDA4A4A4FFFDFDFDFDFDFDFDFDFD00FFFF00
        FDFDFDFDFDFDFDFDFDFDFDFDA4FFFFA4FFFDFDFDFDFDFDFDFDFDFDFD00000000
        FDFDFDFDFDFDFDFDFDFDFDFDA4A4A4A4FFFDFDFDFDFDFDFDFDFD}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAddDefaultClick
    end
    object sbtnWebTaxCode: TUniSpeedButton
      Left = 25
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Avalara Tax Code Web Page'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFCEC6C69C949473736B6B6B6373737394949CBDBDCEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7E7E7AD844AA56331BD6331CE
        6339BD5A39A55A4273524273635A848484DEDEDEFF00FFFF00FFFF00FFFF00FF
        DED6B5C67329BD5A39B55231946B42AD5239C65239CE5A42CE634AA552397B5A
        4A63736BD6DEE7FF00FFFF00FFFFE7CECE63299C4208A53100A53908525A1894
        3908A531089C3910B54A29BD5A39AD5242845A527B7B7BFF00FFFFF7EFCE7B39
        9C3900AD3900AD4200AD4A00106B08186300B54200A54200943900A53908AD52
        399C524A735A52BDBDBDF7DEADA54200AD4A00B55200B55A00A55A0010730008
        7300426300C65208AD4A00AD42006B63319463428C5A42848484E7AD63A54A00
        C65A00CE6300D66B00737B00088400008400317B00CE6300A55A007B5A00296B
        186363318C5A31636363DE8C39B55A00D66308D67300A584004A94001094007B
        8C00D68400C67B00007B00006B00106300396B217B5A21636363D67B29D66308
        CE730052941018A51829A5188C9C18F79410F79408C68400298400087B081073
        001063086363186B6363E7AD5ACE6B006B9C1010B52921B54221BD42B5BD4AEF
        BD42FFAD21FF9408738C00008400007B000863085A6310847B84EFC684D67300
        4AAD3121BD4A39CE634AD66B42C66BC6D684FFC65AFFAD18A59400108C000084
        00086B086B6318BDBDB5FFF7D68C9C2921B5394ACE635ADE84ADDE9484DE94D6
        F7B5DECE7BFFAD39D694086B8C00008400086B00847352FF00FFFF00FFADD694
        29BD524ADE7B94DEA5B5F7B5A5F7ADB5EFAD52CE734ABD427B9C18D67B082984
        007B7B21DEDED6FF00FFFF00FFFF00FFA5D6945ACE7B73E79CBDEFADADEFAD94
        DE9C42CE6B21BD39BD8C08EF8400C67321E7D6ADFF00FFFF00FFFF00FFFF00FF
        FF00FFCEEFBD7BE78C84E79484E7945AD68429CE6318B531B59421E7AD39FFF7
        C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEEFC6CED69CCE
        D68CC6CE7BD6DE9CFFE7CEFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnWebTaxCodeClick
    end
    object NavMain: TUniDBNavigator
      Left = 209
      Top = 1
      Width = 240
      Height = 25
      DataSource = srcTaxClass
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object qryTaxClass: TFDQuery
    BeforePost = qryTaxClassBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateObject = FDUpdateTaxClass
    SQL.Strings = (
      'select id, code, description, information, SST'
      'from tax_class')
    Left = 392
    Top = 88
    object qryTaxClassID: TBCDField
      DisplayWidth = 16
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Precision = 15
      Size = 0
    end
    object qryTaxClassCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'CODE'
      Size = 8
    end
    object qryTaxClassDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 255
    end
    object qryTaxClassINFORMATION: TStringField
      FieldName = 'INFORMATION'
      Origin = 'INFORMATION'
      Size = 1000
    end
    object qryTaxClassSST: TStringField
      FieldName = 'SST'
      Origin = 'SST'
      Size = 1
    end
  end
  object srcTaxClass: TDataSource
    DataSet = qryTaxClass
    Left = 344
    Top = 88
  end
  object FDUpdateTaxClass: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO TAX_CLASS'
      '(ID, CODE, DESCRIPTION, INFORMATION, SST)'
      
        'VALUES (:NEW_ID, :NEW_CODE, :NEW_DESCRIPTION, :NEW_INFORMATION, ' +
        ':NEW_SST)')
    ModifySQL.Strings = (
      'UPDATE TAX_CLASS'
      
        'SET ID = :NEW_ID, CODE = :NEW_CODE, DESCRIPTION = :NEW_DESCRIPTI' +
        'ON, '
      '  INFORMATION = :NEW_INFORMATION, SST = :NEW_SST'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM TAX_CLASS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, CODE, DESCRIPTION, INFORMATION, SST'
      'FROM TAX_CLASS'
      'WHERE ID = :ID')
    Left = 344
    Top = 152
  end
end
