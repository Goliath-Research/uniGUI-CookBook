unit inv_loc_params;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  FireDAC.Comp.Client,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmInvLocParams = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    DBCheckBox1: TUniDBCheckBox;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SrcParams: TDataSource;
    TblParams: TFDTable;
    TblParamsINV_UNIQUE_LOC_BY_EPLANT: TStringField;
    procedure btnOKClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmInvLocParams }

class procedure TFrmInvLocParams.DoShowModal;
var
  lFrmInvLocParams: TFrmInvLocParams;
begin
  lFrmInvLocParams:= TFrmInvLocParams.Create(uniGUIApplication.UniApplication);
  lFrmInvLocParams.ShowModal;
end;

procedure TFrmInvLocParams.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(True,self);
end;

procedure TFrmInvLocParams.btnOKClick(Sender: TObject);
begin
  if TblParams.State in [dsEdit, dsInsert] then
     TblParams.Post;
end;


end.
