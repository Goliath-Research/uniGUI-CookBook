unit cc_log;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  FireDAC.Comp.Client,
  MainModule,
  cc_rscstr,
  Data.DB;

type
  TLogSource = (lsUnknown, lsAuthorization, lsSettlement, lsPurge, lsCardTypes,
    lsAttachCard, lsCustCards, lsManualSettlement, lsLog); // event source
  TLogSources = set of TLogSource;
  TLogClass = (ltUnknown, ltTransaction, ltError, ltScreenAccess,
    ltAccessDenied); // type of event
  TLogClasses = set of TLogClass;
procedure WriteToLog(const ACreditCardAccountID: Real;
  const ASource: TLogSource; const AClass: TLogClass; const ADetails: string;
  const ARequestData: string = ''; const AResponseData: string = '';
  const AArcustoID: Real = 0);
procedure WriteToLog_ScreenAccess(const AFormCaption: string;
  const ASource: TLogSource);
procedure WriteToLog_ScreenAccessDenied(const AFormCaption: string;
  const ASource: TLogSource; AMessage: string = '');
procedure ShowCreditCardTransLog(AOwner: TComponent);

const
  // cc_rscstr.cTXT0000719 = 'Authorization';
  // cc_rscstr.cTXT0000720 = 'Settlement';
  // cc_rscstr.cTXT0000721 = 'Purge';
  // cc_rscstr.cTXT0000722 = 'Card Types';
  // cc_rscstr.cTXT0000723 = 'Attach Card';
  // cc_rscstr.cTXT0000724 = 'Customer Cards';
  // cc_rscstr.cTXT0000725 = 'Manual Settlement';
  // cc_rscstr.cTXT0000726 = 'Credit Card Log';
  LogSourceStr: array [TLogSource] of string = (
    '', // lsUnknown
    cc_rscstr.cTXT0000719, // lsAuthorization
    cc_rscstr.cTXT0000720, // lsSettlement
    cc_rscstr.cTXT0000721, // lsPurge
    cc_rscstr.cTXT0000722, // lsCardTypes
    cc_rscstr.cTXT0000723, // lsAttachCard
    cc_rscstr.cTXT0000724, // lsCustCards
    cc_rscstr.cTXT0000725, // lsManualSettlement
    cc_rscstr.cTXT0000726); // lsLog

  // cc_rscstr.cTXT0000727 = 'Transaction';
  // cc_rscstr.cTXT0000728 = 'Error';
  // cc_rscstr.cTXT0000729 = 'Screen Access';
  // cc_rscstr.cTXT0000730 = 'Access Denied';
  LogClassStr: array [TLogClass] of string = (
    '', // ltUnknown
    cc_rscstr.cTXT0000727, // ltTransaction
    cc_rscstr.cTXT0000728, // ltError
    cc_rscstr.cTXT0000729, // ltScreenAccess
    cc_rscstr.cTXT0000730); // ltAccessDenied
  NL = #13#10; // #$D#$A

implementation

uses
  cc_logfrm,
  cc_params,
  IQMS.Common.ErrorDialog,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.SysInfo;

procedure WriteToLog(const ACreditCardAccountID: Real;
  const ASource: TLogSource; const AClass: TLogClass; const ADetails: string;
  const ARequestData: string; const AResponseData: string;
  const AArcustoID: Real);
var
  ALines: TStringList;
  o: TCreditCardParams;
  AMerchantData: string;
  // --------------------------------------------------------------------------
  procedure _Add(ACaption, AValue: string);
  begin
    if AValue > '' then
      ALines.Add(Format('%s=%s', [ACaption, AValue]));
  end;
// --------------------------------------------------------------------------

begin
  ALines := nil;
  AMerchantData := '';
  if ACreditCardAccountID > 0 then
    try
      ALines := TStringList.Create;
      o := TCreditCardParams.Create(nil, Trunc(ACreditCardAccountID));
      // cc_rscstr.cTXT0000718 = 'Gateway=%s';
      ALines.Add(Format(cc_rscstr.cTXT0000718, [o.GatewayDescription]));
      o.AsNameValues(ALines);
      AMerchantData := IQMS.Common.StringUtils.StrTran(ALines.Text, NL, ';');
    finally
      if Assigned(ALines) then
        FreeAndNil(ALines);
      if Assigned(o) then
        FreeAndNil(o);
    end;
  try
    with TFDStoredProc.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        StoredProcName := 'IQMS.CC.ADD_LOG_ENTRY';

        // Params IN
        with Params.CreateParam(ftInteger, 'v_class', ptInput) do
          AsFMTBcd := Ord(AClass);
        with Params.CreateParam(ftInteger, 'v_source', ptInput) do
          AsFMTBcd := Ord(ASource);
        with Params.CreateParam(ftOraClob, 'v_details', ptInput) do
          Value := ADetails;
        with Params.CreateParam(ftOraClob, 'v_request_data', ptInput) do
          Value := ARequestData;
        with Params.CreateParam(ftOraClob, 'v_response_data', ptInput) do
          Value := AResponseData;
        with Params.CreateParam(ftOraClob, 'v_merchant_data', ptInput) do
          Value := AMerchantData;
        with Params.CreateParam(ftString, 'v_machinename', ptInput) do
          AsString := IQMS.Common.SysInfo.GetMachineName;
        with Params.CreateParam(ftString, 'v_machineuserid', ptInput) do
          AsString := IQMS.Common.SysInfo.GetMachineUser;
        with Params.CreateParam(ftDateTime, 'v_machinedatetime', ptInput) do
          AsDateTime := Now;
        with Params.CreateParam(ftInteger, 'v_arcusto_id', ptInput) do
          AsFMTBcd := Trunc(AArcustoID);
        // Get values
        Prepare;
        ExecProc;
      finally
        Free;
      end;
  except
    on E: Exception do
      // cc_rscstr.cTXT0000716 = 'Error writing to log.';
      IQMS.Common.ErrorDialog.ShowIQErrorMessageB(cc_rscstr.cTXT0000716, E.Message, '');
  end;
end;

procedure WriteToLog_ScreenAccess(const AFormCaption: string;
  const ASource: TLogSource);
var
  AText: string;
begin
  // cc_rscstr.cTXT0000715 = '"%s" screen accessed.';
  AText := Format(cc_rscstr.cTXT0000715, [AFormCaption]);
  WriteToLog(0, ASource, ltScreenAccess, AText);
end;

procedure WriteToLog_ScreenAccessDenied(const AFormCaption: string;
  const ASource: TLogSource; AMessage: string);
var
  AText: string;
begin
  // cc_rscstr.cTXT0000717 = 'Invalid screen access (%s) by user, %s.';
  AText := Format(cc_rscstr.cTXT0000717,
    [AFormCaption, SecurityManager.UserName]);
  if AMessage > '' then
    AText := AText + #13#10 + AMessage;
  WriteToLog(0, ASource, ltAccessDenied, AText);
end;

procedure ShowCreditCardTransLog(AOwner: TComponent);
begin
  // 12/09/2008 Do not enforce DBA-only access.  Requested by customer,
  // through Tina, and approved by Randy.
  // Note: According to PCI Standards, the credit card log should be
  // available only to administrators, since it contains sensitive
  // information.  According to Randy, "The customer will be responsible
  // for assigning our new 'Credit Card Administration' role to whoever
  // they want."
  (* if not SecurityManager.IsUserDBA then
    begin
    WriteToLog_ScreenAccessDenied('Credit Card Transaction Log', lsLog,
    cc_rscstr.cTXT0000280);
    raise Exception.Create(cc_rscstr.cTXT0000280 {'Access denied.  DBA status required.'});
    end; *)
  TFrmCCLog.Create(AOwner).Show;
end;

end.
