unit Inv_Share;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule;

procedure CheckCanChangePkHide( AStandard_ID: Real; AArinvt_ID: Real = 0 );
procedure CheckWarnItemUsedInBOM( Sender: TObject; AArinvt_ID: Real );
function GetNonComittedQty( AArinvt_ID: Real ): Real;

implementation

uses
  IQMS.Common.InvMisc,
  inv_rscstr,
  IQMS.Common.ErrorDialog,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils,
  UOM_Conv,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox;

procedure CheckCanChangePkHide( AStandard_ID: Real; AArinvt_ID: Real = 0 );
var
  ARFQs: TStringList;

  procedure PopulateJobshopRFQs;
  begin
    with TFDQuery.Create(Application) do
    try
      Connection := UniMainModule.FDConnection1;


      // [Byron, 10/17/2005] The following SQL uses these resource string constants:
      // inv_rscstr.cTXT0000074 = 'Archived';
      // inv_rscstr.cTXT0000075 = 'Not Archived';

      SQL.Add(IQFormat('select distinct                 '+
                       '       r.id, projectno, descrip,'+
                       '       decode(archived, ''Y'', ''%s'', ''%s'') as IsArchived '+
                       '  from jobshop_task t,          '+
                       '       jobshop_rfq r            '+
                       ' where t.jobshop_rfq_id = r.id  '+
                       '   and t.standard_id = %f       ',
                       [ inv_rscstr.cTXT0000074, // 'Archived'
                         inv_rscstr.cTXT0000075, // 'Not Archived'
                         AStandard_ID ]));

      if AArinvt_ID > 0 then
         SQL.Add(IQFormat('and t.arinvt_id = %f ', [ AArinvt_ID ]));

      Open;
      while not Eof do
      begin
        ARFQs.Add( Format('%s'#9'%s (%s)',
                          [ FieldByName('projectno').asString,
                            FieldByName('descrip').asString,
                            FieldByName('IsArchived').asString ]));
        Next;
      end;

      if ARFQs.Count > 0 then
      begin
        ARFQs.Insert( 0, inv_rscstr.cTXT0000073 {'The following Jobshop Projects use this item'} );
        ARFQs.Insert( 1, '' );
      end;
    finally
      Free;
    end;
  end;

begin
  if AStandard_ID = 0 then EXIT;

  ARFQs:= TStringList.Create;
  try
    PopulateJobshopRFQs;

    if ARFQs.Count > 0 then
       ShowIQErrorMessage( inv_rscstr.cTXT0000076, // 'Item or BOM belongs to a JobShop project.  Cannot change field, Inactive.'
                           inv_rscstr.cTXT0000077, // 'You must use the Archive or Restore option in the JobShop Project module to alter the status of this item.'
                           StrTran( ARFQs.Text, #13, '' ));
  finally
    ARFQs.Free;
  end;
end;


procedure CheckWarnItemUsedInBOM( Sender: TObject; AArinvt_ID: Real );
var
  ABomInvolved, AOEInvolved, APOInvolved: Boolean;
begin
  ABomInvolved:= SelectValueFmtAsFloat('select count(*) from opmat where arinvt_id = %f and rownum < 2',      [ AArinvt_ID ]) > 0;
  AOEInvolved := SelectValueFmtAsFloat('select count(*) from ord_detail where arinvt_id = %f and rownum < 2', [ AArinvt_ID ]) > 0;
  APOInvolved := SelectValueFmtAsFloat('select count(*) from po_detail where arinvt_id = %f and rownum < 2',  [ AArinvt_ID ]) > 0;

  if not (ABomInvolved or AOEInvolved or APOInvolved) then
     EXIT;

  // 'Please note this item is consumed in the following modules: ';
  // 'BOM Configuration';
  // 'Sales Orders';
  // 'Purchase Orders';
  // 'Changes made to inventory UOM must be propagated to the BOM Configuration, Sales Orders and Purchase Orders.'#13+
  // 'If you continue you will be prompted to update each individual BOM consuming this item. Sales and Purchase Orders need to be revised manually.'#13#13+
  // 'Are you sure you want to continue?';
  if IQWarningYN( TFrmArinvt_UOM.ConstructMessageUsedInModules( ABomInvolved, AOEInvolved, APOInvolved )) then  // UOM_Conv.pas
     EXIT;

  if Sender is TUniDBComboBox then with Sender as TUniDBComboBox do
  begin
    PostMessage(Handle, CB_SHOWDROPDOWN, 0, 0);
    Update;
  end;

  ABORT;
end;



function GetNonComittedQty( AArinvt_ID: Real ): Real;
var
  AVMI: Real;
  A: Variant;
begin
  Result:= IQMS.Common.InvMisc.GetCalculateNonComitted( AArinvt_ID );

  // A:= SelectValueArrayFmt ( 'select standard_id, onhand, mfg_quan from arinvt where id = %f', [AArinvt_ID]);
  // if VarArrayDimCount( A ) = 0 then
  // begin
  //   Result:= 0;
  //   EXIT;
  // end;
  //
  // if A[ 0 {standard_id} ] = 0 then
  //    Result:= fMax(0, A[ 1 {onhand} ] - SelectValueFmtAsFloat('select max(cum_mat_qty) from day_use_total where arinvt_id = %f', [ AArinvt_ID ]))
  // else
  //    begin
  //      AVMI:= SelectValueFmtAsFloat('select sum(f.onhand) from fgmulti f, locations l '+
  //                       ' where f.arinvt_id = %f and f.loc_id = l.id and l.vmi = ''Y''',
  //                       [ AArinvt_ID ]);
  //
  //      Result:= fMax( 0, A[ 1 {onhand} ]- A[ 2 {mfg_quan} ] - AVMI );
  //    end;
end;

end.
