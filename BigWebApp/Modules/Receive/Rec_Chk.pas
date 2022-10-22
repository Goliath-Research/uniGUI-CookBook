unit Rec_Chk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmRecNotApprovedException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckRecNotApproved( APo_ID:Real; AStatus:string );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib, uniGUIApplication;

procedure CheckRecNotApproved( APo_ID:Real; AStatus:string );
var
  S: string;
  LFrmRecNotApprovedException : TFrmRecNotApprovedException;
begin
  S:= Trim(SelectValueFmtAsString('select approved_by from po where id = %f', [ APO_ID ]));
  if (CompareText( S, AStatus ) = 0)
      or
     ((S = '') and ( SelectValueFmtAsFloat('select total_after_tax from v_po_total where id = %f', [ APO_ID ]) > 0 )) then
    begin
      LFrmRecNotApprovedException := TFrmRecNotApprovedException.Create(UniGUIApplication.UniApplication);
      with LFrmRecNotApprovedException do
      begin
        if not (ShowModal = mrOK) then
           raise TIQNotAuthorizedException .Create;
      end;
    end;
end;

end.
