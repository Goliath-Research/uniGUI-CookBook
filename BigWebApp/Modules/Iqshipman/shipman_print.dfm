object FrmIQShipManPrint: TFrmIQShipManPrint
  Left = 352
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Print Label'
  ClientHeight = 83
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 51
    Width = 396
    Height = 32
    Align = alBottom
    TabOrder = 0
    object Panel3: TUniPanel
      Left = 282
      Top = 0
      Width = 114
      Height = 32
      Align = alRight
      TabOrder = 0
      object btnClose: TUniButton
        Left = 8
        Top = 0
        Width = 97
        Height = 25
        Caption = 'Close'
        OnClick = btnCloseClick
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 396
    Height = 51
    Align = alClient
    TabOrder = 1
    object lblPrinterName: TUniLabel
      Left = 16
      Top = 24
      Width = 99
      Height = 13
      Caption = '(No printer selected)'
    end
    object lblPrintJobName: TUniLabel
      Left = 16
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Shipping Label'
    end
  end
  object imgPreview: TPMultiImage
    Left = 160
    Top = 232
    Width = 206
    Height = 217
    GrabHandCursor = 5
    Scrolling = True
    ShowScrollbars = True
    B_W_CopyFlags = [C_DEL]
    RotateBackColor = clBtnShadow
    Color = clBtnShadow
    Picture.Data = {07544269746D617000000000}
    ImageReadRes = lAutoMatic
    BlitMode = sLight
    ImageWriteRes = sAutoMatic
    TifSaveCompress = sNONE
    TiffPage = 0
    TiffAppend = False
    JPegSaveQuality = 25
    JPegSaveSmooth = 5
    RubberBandBtn = mbLeft
    ScrollbarWidth = 12
    ParentColor = True
    StretchRatio = True
    Text = ''
    TextLeft = 0
    TextTop = 0
    TextRotate = 0
    TabOrder = 2
    AllowRubberBand = True
    ZoomBy = 10
    RawInterpolateRGBAsFourColors = False
    RawBrightness = 1.000000000000000000
    RawCamera_white_balance = False
    RawRedScaling = 1.000000000000000000
    RawBlueScaling = 1.000000000000000000
    RawUpsideDown = False
    RawGammaValue = 0.500000000000000000
  end
  object PrintDialog: TPrintDialog
    Left = 120
    Top = 8
  end
end
