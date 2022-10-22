unit CTP_Param;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFrmCTP_Params = class(TUniForm)
    Bevel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    DataSource1: TDataSource;
    Table1: TFDTable;
    DBEdit1: TUniDBEdit;
    DBCheckBox1: TUniDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal: Boolean;
  end;

function DoCTP_Params:Boolean;

var
  FrmCTP_Params: TFrmCTP_Params;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

function DoCTP_Params:Boolean;
begin
  Result:= TFrmCTP_Params.DoShowModal; // this unit
end;

class function TFrmCTP_Params.DoShowModal: Boolean;
var
  frm: TFrmCTP_Params;
begin
  frm:= TFrmCTP_Params.Create(uniGUIApplication.UniApplication);
  Result:= (frm.ShowModal = mrOK);
end;

procedure TFrmCTP_Params.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmCTP_Params.btnOKClick(Sender: TObject);
begin
  Table1.CheckBrowseMode;
  ModalResult:= mrOK;
end;


procedure TFrmCTP_Params.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

end.
