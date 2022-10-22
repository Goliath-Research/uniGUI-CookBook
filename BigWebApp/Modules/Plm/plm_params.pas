unit plm_params;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Mask,
  DBCtrls,
  Db,
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
  uniLabel;

type
  TFrmPlmParams = class(TUniForm)
    SrcParams: TDataSource;
    TblParams: TFDTable;
    PnlButtons: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    gbGeneral: TUniGroupBox;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label2: TUniLabel;
    PnlClient01: TUniPanel;
    DBEdit1: TUniDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal: Boolean;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  plm_rscstr;

{ TFrmPlmParams }

class function TFrmPlmParams.DoShowModal: Boolean;
begin
  with self.Create( uniGUIApplication.UniApplication ) do
    Result:= ShowModal = mrOK;
end;

procedure TFrmPlmParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01 ]);
end;

procedure TFrmPlmParams.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, PnlLeft01 ]);
end;

procedure TFrmPlmParams.btnOKClick(Sender: TObject);
begin
  IQAssert( TblParams.FieldByName('plm_projectno').asFloat >= 0,
   plm_rscstr.cTXT0000035{'Project # cannot be negative number.'});

  if TblParams.State = dsEdit then
     TblParams.Post;

  ModalResult:= mrOK;
end;

end.
