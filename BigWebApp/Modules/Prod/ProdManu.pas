unit ProdManu;

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
  Db,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniComboBox,
  uniDBComboBox;

type
  TFrmProdNewManualRepDialog = class(TUniForm)
    wwQuery1: TFDQuery;
    wwQuery1MFGCELL: TStringField;
    wwQuery1MFGTYPE: TStringField;
    wwQuery1EPLANT_ID: TBCDField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    timeProdDate: TUniDateTimePicker;
    edShift: TUniEdit;
    wwcombMfgCell: TUniDBLookupComboBox;
    Bevel1: TUniPanel;
    pnlBotomBtns: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ValidateEntry;
  public
    { Public declarations }
  end;

function GetNewProdManual( var AProdDate:TDateTime; var AShift:Integer; var AMfgCell:string ):Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  prod_rscstr;


function GetNewProdManual( var AProdDate:TDateTime; var AShift:Integer; var AMfgCell:string ):Boolean;
var
  LFrmProdNewManualRepDialog : TFrmProdNewManualRepDialog;
begin
  LFrmProdNewManualRepDialog := TFrmProdNewManualRepDialog.Create(uniGUIApplication.UniApplication);
  with LFrmProdNewManualRepDialog do
  begin
    Result:= ShowModal = mrOK;
    if Result then
    begin
      AProdDate:= timeProdDate.DateTime;
      AShift   := StrToInt(edShift.Text);
      AMfgCell := wwcombMfgCell.Text;
    end;
  end;
end;

procedure TFrmProdNewManualRepDialog.FormCreate(Sender: TObject);
begin
  timeProdDate.DateTime:= Date;
  IQSetTablesActive( TRUE, self );
  { TODO -oathite -cWebConvert : Incompatible types: 'TForm' and 'TFrmProdNewManualRepDialog'
  CenterForm(Self); // IQMS.Common.Controls.pas  }
  IQRegFormRead( self, [ self, PnlLeft01 ]);
end;

procedure TFrmProdNewManualRepDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01 ]);
end;

procedure TFrmProdNewManualRepDialog.btnOKClick(Sender: TObject);
begin
  ValidateEntry;
end;

procedure TFrmProdNewManualRepDialog.ValidateEntry;
var
  AShift:Integer;
begin
  AShift:= StrToInt( edShift.Text );
  if not (AShift in [ 1, 2, 3, 4 ]) then
     raise Exception.Create(prod_rscstr.cTXT0000041 {'Invalid shift.  Please enter shift between 1 and 4.'});
  ModalResult:= mrOK;
end;

procedure TFrmProdNewManualRepDialog.FormActivate(Sender: TObject);
begin
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmProdNewManualRepDialog.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
end;

procedure TFrmProdNewManualRepDialog.FormShow(Sender: TObject);
begin
  AdjustControlsWidthBasedOnParent( Panel4, [ wwcombMfgCell, timeProdDate ], 4 );
end;

end.
