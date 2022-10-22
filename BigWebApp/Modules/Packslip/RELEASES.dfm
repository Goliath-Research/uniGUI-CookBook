object FrmReleases: TFrmReleases
  Left = 235
  Top = 226
  ClientHeight = 132
  ClientWidth = 274
  Caption = 'Releases'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnClose = FormClose
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 120
  TextHeight = 13
  object GridReleases: TUniDBGrid
    Left = 0
    Top = 0
    Width = 274
    Height = 132
    Hint = ''
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Columns = <
      item
        FieldName = 'QUAN'
        Title.Caption = 'Quantity'
        Title.Font.Height = -13
        Width = 44
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REQUEST_DATE'
        Title.Caption = 'Requested'
        Title.Font.Height = -13
        Width = 57
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promised'
        Title.Font.Height = -13
        Width = 48
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FORECAST'
        Title.Caption = 'Forecast'
        Title.Font.Height = -13
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_DATE'
        Title.Caption = 'Shipped'
        Title.Font.Height = -13
        Width = 49
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSER1'
        Title.Caption = 'User Notes'
        Title.Font.Height = -13
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
end
