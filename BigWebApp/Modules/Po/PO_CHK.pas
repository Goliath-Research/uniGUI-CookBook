unit PO_Chk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  FireDAC.Comp.DataSet,
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
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses,
  UniGUIApplication;

type
  TFrmPoNotApprovedException = class(TFrmStatusException)
    procedure FormShow(Sender: TObject);
  private
    FOrigin: String;
    procedure SetOrigin(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Origin:String read FOrigin write SetOrigin;
  end;

procedure CheckPONotApproved( APo_ID:Real; AStatus:string; AOrigin:String = 'PO'  ); overload;
procedure CheckPONotApproved( APo_ID:Real; const AStatusList : array of string; AOrigin:String = 'PO' ); overload;



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

procedure CheckPONotApproved(APo_ID:Real; AStatus:string; AOrigin:String = 'PO'  );
begin
 CheckPONotApproved( APo_ID, [ AStatus ]);
end;

procedure CheckPONotApproved( APo_ID:Real; const AStatusList : array of string; AOrigin:String = 'PO' );
var
  S: string;
  FrmPoNotApprovedException: TFrmPoNotApprovedException;
begin
  S:= Trim(SelectValueFmtAsString('select approved_by from po where id = %f', [ APO_ID ]));

  if (S = '') or StrInList( S, AStatusList ) then
    begin
      FrmPoNotApprovedException := TFrmPoNotApprovedException.Create(UniGUIApplication.UniApplication);
      with FrmPoNotApprovedException do
      try
        rcusto_ID := APo_ID;
        Origin := AOrigin;
        if not (ShowModal = mrOK) then
           raise TIQNotAuthorizedException .Create;
      finally
        //Release;
      end;
    end;
end;


procedure TFrmPoNotApprovedException.FormShow(Sender: TObject);
begin
  inherited;
  if (SelectValueAsString('select NVL(DISP_PO_ID_AS_REQUISITION, ''N'') from iqsys2') = 'Y') and (FOrigin = 'REQUISITION')then
  begin
    DBEdit1.DataField := 'ID';
    Label1.Caption := 'Requisition #';
  end
end;

procedure TFrmPoNotApprovedException.SetOrigin(const Value: String);
begin
  FOrigin := Value;
end;

end.
