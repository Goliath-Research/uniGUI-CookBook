unit RtSelect;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  RtTypes,
  IQMS.Common.JumpConstants,
  Vcl.Wwkeycb,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls;


type
  TFrmSelection = class(TUniForm)
    QryCell: TFDQuery;
    QryCellMFGCELL: TStringField;
    SrcQryCell: TDataSource;
    QryMfgType: TFDQuery;
    SrcQryMfgType: TDataSource;
    QryCellMFGTYPE: TStringField;
    QryMfgTypeMFGTYPE: TStringField;
    pnlButtons: TUniPanel;
    Panel1: TUniPanel;
    GroupBox1: TUniGroupBox;
    pnlMfgType: TUniPanel;
    DBGridMfgType: TUniDBGrid;
    pnlMfgTypeRadioBtn: TUniPanel;
    rbAllCells: TUniCheckBox;
    Splitter1: TUniSplitter;
    pnlMfgCell: TUniPanel;
    DBGridCell: TUniDBGrid;
    pnlMfgCellRadioBtn: TUniPanel;
    rbOneCell: TUniCheckBox;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    QryMfgTypeDESCRIP: TStringField;
    QryCellDESCRIP: TStringField;
    QryCellEPLANT_ID: TBCDField;
    QryCellPLANT_NAME: TStringField;
    QryCellMFGCELL_ID: TBCDField;
    QryMfgTypeSTANDARD_MFGTYPE: TStringField;
    bvlMfgType01: TUniPanel;
    bvlMfgCell01: TUniPanel;
    bvlSplitMfgtypeCell: TUniPanel;
    pnlMfgtypeSearch: TUniPanel;
    pnlSearchMfgcell: TUniPanel;
    wwIncrementalSearchMfgType: TwwIncrementalSearch;
    wwIncrementalSearchMfgcell: TwwIncrementalSearch;
    procedure FormCreate(Sender: TObject);
    procedure SetButtons(Sender: TObject);
    procedure DBGridMfgTypeDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QryCellBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure pnlMfgTypeResize(Sender: TUniControl; OldWidth,
      OldHeight: Integer);
  private
    { Private declarations }
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
  protected
    function GetMfgCell:TCellMfgType; virtual;
  public
    { Public declarations }
    property MfgCell:TCellMfgType read GetMfgCell;
    class function Execute( var MfgCellRecord:TCellMfgType ): Boolean;
  end;


function PickMfgTypeCell( var MfgCellRecord:TCellMfgType ):Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.MfgShare;

class function TFrmSelection.Execute( var MfgCellRecord: TCellMfgType): Boolean;
var
  LFrmSelection : TFrmSelection;
begin
  LFrmSelection := TFrmSelection.Create( uniGUIApplication.uniApplication );
  Result:= (LFrmSelection.ShowModal = mrOK);
  if Result then
     MfgCellRecord:= LFrmSelection.MfgCell;
end;


function PickMfgTypeCell(var MfgCellRecord:TCellMfgType):Boolean;
begin
  Result:= TFrmSelection.Execute( MfgCellRecord );
  // with TFrmSelection.Create(Application) do
  // try
  //   Result:= (ShowModal = mrOK);
  //   if Result then
  //      MfgCellRecord:= MfgCell;
  // finally
  //   Free;
  // end;
end;

procedure TFrmSelection.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, DBGridMfgType, DBGridCell, pnlMfgType, rbOneCell ]);
  { TODO -oathite -cWebConvert : Windows Message
  PostMessage( Handle, iq_AfterShowMessage, 0, 0);}
  { TODO -oathite -cWebConvert : ResizeCheckBoxes needs TForm
  IQMS.Common.Controls.ResizeCheckBoxes( self, pnlMfgTypeRadioBtn );
  IQMS.Common.Controls.ResizeCheckBoxes( self, pnlMfgCellRadioBtn ); }

  TCustomEdit(wwIncrementalSearchMfgType).TextHint:= 'Search mfg type ...';
  TCustomEdit(wwIncrementalSearchMfgCell).TextHint:= 'Search mfg cell ...';

  QryCell.Open;
  QryMfgType.Open;
end;

procedure TFrmSelection.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGridMfgType, DBGridCell, pnlMfgType, rbOneCell ]);
end;

procedure TFrmSelection.SetButtons(Sender: TObject);
var
  E1, E2: TNotifyEvent;
begin
  try
    E1:= rbAllCells.OnClick;
    E2:= rbOneCell.OnClick;
    rbAllCells.OnClick:= NIL;
    rbOneCell.OnClick := NIL;
    if Sender = rbAllCells then
      rbOneCell.Checked:= not rbAllCells.Checked
    else
      rbAllCells.Checked:= not rbOneCell.Checked;
  finally
    rbAllCells.OnClick:= E1;
    rbOneCell.OnClick := E2;
  end;

  dbGridMfgType.Enabled:= rbAllCells.Checked and not (QryMfgType.Eof and QryMfgType.Bof);
  dbGridCell.Enabled   := rbOneCell.Checked and not (QryCell.Eof and QryCell.Bof);

  wwIncrementalSearchMfgType.Enabled:= dbGridMfgType.Enabled;
  wwIncrementalSearchMfgcell.Enabled:= dbGridCell.Enabled;

  with dbGridMfgType do
    if Enabled then
    begin
      Options:= Options + [dgAlwaysShowSelection];
      Color:= clWindow;
      if Active then
         SetFocus;
    end
    else
      begin
        Color:= clBtnFace;
        Options:= Options - [dgAlwaysShowSelection];
      end;

  with dbGridCell do
    if Enabled then
    begin
      Options:= Options + [dgAlwaysShowSelection];
      Color:= clWindow;
      if Active then
         SetFocus;
    end
    else
      begin
        Color:= clBtnFace;
        Options:= Options - [dgAlwaysShowSelection];
      end;

  btnOK.Enabled:= dbGridMfgType.Enabled or dbGridCell.Enabled;
end;

function TFrmSelection.GetMfgCell:TCellMfgType;
begin
  if rbAllCells.Checked then     //MfgType
  begin
    Result.CellorMfgType := cmMFGTYPE;
    Result.Cell          := '';
    Result.MfgCell_ID    := -1;
    Result.MfgType       := QryMfgType.FieldByName('MFGTYPE').asString;
    Result.UseBaseMfgType:= FALSE;
  end
  else                           //Cell
  begin
    Result.CellorMfgType := cmCELL;
    Result.Cell          := QryCell.FieldByName('MFGCELL').asString;
    Result.MfgCell_ID    := QryCell.FieldByName('MFGCELL_ID').asFloat;
    Result.MfgType       := QryCell.FieldByName('MFGTYPE').asString;
    Result.UseBaseMfgType:= FALSE;
  end;
  Result.Lookup_MfgType:= IQMS.Common.MfgShare.lookup_mfgtype( Result.MfgType );
end;


procedure TFrmSelection.DBGridMfgTypeDblClick(Sender: TObject);
begin
  btnOK.Click;
end;

procedure TFrmSelection.FormShow(Sender: TObject);
begin
  self.SetButtons( rbAllCells );
  if dbGridCell.Enabled then
     ActiveControl:= dbGridCell
  else if dbGridMfgType.Enabled then
     ActiveControl:= dbGridMfgType;
end;

procedure TFrmSelection.QryCellBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TFrmSelection.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;


procedure TFrmSelection.IQAfterShowMessage(var Msg: TMessage);
begin
  self.BringToFront;
end;

procedure TFrmSelection.pnlMfgTypeResize(Sender: TUniControl; OldWidth,
  OldHeight: Integer);
begin
  // DBGridMfgType.Columns[ 0 ].Width:= DBGridMfgType.ClientWidth;
  // with DBGridCell do
  //   Columns[ 1 ].Width:= ClientWidth - Columns[ 0 ].Width - 2;
end;

end.


