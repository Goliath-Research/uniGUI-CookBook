unit LocWOHardAllocChk;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, System.Classes, uniGUIBaseClasses,
  uniGUIApplication;

type
  TFrmLocationWorkorderHardAllocatedException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;



procedure CheckLocationWorkOrderHardAllocated( AFGMulti_ID: Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckLocationWorkOrderHardAllocated( AFGMulti_ID: Real );
var
  FrmLocationWorkorderHardAllocatedException: TFrmLocationWorkorderHardAllocatedException;
begin
  if SelectValueFmtAsFloat('select w.cycles_req from workorder_bom a, workorder_bom_mat_loc b, workorder w '+
               ' where b.fgmulti_id = %f and b.workorder_bom_id = a.id and a.workorder_id = w.id', [ AFGMulti_ID ]) = 0 then
     EXIT;

   FrmLocationWorkorderHardAllocatedException := TFrmLocationWorkorderHardAllocatedException.Create( uniGUIApplication.uniApplication );
   with FrmLocationWorkorderHardAllocatedException do
   begin
     try
       if not (ShowModal = mrOK) then
          //raise Exception.Create('Status exception has not been authorized - unable to proceed');
          raise TIQNotAuthorizedException.Create;
     finally
       //Release;
     end;
   end;
end;


end.

