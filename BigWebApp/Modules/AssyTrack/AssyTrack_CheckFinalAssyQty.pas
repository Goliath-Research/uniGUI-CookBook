unit AssyTrack_CheckFinalAssyQty;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses,UniGUIApplication;

type
  TFrmAssyTrackFinalAssembyQtyCheck = class(TFrmStatusException)
  private
    { Private declarations }
    FOpno: string;
    FSndop_ID :Real;
    procedure SetSndop_ID(const Value: Real);
  protected
    procedure PrepareQuery( AID: Real ); override;
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent; AWorkorder_ID, ASndop_ID:Real );
    class procedure DoShowModal( AWorkorder_ID, APartno_ID: Real; AInTransactionGoodParts: Real = 0);
    property Sndop_ID : Real  write SetSndop_ID;
  end;

implementation

{$R *.dfm}

uses
  //assy_share,
    { TODO : Dependency }
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous;

{ TFrmAssyTrackFinalAssembyQtyCheck }
class procedure TFrmAssyTrackFinalAssembyQtyCheck.DoShowModal( AWorkorder_ID, APartno_ID: Real; AInTransactionGoodParts: Real = 0);
var
  AFinalAssyParts     : Real;
  AList               : TStringList;
  I                   : Integer;

  function IsMismatchFoundAndAuthorized( ASndOp_ID, APartsToGo: Real ): Boolean;
  Var
  LFrmAssyTrackFinalAssembyQtyCheck : TFrmAssyTrackFinalAssembyQtyCheck;
  begin
  LFrmAssyTrackFinalAssembyQtyCheck := TFrmAssyTrackFinalAssembyQtyCheck.Create(UniGUIApplication.UniApplication);
    Result:= APartsToGo > 0.000001;
    if Result then
       with LFrmAssyTrackFinalAssembyQtyCheck do
        FOpNo:= SelectValueByID('opno', 'sndop', ASndop_ID );
       Begin
         if not (LFrmAssyTrackFinalAssembyQtyCheck.ShowModal = mrOK) then
            raise TIQNotAuthorizedException.Create;
         IQMS.Common.Miscellaneous.WriteEventLogFmt( 'Open ASSY1 processes for WO# %.0f, cannot complete. User has authorized to continue.', [ AWorkorder_ID ]);
       end;
  end;

begin
  //AFinalAssyParts:= assy_share.get_total_final_assembly_qty(  AWorkorder_ID, APartno_ID ) + AInTransactionGoodParts;
   { TODO : Dependency }
  AList:= TStringList.Create();
  try
    LoadColumnValueIntoStringList( AList, Format('select id from sndop_dispatch where workorder_id = %.0f order by id', [ AWorkorder_ID ]));

    if AList.Count > 0 then
       for I:= 0 to AList.Count - 1 do
       begin
         if IsMismatchFoundAndAuthorized(  SelectValueByID('sndop_id', 'sndop_dispatch', StrToFloat(AList[ I ])),
                                           SelectValueFmtAsFloat ('select assy1_sched.get_process_data( %s, ''PARTS_TO_GO'') from dual', [ AList[ I ] ])) then
                                          // assy_share.get_process_total_good_parts( AWorkorder_ID, StrToFloat(AList[ I ])) ) then
            EXIT;
       end
    else
       if IsMismatchFoundAndAuthorized( -1, -1 ) then
          EXIT;
  finally
    AList.Free;
  end;
end;



procedure TFrmAssyTrackFinalAssembyQtyCheck.PrepareQuery(AID: Real);
begin
  inherited;
  //with Query1 do
  //  ParamByName('opno').asString:= FOpno;
  AssignQueryParamValue(Query1, 'opno', FOpno);
end;

procedure TFrmAssyTrackFinalAssembyQtyCheck.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
end;

end.
