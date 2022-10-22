object FrmVendStatusException: TFrmVendStatusException
  Left = 284
  Top = 249
  ClientHeight = 186
  ClientWidth = 314
  Caption = 'Authorization Required'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 150
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 312
      Height = 148
      Hint = ''
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Status Exception'
        object PnlDisplay: TUniPanel
          Left = 0
          Top = 0
          Width = 304
          Height = 120
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 87
            Top = 0
            Width = 6
            Height = 120
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft: TUniPanel
            Left = 1
            Top = 1
            Width = 87
            Height = 118
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object lblVendor: TUniLabel
              Left = 4
              Top = 9
              Width = 34
              Height = 13
              Hint = ''
              Caption = 'Vendor'
              TabOrder = 1
            end
            object lblCompany: TUniLabel
              Left = 4
              Top = 34
              Width = 45
              Height = 13
              Hint = ''
              Caption = 'Company'
              TabOrder = 2
            end
            object lblStatus: TUniLabel
              Left = 4
              Top = 59
              Width = 31
              Height = 13
              Hint = ''
              Caption = 'Status'
              TabOrder = 3
            end
          end
          object PnlClient: TUniPanel
            Left = 93
            Top = 1
            Width = 211
            Height = 118
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              211
              118)
            object DBEdit1: TUniDBEdit
              Left = 1
              Top = 6
              Width = 194
              Height = 19
              Hint = ''
              DataField = 'VENDORNO'
              DataSource = DataSource1
              TabOrder = 0
              Color = clBtnFace
            end
            object DBEdit2: TUniDBEdit
              Left = 1
              Top = 31
              Width = 194
              Height = 19
              Hint = ''
              DataField = 'COMPANY'
              DataSource = DataSource1
              TabOrder = 1
              Color = clBtnFace
            end
            object DBEdit3: TUniDBEdit
              Left = 1
              Top = 56
              Width = 113
              Height = 19
              Hint = ''
              DataField = 'STATUS_ID'
              DataSource = DataSource1
              TabOrder = 2
              Color = clBtnFace
            end
            object chkIgnore: TUniCheckBox
              Left = 2
              Top = 81
              Width = 208
              Height = 17
              Hint = ''
              Caption = 'Ignore'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
          end
        end
      end
    end
  end
  object PnlButton: TUniPanel
    Left = 0
    Top = 150
    Width = 314
    Height = 36
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Button1: TUniButton
      Left = 208
      Top = 3
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
    end
  end
  object Query1: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select vendorno, company, status_id'
      '  from vendor'
      ' where id = :id')
    Left = 224
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 256
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMVENDSTATUSEXCEPTION')
    SecurityItems.Strings = (
      'chkIgnore')
    SecurityCode = 'FRMVENDSTATUSEXCEPTION'
    Left = 192
  end
end
