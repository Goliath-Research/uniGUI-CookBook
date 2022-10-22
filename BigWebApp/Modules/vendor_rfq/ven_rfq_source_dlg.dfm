object FrmVendorRFQSourceDlg: TFrmVendorRFQSourceDlg
  Left = 223
  Top = 179
  ClientHeight = 108
  ClientWidth = 326
  Caption = 'Vendor RFQ Source'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 12
    Top = 22
    Width = 29
    Height = 13
    Hint = ''
    Caption = 'Select'
    TabOrder = 2
  end
  object wwDBComboBox1: TUniComboBox
    Left = 58
    Top = 18
    Width = 167
    Height = 21
    Hint = ''
    Style = csDropDownList
    Text = 'Master Inventory'#9'ARINVT'
    Items.Strings = (
      'Master Inventory'#9'ARINVT'
      'AKA'#9'AKA'
      'Quote'#9'QUOTE'
      'Quote Inventory'#9'QINVT'
      'Material Exception'#9'XCPT_MAT_REQ'
      'Asset Management'#9'PMEQMT'
      'Capital Equipment'#9'CAPITAL EQUIPMENT')
    ItemIndex = 0
    TabOrder = 0
    ClientEvents.UniEvents.Strings = (
      
        'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  Ext.apply(sender,' +
        ' {'#13#10'    matchFieldWidth: false,'#13#10'    pickerOffset: [0,-1]'#13#10'  });' +
        #13#10'  var picker;'#13#10'  picker=sender.getPicker();'#13#10'  picker.maxWidth' +
        '=sender.width*2;  // Here, change the multiplier to adjust it to' +
        ' your needs, '#13#10'  picker.border=1;'#13#10'}')
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 65
    Width = 326
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 324
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 150
      Top = 3
      Width = 176
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 91
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
end
