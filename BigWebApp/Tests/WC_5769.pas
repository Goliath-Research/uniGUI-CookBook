unit WC_5769;

interface

implementation

uses
  TestReg,
  crm_mail_preview_db,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.Stan.Option;

procedure Test1;
var
  ATransaction: TFDTransaction;
  AConnection: TFDConnection;
begin
  AConnection := TFDConnection.Create(nil);
  try
    AConnection.Params.Clear;
    AConnection.Params.Text := UniMainModule.FDConnection1.Params.Text;
    AConnection.ConnectionName := 'CRM_MASS_MAIL_CONNECTION';
    AConnection := UniMainModule.FDConnection1;
    AConnection.Connected := True;
    ATransaction := TFDTransaction.Create(nil);
    try
      // Configure the transaction, and start it
      ATransaction.Connection := AConnection;
      ATransaction.Options.AutoCommit := False;
      ATransaction.Options.EnableNested := False;
      ATransaction.Options.Isolation := TFDTxIsolation.xiSnapshot;
      ATransaction.StartTransaction;
      TFrmCRMMassMailPreviewDB.DoShowModal(151, ATransaction);
      finally
        // Allow the roll back to complete on Oracle side.

        //FCRMMailingID := 0;
        ATransaction.RollBack;
      end;
  finally
    try
        ATransaction.Free;
      except
        // If we still get the "ORA-01002: fetch out of sequence",
        // suppress the error and dereference the object
        ATransaction := nil;
    end;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-5769', 'Crm_Mail', 'crm_mail_preview_db', 'DoShowModal', Test1);

end.
