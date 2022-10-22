unit APShare;

interface

function InsertAccountSplit(AprepostId, AVendorID:Real; AType:String):Real;
function GetAPInvoiceTitle( AAPInvoice_ID: Real ): string;

implementation

uses
  IQMS.Common.DataLib;

function InsertAccountSplit(AprepostId, AVendorID:Real; AType:String):Real;
var
  AGLTemplateId:Real;
  AGlAcctId:Real;
begin
  Result := 0;
  if  (AprepostId = 0) and (AType <> 'BEFOREPOST') then exit;
  AGLTemplateId := SelectValueFmtAsFloat('select gltemplate_id from vendor where id = %f', [AVendorID]);
  if AGLTemplateId <> 0 then
  begin
    if AType <> 'BEFOREPOST' then
    begin
      ExecuteCommandFmt('insert into apprepost_detail_sales (glacct_id, percentage, apprepost_detail_id) ' +
                ' select glacct_id, percentage, %f from gltemplate_detail where gltemplate_id = %f',
                [AprepostId, AGLTemplateId]);
      Result := SelectValueFmtAsFloat('select glacct_id from apprepost_detail_sales ' +
                          ' where apprepost_detail_id = %f order by percentage desc', [AprepostId]);
      if Result <> 0 then
        ExecuteCommandFmt('update apprepost_detail set glacct_id_expense = %f where id = %f', [Result, AprepostId]);
    end
    else
      Result := SelectValueFmtAsFloat('select glacct_id from gltemplate_detail ' +
                          ' where gltemplate_id = %f order by percentage desc', [AGLTemplateId]);
  end;
end;

function GetAPInvoiceTitle( AAPInvoice_ID: Real ): string;
begin
  Result:= SelectValueByID('invoice_no', 'apprepost', AAPInvoice_ID);
  if Result = '' then
     Result:= SelectValueByID('invoice_no', 'apinvoice', AAPInvoice_ID);
end;

end.

