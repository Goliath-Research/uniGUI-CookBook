unit IQMS.WebVcl.SkConf;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmConfirmLocationInSkid = class(TUniForm)
    Query1: TFDQuery;
    DataSource1: TDataSource;
    Query1LOC_DESC: TStringField;
    Query1LOTNO: TStringField;
    Query1ONHAND: TBCDField;
    Query1SERIAL: TStringField;
    SR: TIQWebSecurityRegister;
    Query1CLASS: TStringField;
    Query1ITEMNO: TStringField;
    Query1REV: TStringField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnCancel: TUniButton;
    btnIgnore: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft1: TUniPanel;
    PnlClient02: TUniPanel;
    Label4: TUniLabel;
    DBEdit4: TUniDBEdit;
    Panel6: TUniPanel;
    GroupBox1: TUniGroupBox;
    Panel3: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft2: TUniPanel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label7: TUniLabel;
    Panel5: TUniPanel;
    DBEdit5: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit7: TUniDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckLocationInSkid(AFGMulti_ID: Real);

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
//  IQSecIns,
  IQMS.WebVcl.ResourceStrings;

{$R *.DFM}


procedure CheckLocationInSkid(AFGMulti_ID: Real);
var
  frm : TFrmConfirmLocationInSkid;
begin
  frm := TFrmConfirmLocationInSkid.Create(uniGUIApplication.UniApplication);
  with frm.Query1 do
  begin
    Close;
    Params[0].Value := AFGMulti_ID;
    Open;
  end;
  if not(frm.Query1.Eof and frm.Query1.Bof) then
    if frm.ShowModal <> mrOK then
       raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000207 { 'Transaction is canceled' } );
end;


procedure TFrmConfirmLocationInSkid.FormCreate(Sender: TObject);
begin
//  IQMS.Common.Controls.CenterForm(Self);
end;

procedure TFrmConfirmLocationInSkid.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlLeft1, PnlLeft2]);
//  EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TFrmConfirmLocationInSkid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlLeft1, PnlLeft2]);
end;

end.
