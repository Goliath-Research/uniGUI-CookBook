inherited FrmCCPurge: TFrmCCPurge
  ClientHeight = 210
  Caption = 'Purge Settled Transactions'
  OldCreateOrder = True
  ExplicitHeight = 249
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlButtons: TUniPanel
    Top = 169
    ExplicitTop = 169
  end
  inherited PnlMain: TUniPanel
    Top = 105
    Height = 64
    ExplicitTop = 105
    ExplicitHeight = 64
    inherited Splitter1: TUniSplitter
      Height = 64
      ExplicitHeight = 64
    end
    inherited PnlLeft: TUniPanel
      Height = 62
      ExplicitHeight = 62
    end
    inherited PnlClient: TUniPanel
      Height = 62
      ExplicitHeight = 62
    end
  end
  inherited PnlPrompt: TUniPanel
    Height = 105
    ExplicitHeight = 105
    inherited lblPrompt: TUniLabel
      Width = 1779
      Caption = 
        'This screen allows you to purge transaction data.  Settled credi' +
        't card transactions, voids, refunds, and declined transactions o' +
        'n or before the date you select below will be deleted permanentl' +
        'y from the database.  It is recommended that you keep at least t' +
        'wo weeks of transaction data for business usage.  Authorizations' +
        ' which have not yet been settled will be retained.'
      ExplicitWidth = 1779
    end
  end
end
