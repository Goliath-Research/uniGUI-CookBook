unit dbtdbg;

{******************************************************************************}
{                                                                              }
{  *** Debug Data ***                                                          }
{                                                                              }
{   This form unit displays data for a list of data sets, along with SQL.      }
{   The wrapper is contained in unit, IQDBTRANS.                               }
{                                                                              }
{******************************************************************************}


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
  Grids,
  DBGrids,
  Db,
  ExtCtrls,
  Menus,
  Wwdatsrc,
  Wwdbigrd,
  Wwdbgrid,
  ComCtrls,
  DBCtrls,
  wwrcdpnl,
  Variants,
  Buttons,
  StdCtrls,
  dbtdbgfm,
  IQMS.Common.JumpConstants,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMainMenu,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl;

type
  TFrmDBTransDebug = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Options1: TUniMenuItem;
    Close1: TUniMenuItem;
    StayOnTop1: TUniMenuItem;
    SrcQuery: TDataSource;
    Bevel1: TUniPanel;
    PnlDisplay: TUniPanel;
    pcMain: TUniPageControl;
    procedure Options1Click(Sender: TObject);
    procedure StayOnTop1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure pcMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pcMainDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure pcMainDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FFindText: String;
    FObjects: TList;
    FShowQuerySQL: Boolean;
    procedure AddDataSet(const ADataSet: TDataSet);
    procedure CheckFreeListObject;
    procedure CheckListObjectCreated;
    procedure OpenDataSets;
  public
    { Public declarations }
    FDataSet : TDataSet;
    constructor Create( const ADataSets: array of TDataSet);
    destructor Destroy; override;
  published
    { Published declarations }
    property ShowQuerySQL: Boolean read FShowQuerySQL write FShowQuerySQL default True;
  end;

  //function DoDebug(const AOwner: TComponent; const ADataSets: array of TDataSet;
  // AModal: Boolean = False ): TFrmDBTransDebug;

var
  FrmDBTransDebug: TFrmDBTransDebug;

implementation

{$R *.DFM}

uses
  IQMS.Common.ErrorDialog,
  IQMS.Common.RegFrm;

{function DoDebug(const AOwner: TComponent; const ADataSets: array of TDataSet;
 AModal: Boolean = False ): TFrmDBTransDebug;
begin
  Result := TFrmDBTransDebug.Create(AOwner, ADataSets);

  if AModal then
     with Result do
     try
       ShowModal;
     finally
       Free;
     end

  else Result.Show;

end; }

constructor TFrmDBTransDebug.Create(
 const ADataSets: array of TDataSet);
var
   i: Integer;
begin
  FObjects := NIL;
  inherited Create( uniGUIApplication.UniApplication );
  FShowQuerySQL := True;
  for i := Low(ADataSets) to High(ADataSets) do
      AddDataSet(ADataSets[i]);
end;

destructor TFrmDBTransDebug.Destroy;
begin
  CheckFreeListObject;
  inherited Destroy;
end;

procedure TFrmDBTransDebug.Options1Click(Sender: TObject);
begin
  StayOnTop1.Checked := ( FormStyle = fsStayOnTop );
end;

procedure TFrmDBTransDebug.StayOnTop1Click(Sender: TObject);
begin
  if StayOnTop1.Checked = FALSE then
     FormStyle := fsStayOnTop
  else FormStyle := fsNormal;
end;

procedure TFrmDBTransDebug.UniFormShow(Sender: TObject);
begin
  OpenDataSets;
end;

procedure TFrmDBTransDebug.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDBTransDebug.AddDataSet(const ADataSet: TDataSet);
var
   tab: TUniTabSheet;
   frm: TFrmDebugFrame;
   AShowSQL: Boolean;
begin
  CheckListObjectCreated;
  tab := TUniTabSheet.Create(Self);
  //tab.Parent := pcMain;
  tab.PageControl := pcMain;
  tab.Caption := ADataSet.Name;
  AShowSQL := FShowQuerySQL;

  frm := TFrmDebugFrame.Create(Self);
  frm.Name := Format('frmDebugDataSet_%d',[FObjects.Count + 1]);
  FObjects.Add(frm);

  with frm do
   begin
     Parent := tab;
     Align := alClient;
     DataSet := ADataSet;
     ShowQuerySQL := AShowSQL;
   end;
end;

procedure TFrmDBTransDebug.OpenDataSets;
var
   i: Integer;
begin
 try
    if (Self = NIL) or not Self.Showing then Exit;

    CheckListObjectCreated;

    for i := 0 to FObjects.Count - 1 do
        TFrmDebugFrame(FObjects.Items[i]).OpenDataSet;

 except
 end;
end;

procedure TFrmDBTransDebug.CheckListObjectCreated;
begin
 if (Self = NIL) then Exit;

 if not Assigned(FObjects) then
    FObjects := TList.Create;
end;

procedure TFrmDBTransDebug.CheckFreeListObject;
begin
  if Assigned(FObjects) then FreeAndNil(FObjects);
end;

procedure TFrmDBTransDebug.pcMainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TUniPageControl) then
     with (Sender as TUniPageControl) do
       BeginDrag(False);
end;

procedure TFrmDBTransDebug.pcMainDragDrop(Sender, Source: TObject; X,
  Y: Integer);
const
  TCM_GETITEMRECT = $130A;
var
  i: Integer;
  r: TRect;
begin
  if (Sender is TUniPageControl) then
  with (Sender as TUniPageControl) do
  begin
    for i := 0 to PageCount - 1 do
    begin
      Perform(TCM_GETITEMRECT, i, lParam(@r));
      if PtInRect(r, Point(X, Y)) then
      begin
        if i <> ActivePage.PageIndex then
          ActivePage.PageIndex := i;
        Exit;
      end;
    end;
  end;
end;

procedure TFrmDBTransDebug.pcMainDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Sender is TUniPageControl;
end;

end.
