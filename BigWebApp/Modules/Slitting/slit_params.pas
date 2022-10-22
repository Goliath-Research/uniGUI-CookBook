unit slit_params;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniCheckBox,
  uniDBCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Controls;

type
  TFrmSlitParams = class(TUniForm)
    pnlMain: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    tblSlitParams: TFDTable;
    srcSlitParams: TDataSource;
    dbeOver: TUniDBEdit;
    dbeUnder: TUniDBEdit;
    tblSlitParamsOVER_TOLERANCE: TBCDField;
    tblSlitParamsUNDER_TOLERANCE: TBCDField;
    tblSlitParamsROUND_SETS_PER: TStringField;
    chkRoundSetsPer: TUniDBCheckBox;
    PnlToolbar: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoSlitParams;
  end;

implementation

//uses
  //iqmesg,
  //iqregfrm,
  //iqsecins;

{$R *.dfm}

class procedure TFrmSlitParams.DoSlitParams;
var
  frm: TFrmSlitParams;
begin
  frm:=TFrmSlitParams.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmSlitParams.btnCancelClick(Sender: TObject);
begin
  if ((tblSlitParams.State in [dsEdit, dsInsert])) { and IQWarningYN('Save changes?') } then
    tblSlitParams.CheckBrowseMode;
end;

procedure TFrmSlitParams.btnOKClick(Sender: TObject);
begin
  tblSlitParams.CheckBrowseMode;
end;

procedure TFrmSlitParams.FormCreate(Sender: TObject);
begin
  //iqregfrm.IQRegFormRead(Self,[Self]);
  tblSlitParams.Open;
end;

procedure TFrmSlitParams.UniFormDestroy(Sender: TObject);
begin
  //iqregfrm.IQRegFormWrite(Self,[Self]);
end;

end.
