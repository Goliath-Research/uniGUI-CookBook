unit ProdClone;

interface

uses
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ComCtrls,
  Db,
  StdCtrls,
  ExtCtrls,
  Grids,
  DBGrids,
  Prod_Share,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmProdCloneShift = class(TUniForm)
    SrcDayprod: TDataSource;
    PageControl1: TUniPageControl;
    TabSheet2: TUniTabSheet;
    gridDayProd: TUniDBGrid;
    QryDayprod: TFDQuery;
    QryDayprodPROD_DATE: TDateTimeField;
    QryDayprodSHIFT: TBCDField;
    QryDayprodMFGCELL: TStringField;
    QryDayprodEPLANT_ID: TFMTBCDField;
    Panel1: TUniPanel;
    StatusBar1: TUniStatusBar;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //constructor Create( AOwner: TComponent; ACurrentShift: TProdCargo );
    procedure AssignShift( var ACurrentShift: TProdCargo );
    class function SelectShift( ACurrentShift: TProdCargo; var ASelectShift: TProdCargo ): Boolean;
  end;

var
  FrmProdCloneShift: TFrmProdCloneShift;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.HelpHook,
  prod_rscstr;

class function TFrmProdCloneShift.SelectShift( ACurrentShift: TProdCargo;
               var ASelectShift: TProdCargo ): Boolean;
var
  frmProdCloneShift : TFrmProdCloneShift;
begin

  frmProdCloneShift := TFrmProdCloneShift.Create(uniGUIApplication.UniApplication);

  with frmProdCloneShift.QryDayprod do
  begin
    Close;
    ParamByName('mfgcell').asString    := ACurrentShift.MfgCell;
    ParamByName('prod_date').asDateTime:= ACurrentShift.ProdDate;
    ParamByName('shift').Value         := ACurrentShift.Shift;
    Open;
  end;

  frmProdCloneShift.StatusBar1.Panels[ 0 ].Text:= Format(prod_rscstr.cTXT0000038 {'Filter: MfgCell %s'}, [ACurrentShift.MfgCell]);

  Result := frmProdCloneShift.ShowModal = mrOK;
  if Result then
     frmProdCloneShift.AssignShift( ASelectShift );

end;


procedure TFrmProdCloneShift.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  IQRegFormWrite( self, [ self, gridDayProd ]);
//  Action:= caFree;
end;

procedure TFrmProdCloneShift.AssignShift( var ACurrentShift: TProdCargo );
begin
  with ACurrentShift do
  begin
    ProdDate:= QryDayprodPROD_DATE.asDateTime;
    Shift   := QryDayprodSHIFT.asInteger;
    MfgCell := QryDayprodMFGCELL.asString;
  end;
end;


procedure TFrmProdCloneShift.btnOKClick(Sender: TObject);
begin
  IQAssert( not (QryDayprod.Eof and QryDayprod.Bof ), prod_rscstr.cTXT0000039 {'Please select a production shift.'});
  ModalResult:= mrOK;
end;

procedure TFrmProdCloneShift.FormActivate(Sender: TObject);
begin
  //IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
