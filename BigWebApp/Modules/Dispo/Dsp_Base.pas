unit Dsp_Base;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Mask,
  Data.DB,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Phys,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl;

type
  TFrmDispoBase = class(TUniForm)
    SrcMaster: TDataSource;
    SrcDetail: TDataSource;
    TblMaster: TFDTable;
    TblDetail: TFDTable;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnDisposition: TUniButton;
    SrcMasterLoc: TDataSource;
    SrcDetailLoc: TDataSource;
    TblMasterLoc: TFDTable;
    TblDetailLoc: TFDTable;
    lblStatus: TUniLabel;
    Button2: TUniButton;
    PnlCarrier: TUniPanel;
    ScrollBoxCarrierLeft01: TUniScrollBox;
    pnlCarrierLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    lblUnit: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    dbeUNIT: TUniDBEdit;
    SplitterCarrierLeft01: TUniSplitter;
    pnlCarrierClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Panel1: TUniPanel;
    bvAddTo: TUniPanel;
    Panel5: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    gridTargetLoc: TUniDBGrid;
    PnlAddToCaption: TUniPanel;
    Label5: TUniLabel;
    Panel4: TUniPanel;
    Splitter2: TUniSplitter;
    Panel7: TUniPanel;
    bvMaterialsInvolved: TUniPanel;
    gridMatReq: TUniDBGrid;
    Panel11: TUniPanel;
    DBNavigator3: TUniDBNavigator;
    PnlMaterialsInvolvedCaption: TUniPanel;
    Label9: TUniLabel;
    Panel9: TUniPanel;
    bvRelieve: TUniPanel;
    Panel10: TUniPanel;
    DBNavigator2: TUniDBNavigator;
    gridMatLoc: TUniDBGrid;
    PnlRelieveCaption: TUniPanel;
    Label8: TUniLabel;
    Panel8: TUniPanel;
    sbtnLeft: TUniSpeedButton;
    sbtnRight: TUniSpeedButton;
    PnlMain: TUniPanel;
    SR: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure btnDispositionClick(Sender: TObject);
    procedure gridTargetLocEditButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure sbtnRightClick(Sender: TObject);
    procedure sbtnLeftClick(Sender: TObject);
    procedure Panel6Resize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FLocationTableFromEditedGrid : TDataSet;
    FExecOutTransFirst: Boolean;
    function GetStatus:string;
    procedure SetStatus( const AValue:string );
    function GetExcludeVMI:string;
    procedure SetExcludeVMI( const AValue:string );


  protected
    function GetDispoTableFromEditedGrid : TDataSet; virtual;
    procedure AddInTransactions;  virtual;
    procedure AddOutTransactions; virtual;
    procedure CheckMasterTotal; virtual;
    procedure CheckDetailTotal; virtual;
    procedure CheckPosted;
    procedure CheckTotals;
    procedure CheckMasterRecordTotal; virtual;
    procedure CheckDetailRecordTotal; virtual;
    procedure ExecuteTransaction; virtual;
    procedure BeforeDisposition; virtual;
  public
    { Public declarations }
    Batch_ID         : Real;
    FTrans_Source    : string;
    FTrans_Source_ID : Real;
    FDivision_ID     : Real;
    FExcludeVMI      :String;
    function ColumnByFieldName( AGrid:TUniDBGrid; AFieldName : string ):TUniBaseDBGridColumn;

    property ExcludeVMI : string read GetExcludeVMI write SetExcludeVMI;
    property Status : string read GetStatus write SetStatus;
    property LocationTableFromEditedGrid: TDataSet read FLocationTableFromEditedGrid write FLocationTableFromEditedGrid;
    property DispoTableFromEditedGrid   : TDataSet read GetDispoTableFromEditedGrid;
    property ExecOutTransFirst: Boolean read FExecOutTransFirst write FExecOutTransFirst;
  end;


implementation

{$R *.DFM}

uses
  dispo_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;


procedure TFrmDispoBase.FormCreate(Sender: TObject);
begin
  FDivision_ID:= 0;

  {06-02-2009 AA (weird) readonly is being read as true - fix it here}
  TblMasterLoc.Close;
  TblMasterLoc.UpdateOptions.ReadOnly:= FALSE;

  IQSetTablesActiveEx( TRUE, self, dispo_rscstr.cTXT0000013 {'Accessing database.  Please wait.'} );

  // compensate for changes caused by security
  { TODO -oathite -cWebConvert : Need to change procedure defination
  IQMS.Common.Controls.ResizeNavBar(DBNavigator1);
  IQMS.Common.Controls.ResizeNavBar(DBNavigator2);
  IQMS.Common.Controls.ResizeNavBar(DBNavigator3); }
end;

function TFrmDispoBase.GetExcludeVMI:string;
begin
  Result:= FExcludeVMI;
end;

procedure TFrmDispoBase.SetExcludeVMI( const AValue:string );
begin
  FExcludeVMI := AValue;
end;

function TFrmDispoBase.GetStatus:string;
begin
  Result:= lblStatus.Caption;
end;

procedure TFrmDispoBase.SetStatus( const AValue:string );
begin
  if AValue <> lblStatus.Caption then
  begin
    lblStatus.Caption:= AValue;
    lblStatus.Update;
  end;
end;

function TFrmDispoBase.ColumnByFieldName( AGrid:TUniDBGrid; AFieldName : string ):TUniBaseDBGridColumn;
var
  I:Integer;
begin
  for I:= 0 to AGrid.Columns.Count - 1 do with AGrid.Columns[ I ] do
    if CompareText( AFieldName, FieldName ) = 0 then
    begin
      Result:= AGrid.Columns[ I ];
      EXIT;
    end;
  Result:= NIL;
end;

procedure TFrmDispoBase.btnDispositionClick(Sender: TObject);
begin
  CheckPosted;
  BeforeDisposition;
  CheckTotals;
  case ExecOutTransFirst of
    TRUE:  begin
             AddOutTransactions;
             AddInTransactions;
           end;
    FALSE: begin
             AddInTransactions;
             AddOutTransactions;
           end;
  end;
  ExecuteTransaction;
end;

procedure TFrmDispoBase.CheckPosted;
begin
  if not TblDetail.UpdateOptions.ReadOnly    then TblDetail.CheckBrowseMode;
  if not TblMasterLoc.UpdateOptions.ReadOnly then TblMasterLoc.CheckBrowseMode;
  if not TblDetailLoc.UpdateOptions.ReadOnly then TblDetailLoc.CheckBrowseMode;
end;

procedure TFrmDispoBase.BeforeDisposition;
begin
end;

procedure TFrmDispoBase.CheckTotals;
begin
  try
    Status:= dispo_rscstr.cTXT0000001; // 'Validating quantity totals.  Please wait.'
    CheckMasterTotal;
    CheckDetailTotal;
  finally
    Status:= '';
  end;
end;

procedure TFrmDispoBase.CheckMasterTotal;
begin
  with TblMaster do
  begin
    First;
    while not Eof do
    begin
       CheckMasterRecordTotal;
       Next;
    end;
  end;
end;

procedure TFrmDispoBase.CheckDetailTotal;
begin
  with TblDetail do
  begin
    First;
    while not Eof do
    begin
       CheckDetailRecordTotal;
       Next;
    end;
  end;
end;

procedure TFrmDispoBase.CheckMasterRecordTotal;
begin
end;

procedure TFrmDispoBase.CheckDetailRecordTotal;
begin
end;

procedure TFrmDispoBase.AddInTransactions;
begin
end;

procedure TFrmDispoBase.AddOutTransactions;
begin
end;

procedure TFrmDispoBase.ExecuteTransaction;
begin
end;

procedure TFrmDispoBase.gridTargetLocEditButtonClick(Sender: TObject);
begin
   {Locations (for IN or OUT trans)}
   if Assigned( (Sender as TUniDBGrid).DataSource ) then
      LocationTableFromEditedGrid:= (Sender as TUniDBGrid).DataSource.DataSet//  as TFDTable
   else
      LocationTableFromEditedGrid:= NIL;

   if Assigned( LocationTableFromEditedGrid ) and not ( LocationTableFromEditedGrid.State in [dsEdit, dsInsert] ) then
     LocationTableFromEditedGrid.Edit;
end;

function TFrmDispoBase.GetDispoTableFromEditedGrid:TDataSet;
begin
  if Assigned( LocationTableFromEditedGrid ) and Assigned( (LocationTableFromEditedGrid as TFDTable).MasterSource ) then
     Result:= (LocationTableFromEditedGrid as TFDTable).MasterSource.DataSet // as TFDTable
  else
     Result:= NIL;
end;

procedure TFrmDispoBase.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDispoBase.sbtnRightClick(Sender: TObject);
begin
  if Assigned(gridMatLoc.DataSource) and Assigned(gridMatLoc.DataSource.DataSet) then
     gridMatLoc.DataSource.DataSet.Edit;
end;

procedure TFrmDispoBase.sbtnLeftClick(Sender: TObject);
begin
  if Assigned(gridMatLoc.DataSource) and Assigned(gridMatLoc.DataSource.DataSet) then
     gridMatLoc.DataSource.DataSet.Delete;
end;

procedure TFrmDispoBase.Panel6Resize(Sender: TObject);
var
  I:Integer;
begin
  EXIT;

  // for I:= 0 to Panel6.ControlCount - 1 do with Panel6.Controls[ I ] do
  //   if Tag = 1 then                       {resize}
  //      Width:= Panel6.Width - Left - 7
  //   else if Tag = 2 then                  {move}
  //      Left:= Panel6.Width - Width - 7
  //   else if Tag > 0 then
  //      Left:= Panel6.Width - Tag          {offset kept in the tag}
end;

procedure TFrmDispoBase.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
