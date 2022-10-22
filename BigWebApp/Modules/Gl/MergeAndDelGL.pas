unit MergeAndDelGL;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniListView,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, uniBasicGrid;

type TIDCargo = class
     ID:Real;
     constructor Create(AId:Real);
end;

type
  TFrmMergeAndDelGL = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Panel6: TUniPanel;
    GroupBoxSelect: TUniGroupBox;
    Panel2: TUniPanel;
    Panel7: TUniPanel;
    Shape4: TUniPanel;
    Label1: TUniLabel;
    BtnClear: TUniButton;
    BtnApply: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel8: TUniPanel;
    BtnMerge: TUniBitBtn;
    BtnClose: TUniButton;
    Panel14: TUniPanel;
    Splitter2: TUniSplitter;
    Panel9: TUniPanel;
    Panel13: TUniPanel;
    Label3: TUniLabel;
    ListViewSelect: TUniListView;
    Panel15: TUniPanel;
    Panel10: TUniPanel;
    Panel12: TUniPanel;
    BtnRight: TUniSpeedButton;
    BtnAllRight: TUniSpeedButton;
    BtnLeft: TUniSpeedButton;
    BtnAllLeft: TUniSpeedButton;
    Panel16: TUniPanel;
    Panel17: TUniPanel;
    Label2: TUniLabel;
    EdGlAcct: TUniEdit;
    sbtnSearch: TUniSpeedButton;
    PkGLAcct: TIQWebHPick;
    PkGLAcctACCT: TStringField;
    PkGLAcctDESCRIP: TStringField;
    PkGLAcctID: TBCDField;
    PkGLAcctTYPE: TStringField;
    PkGLAcctEPLANT_ID: TBCDField;
    ListViewMerge: TUniListView;
    QryAcct: TFDQuery;
    QryAcctID: TBCDField;
    QryAcctACCT: TStringField;
    QryAcctDESCRIP: TStringField;
    QryAcctTYPE: TStringField;
    QryAcctGL_SUBACCT_TYPE_ID: TBCDField;
    QryAcctMAJORTYPE: TStringField;
    QryAcctEPLANT_ID: TBCDField;
    StatusBar1: TUniStatusBar;
    PopupMenuMerge: TUniPopupMenu;
    SelectAll3: TUniMenuItem;
    DeselectAll3: TUniMenuItem;
    InvertSelection2: TUniMenuItem;
    EditMajorType: TUniEdit;
    Label4: TUniLabel;
    Label5: TUniLabel;
    PkGLAcctMAJORTYPE: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnRightClick(Sender: TObject);
    procedure BtnAllRightClick(Sender: TObject);
    procedure BtnLeftClick(Sender: TObject);
    procedure BtnAllLeftClick(Sender: TObject);
    procedure ListViewMergeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListViewMergeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListViewSelectDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListViewSelectDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SelectAll3Click(Sender: TObject);
    procedure DeselectAll3Click(Sender: TObject);
    procedure InvertSelection2Click(Sender: TObject);
    (*
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TCustomListView' and 'TCustomDrawState' }
    procedure ListViewMergeCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean); *)
    procedure BtnMergeClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure ListViewSelectColumnClick(Sender: TObject;
      Column: TUniGridColumn);
  private
    { Private declarations }
    FMergeIntoGlAcctId:Real;
    FMajorType:String;
    FOrderBy:String;
    FSql:String;
    FMergeIds:TStringList;
    FColumnName, FTableName:String;
    procedure EmptyListView(ListView:TUniListView);
    procedure EnableDisAbleGridAndButtons(lState:Boolean);
    procedure EnableListView(ListView:TUniListView);
    procedure DisableListView(ListView:TUniListView);
    procedure DisableTransferButtons;
    procedure EnableTransferButtons;
    procedure ApplySelection;
    procedure EnableDisAbleMerge(lState:Boolean);
    procedure AddItemToAListView(ListView:TUniListView; Account, ADescrip, AEplant:String; nId:Integer);
    procedure LoadListView(nItems:Integer);
    procedure UpdateStatusBar(cStr:String);
    function  OkMajortype(aId:Real):boolean;
    function  InListViewMerge(AId:Integer):boolean;
    procedure DeleteItemFromAList(ListView:TUniListView; nItem:Integer);
    procedure ClearListView(ListView:TUniListView);
    procedure InvertSelection(ListView:TUniListView);
    procedure SelectAll(ListView:TUniListView);
    function  SameEplantPlug(aID:Real):boolean;
    function  SameIdAsFMergeIntoGlAcctId(aId:Integer):boolean;
    procedure MergeDelete;
    procedure Update_C_GLACCT_YTD;

  public
    { Public declarations }
  end;

  procedure DoMergeAndDelGL;

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.PanelMsg;
{$R *.dfm}

procedure DoMergeAndDelGL;
begin
  with TFrmMergeAndDelGL.Create(uniGUIApplication.UniApplication) do show;
end;

procedure TFrmMergeAndDelGL.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

constructor TIDCargo.Create(AId:Real);
begin
  ID := AId;
end;

procedure TFrmMergeAndDelGL.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMergeAndDelGL.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  IQRegStringScalarWrite( self, 'MERGE_ORDER_BY', FOrderBy);
end;

procedure TFrmMergeAndDelGL.sbtnSearchClick(Sender: TObject);
begin
  with PkGLAcct do
    if Execute then
    begin
      FMergeIntoGlAcctId := GetValue('ID');
      FMajorType := SelectValueFmtAsString('select majortype from glacct where id = %f', [FMergeIntoGlAcctId]);
      EditMajorType.Text := FMajorType;
      EdGLAcct.Text := GetValue('ACCT');
    end;
end;

procedure TFrmMergeAndDelGL.SelectAll3Click(Sender: TObject);
begin
  SelectAll(ListViewMerge);
end;

procedure TFrmMergeAndDelGL.BtnClearClick(Sender: TObject);
begin
  FMergeIntoGlAcctId := 0;
  FMajorType := '';
  EdGLAcct.Text := '';
  EditMajorType.Text := '';
  FMergeIds.Clear;
  BtnApply.Enabled := true;
  BtnMerge.Enabled := false;
  EmptyListView(ListViewSelect);
  EmptyListView(ListViewMerge);
end;


procedure TFrmMergeAndDelGL.EmptyListView(ListView:TUniListView);
var
  i:integer;
begin
  for i := ListView.Items.Count -1 downto 0 do
      TIDCargo(ListView.Items[i].Data).Free;
  ListView.Items.Clear;
end;


procedure TFrmMergeAndDelGL.BtnApplyClick(Sender: TObject);
begin
  if EdGlAcct.text = '' then
    raise Exception.create('Please Assign GL Account to Merge Into.');
  EnableDisAbleGridAndButtons(True);
  ApplySelection;
  BtnClear.Enabled  := True;
  BtnApply.Enabled := False;
  EnableDisAbleMerge(False);
end;

procedure TFrmMergeAndDelGL.EnableDisAbleGridAndButtons(lState:Boolean);
begin
  if lState then
  begin
    EnableListView(ListViewSelect);
    EnableListView(ListViewMerge);
    EnableTransferButtons;
  end
  else
  begin
    DisableListView(ListViewSelect);
    DisableListView(ListViewMerge);
    DisableTransferButtons;
  end;
end;

procedure TFrmMergeAndDelGL.EnableListView(ListView:TUniListView);
begin
  ListView.Color   := clWindow;
  ListView.Enabled := True;
end;

procedure TFrmMergeAndDelGL.DisableListView(ListView:TUniListView);
begin
  ListView.Color   := clBtnFace;
  ListView.Enabled := False;
end;

procedure TFrmMergeAndDelGL.DisableTransferButtons;
begin
  BtnRight.Enabled    := False;
  BtnAllRight.Enabled := False;
  BtnAllLeft.Enabled  := False;
  BtnLeft.Enabled     := False;
end;

procedure TFrmMergeAndDelGL.EnableTransferButtons;
begin
  BtnRight.Enabled    := True;
  BtnAllRight.Enabled := True;
  BtnAllLeft.Enabled  := True;
  BtnLeft.Enabled     := True;
end;

procedure TFrmMergeAndDelGL.ApplySelection;
Var
  ASql:String;
  nItems:Integer;
begin
  ASql := Format('select * from GLACCT where MAJORTYPE = ''%s'' and id <> %f ', [FMajorType, FMergeIntoGlAcctId]);
  FSql := Asql;
  with QryAcct do
  begin
    Close;
    Sql.Clear;
    Sql.Add(ASql);
    QryAcct.Sql.Add(FOrderBy);
    Open;
  end;
  LoadListView(nItems);
end;


procedure TFrmMergeAndDelGL.ListViewMergeDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  BtnRight.Click;
end;

procedure TFrmMergeAndDelGL.ListViewMergeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = ListViewSelect;
end;

procedure TFrmMergeAndDelGL.ListViewSelectColumnClick(Sender: TObject;
  Column: TUniGridColumn);
begin
    if Column.Caption = 'Account' then
  begin
    if trim(FOrderBy) = 'order by acct asc' then
    begin
      FOrderBy := ' order by acct desc ';
      Panel3.Caption := ' Ordered by Account desc.';
    end
    else if trim(FOrderBy) = 'order by acct desc' then
    begin
      FOrderBy := ' order by acct asc ';
      Panel3.Caption := ' Ordered by Account asc.';
    end
    else
    begin
      FOrderBy := ' order by acct asc ';
      Panel3.Caption := ' Ordered by Account asc.';
    end;
  end
  else if Column.Caption = 'Description' then
  begin
    if trim(FOrderBy) = 'order by descrip asc' then
    begin
      FOrderBy := ' order by descrip desc';
      Panel3.Caption := ' Ordered by Description desc.';
    end
    else if trim(FOrderBy) = 'order by descrip desc' then
    begin
      FOrderBy := ' order by descrip asc';
      Panel3.Caption := ' Ordered by Description asc.';
    end
    else
    begin
      FOrderBy := ' order by descrip asc';
      Panel3.Caption := ' Ordered by Description asc.';
    end;
  end
  else
  begin
    if trim(FOrderBy) = 'order by eplant_id asc' then
    begin
      FOrderBy := ' order by eplant_id desc';
      Panel3.Caption := ' Ordered by EPlant ID desc.';
    end
    else if trim(FOrderBy) = 'order by eplant_id desc' then
    begin
      FOrderBy := ' order by eplant_id asc';
      Panel3.Caption := ' Ordered by EPlant ID asc.';
    end
    else
    begin
      FOrderBy := ' order by eplant_id asc';
      Panel3.Caption := ' Ordered by EPlant ID asc.';
    end;
  end;
  IQRegStringScalarWrite( self, 'MERGE_ORDER_BY', FOrderBy);
  QryAcct.Close;
  QryAcct.Sql.Clear;
  QryAcct.Sql.Add(FSql);
  QryAcct.Sql.Add(FOrderBy);
  QryAcct.Open;
  EmptyListView(ListViewSelect);
  QryAcct.First;
  with QryAcct do
    while not eof do
    begin
      AddItemToAListView(ListViewSelect,
                         FieldByName('ACCT').asString,
                         FieldByName('DESCRIP').asString,
                         FieldByName('EPLANT_ID').asString,
                         FieldByName('ID').asInteger);
      Next;
    end;
end;

procedure TFrmMergeAndDelGL.ListViewSelectDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  BtnLeft.Click;
end;

procedure TFrmMergeAndDelGL.ListViewSelectDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = ListViewMerge;
end;

procedure TFrmMergeAndDelGL.EnableDisAbleMerge(lState:Boolean);
begin
  BtnMerge.Enabled := lState;
end;

procedure TFrmMergeAndDelGL.AddItemToAListView(ListView:TUniListView; Account, ADescrip, AEplant:String; nId:Integer);
begin
  with ListView.Items.Add do
  begin
    Caption := Account;
    Subitems.Add(ADescrip);
    Subitems.Add(AEplant);
    Data    := TIDCargo.Create(nId);
  end;
end;

procedure TFrmMergeAndDelGL.LoadListView(nItems:Integer);
var
  i:Integer;
begin
  i:=0;
  QryAcct.First;
  with QryAcct do
    while not eof do
    begin
      Inc(i);
      AddItemToAListView(ListViewSelect,
                         FieldByName('ACCT').asString,
                         FieldByName('DESCRIP').asString,
                         FieldByName('EPLANT_ID').asString,
                         FieldByName('ID').asInteger);
      UpdateStatusBar( Format('Loading %d account out of %d selected', [i, nItems]) );
      Next;
    end;
    UpdateStatusBar('');
end;

procedure TFrmMergeAndDelGL.UniFormCreate(Sender: TObject);
begin
  FSql := QryAcct.Sql.Text;
  IQRegFormRead( self, [self]);
  FMergeIntoGlAcctId := 0;
  FMajorType := '';
  FMergeIds := TStringList.Create;
  IQRegStringScalarRead( self, 'MERGE_ORDER_BY', FOrderBy);
  if (FOrderBy = '') or (Trim(FOrderBy) = 'order by acct desc') or (Trim(FOrderBy) = 'order by acct asc') or (Trim(FOrderBy) = 'order by acct') then
  begin
    if (FOrderBy = '') or (Trim(FOrderBy) = 'order by acct') then
    begin
      FOrderBy := ' order by acct asc ';
      Panel3.Caption := ' Ordered by Account asc.';
    end
    else if trim(FOrderBy) = 'order by acct desc' then
    begin
      Panel3.Caption := ' Ordered by Account desc.';
    end
    else
    begin
      Panel3.Caption := ' Ordered by Account asc.';
    end;
  end
  else if (Trim(FOrderBy) = 'order by descrip desc') or (Trim(FOrderBy) = 'order by descrip asc') or (Trim(FOrderBy) = 'order by descrip') then
  begin
    if (Trim(FOrderBy) = 'order by descrip') then
    begin
      FOrderBy := ' order by descrip asc ';
      Panel3.Caption := ' Ordered by Description asc.';
    end
    else if trim(FOrderBy) = 'order by descrip desc' then
    begin
      Panel3.Caption := ' Ordered by Description desc.';
    end
    else
    begin
      Panel3.Caption := ' Ordered by Description asc.';
    end;
  end
  else
  begin
    if (Trim(FOrderBy) = 'order by eplant_id') then
    begin
      FOrderBy := ' order by eplant_id asc ';
      Panel3.Caption := ' Ordered by EPlant ID asc.';
    end
    else if trim(FOrderBy) = 'order by eplant_id desc' then
    begin
      Panel3.Caption := ' Ordered by EPlant ID desc.';
    end
    else
    begin
      Panel3.Caption := ' Ordered by EPlant ID asc.';
    end;
  end;

  QryAcct.Sql.Clear;
  QryAcct.Sql.Add(FSql);
  QryAcct.Sql.Add(FOrderBy);

  EnableDisAbleGridAndButtons(False);
  EnableDisAbleMerge(False);
  BtnClear.Enabled := False;
end;

procedure TFrmMergeAndDelGL.UpdateStatusBar(cStr:String);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SimpleText'
  StatusBar1.SimpleText := cStr; }
  StatusBar1.Update;
end;

procedure TFrmMergeAndDelGL.BtnRightClick(Sender: TObject);
var
  i, aItems, aId, aSelected, j :Integer;
  AQry:TFDQuery;
begin
  j := 0;
  with ListViewSelect do
  begin
    aSelected := SelCount;
    if (Items.Count = 0) or (aSelected = 0) then Exit;
    aItems := Items.Count - 1;
    for i := aItems downto 0 do
    begin
      if Items[i].Selected then
      begin
        aId := Trunc(TIDCargo(ListViewSelect.Items[i].Data).ID);
        if OkMajortype(aId) and not InListViewMerge(aId) and not SameIdAsFMergeIntoGlAcctId(aId) then
        begin
          Inc(j);
          UpdateStatusBar(Format('Moving %d account out of %d selected', [j, aSelected]));
          AQry:= TFDQuery.create(nil);
          try
            Aqry.Connection := UniMainModule.FDConnection1;
            Aqry.Sql.Add(IqFormat('select id, acct, descrip, eplant_id from glacct where id = %d', [AId]));
            Aqry.Open;
            AddItemToAListView(ListViewMerge,
                               Aqry.FieldByName('ACCT').asString,
                               Aqry.FieldByName('DESCRIP').asString,
                               Aqry.FieldByName('EPLANT_ID').asString,
                               Aqry.FieldByName('ID').asInteger);
            FMergeIds.Add(IntToStr(aId));
          finally
            AQry.Free;
          end;
        end;
      end;
    end;
  end;

  ListViewSelect.Refresh;

  UpdateStatusBar('');
  BtnMerge.Enabled := (ListViewMerge.Items.Count <> 0);
end;


procedure TFrmMergeAndDelGL.BtnAllRightClick(Sender: TObject);
var
  i, aItems, aId, j, aSelected :Integer;
  AQry:TFDQuery;
begin
  j := 0;
  with ListViewSelect do
  begin
    aSelected := Items.Count;
    if Items.Count = 0 then Exit;
    aItems := Items.Count - 1;
    for i := aItems downto 0 do
    begin
      aId := Trunc(TIDCargo(ListViewSelect.Items[i].Data).ID);
      if OkMajortype(aId) and not InListViewMerge(aId) and not SameIdAsFMergeIntoGlAcctId(aId) then
      begin
        Inc(j);
        UpdateStatusBar(Format('Moving %d account out of %d selected', [j, aSelected]));
        AQry:= TFDQuery.create(nil);
        try
          Aqry.Connection := UniMainModule.FDConnection1;
          Aqry.Sql.Add(IqFormat('select id, acct, descrip, eplant_id from glacct where id = %d', [AId]));
          Aqry.Open;
          AddItemToAListView(ListViewMerge,
                             Aqry.FieldByName('ACCT').asString,
                             Aqry.FieldByName('DESCRIP').asString,
                             Aqry.FieldByName('EPLANT_ID').asString,
                             Aqry.FieldByName('ID').asInteger);
          FMergeIds.Add(IntToStr(aId));
        finally
          AQry.Free;
        end;
      end;
    end;
  end;
  ListViewSelect.Refresh;
  UpdateStatusBar('');
  BtnMerge.Enabled := (ListViewMerge.Items.Count <> 0);
end;

function TFrmMergeAndDelGL.InListViewMerge(aId:Integer):boolean;
begin
  result := FMergeIds.IndexOf(IntToStr(aId)) >= 0;
end;

function TFrmMergeAndDelGL.SameIdAsFMergeIntoGlAcctId(aId:Integer):boolean;
begin
  result := Trunc(FMergeIntoGlAcctId) = aId;
end;


function TFrmMergeAndDelGL.OkMajortype(aId:Real):boolean;
begin
  Result := SelectValueFmtAsString('select majortype from glacct where id = %f', [aId]) = FMajortype;
end;

procedure TFrmMergeAndDelGL.BtnLeftClick(Sender: TObject);
var
  i, aItems, aId, j, k, aSelected :Integer;
begin
  j := 0;
  with ListViewMerge do
  begin
    aSelected := SelCount;
    if (Items.Count = 0) or (aSelected = 0) then Exit;
    aItems := Items.Count - 1;
    for i := aItems downto 0 do
    begin
      if Items[i].Selected then
      begin
        Inc(j);
        UpdateStatusBar(Format('Moving %d account out of %d selected', [j, aSelected]));
        aId := Trunc(TIDCargo(Items[i].Data).ID);
        DeleteItemFromAList(ListViewMerge, i);
        k := FMergeIds.IndexOf(IntToStr(aId));
        if k >= 0 then
          FMergeIds.Delete(k);
      end;
    end;
  end;
  ListViewSelect.Refresh;
  UpdateStatusBar('');
  BtnMerge.Enabled := (ListViewMerge.Items.Count <> 0);
end;

procedure TFrmMergeAndDelGL.BtnAllLeftClick(Sender: TObject);
var
  i, aItems, aId, j, k, aSelected :Integer;
begin
  j := 0;
  with ListViewMerge do
  begin
    aSelected := Items.Count;
    if Items.Count = 0 then Exit;
    aItems := Items.Count - 1;
    for i := aItems downto 0 do
    begin
      Inc(j);
      UpdateStatusBar(Format('Moving %d account out of %d selected', [j, aSelected]));
      aId := Trunc(TIDCargo(Items[i].Data).ID);
      DeleteItemFromAList(ListViewMerge, i);
      k := FMergeIds.IndexOf(IntToStr(aId));
      if k >= 0 then
        FMergeIds.Delete(k);
    end;
  end;
  ListViewSelect.Refresh;
  UpdateStatusBar('');
  BtnMerge.Enabled := (ListViewMerge.Items.Count <> 0);
end;

procedure TFrmMergeAndDelGL.DeleteItemFromAList(ListView:TUniListView; nItem:Integer);
begin
  TIDCargo(ListView.Items[nItem].Data).Free;
  ListView.Items.Delete(nItem);
end;

procedure TFrmMergeAndDelGL.DeselectAll3Click(Sender: TObject);
begin
  ClearListView(ListViewMerge);
end;

procedure TFrmMergeAndDelGL.ClearListView(ListView:TUniListView);
var
  i:Integer;
begin
  with ListView do
    for i := 0 to Items.Count - 1 do
      if Items[i].Selected then Items[i].Selected := False;
end;

procedure TFrmMergeAndDelGL.InvertSelection2Click(Sender: TObject);
begin
  InvertSelection(ListViewMerge);
end;

procedure TFrmMergeAndDelGL.InvertSelection(ListView:TUniListView);
var
  i:Integer;
begin
  with ListView do
    for i := 0 to Items.Count - 1 do
      if ListView.Items[i].Selected
        then ListView.Items[i].Selected := False
        else ListView.Items[i].Selected := True;
end;

procedure TFrmMergeAndDelGL.SelectAll(ListView:TUniListView);
var
  i:Integer;
begin
  with ListView do
    for i := 0 to Items.Count - 1 do
      Items[i].Selected := True;
end;

(*
{ TODO -oathite -cWebConvert : Undeclared identifier: 'TCustomListView' and 'TCustomDrawState' }
procedure TFrmMergeAndDelGL.ListViewMergeCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  Account:String;
begin
  if SameEplantPlug(TIDCargo(Item.Data).ID) then
  begin
   Sender.Canvas.Font.Color := clBlack;
   Sender.Canvas.Font.Style := [];
  end
  else
  begin
    Sender.Canvas.Font.Color := clRed;
    Sender.Canvas.Font.Style := [];
  end;
end;    *)

function TFrmMergeAndDelGL.SameEplantPlug(aID:Real):boolean;
var
  ASegName:String;
  ASourceEplantPlug, ATargetEplantPlug:String;
begin
  Result := true;
  ASegName := SelectValueAsString('select eplant_segment_name from iqsys where rownum < 2');
  if ASegName <> '' then
  begin
    ASourceEplantPlug :=  SelectValueFmtAsString('select %s from v_glacct where id = %f', [ASegName, aID]);
    ATargetEplantPlug :=  SelectValueFmtAsString('select %s from v_glacct where id = %f', [ASegName, FMergeIntoGlAcctId]);

    if ASourceEplantPlug <> ATargetEplantPlug then
      Result := false;
  end;

end;

procedure TFrmMergeAndDelGL.BtnMergeClick(Sender: TObject);
var
  DB:TFDCustomConnection;
begin
  if not IqConfirmYN(Format('Warning - this procedure is irreversible. All the Selected Account(s) to Merge will be merged into the %s account and then deleted. Are you sure you wish to continue?', [EdGlAcct.text])) then exit;
  try
    try
       DB := FDManager.FindConnection('IQFD');
       DB.StartTransaction; // start transaction
       MergeDelete;
       Update_C_GLACCT_YTD;
       BtnClearClick(nil);
       DB.Commit;
    finally
       if DB.InTransaction then
       begin
         DB.RollBack; // rollback if there was a problem
       end;
    end;
  except
    on E:Exception do
      raise exception.create(Format('%s, (%s %s)', [E.Message,
                                                    FTableName,
                                                    FColumnName]))
  end;
end;

procedure TFrmMergeAndDelGL.MergeDelete;
var
  i, aItems, j, aSelected :Integer;
  aId:Real;
  AQry:TFDQuery;
  Account:String;
  hMsg: TPanelMesg;
begin
  j := 0;
  hMsg:= hPleaseWait('');
  with ListViewMerge do
  try
    aSelected := Items.Count;
    aItems := Items.Count - 1;
    for i := aItems downto 0 do
    begin
      Inc(j);
      UpdateStatusBar(Format('Updating entries, %d out of %d accounts', [j, aSelected]));
      aId := TIDCargo(Items[i].Data).ID;
      ExecuteCommand('alter trigger tiud_glbatch disable');
      ExecuteCommandFmt('update glbatch set glacct_id = %f where glacct_id = %f', [FMergeIntoGlAcctId, aId]);
      ExecuteCommand('alter trigger tiud_glbatch enable');
      ExecuteCommandFmt('delete from glbudget where glacct_fy_id in (select id from glacct_fy where glacct_id = %f)', [aId]);
      ExecuteCommandFmt('delete from budgets_fy where glacct_fy_id in (select id from glacct_fy where glacct_id = %f)', [aId]);
      ExecuteCommandFmt('delete from glacct_fy where glacct_id = %f', [aId]);
      ExecuteCommandFmt('delete from FINANCIAL_RPT_DETAIL where glacct_id = %f', [aId]);
//      ExecuteCommandFmt('delete from frl_acct_code where acct_id = %f', [aId]);
      ExecuteCommandFmt('delete from C_GLACCT_YTD where glacct_id = %f', [aId]);
      ExecuteCommandFmt('delete from C_GLACCT_PERIOD_SUMMARY where glacct_id = %f', [aId]);

      AQry := TFDQuery.Create(nil);
      try
        AQry.Connection := UniMainModule.FDConnection1;
        AQry.Sql.Add('select table_name,                                                         ' +
                     '        column_name                                                        ' +
                     '   from all_tab_columns                                                    ' +
                     '  where owner = ''IQMS''                                                   ' +
                     '    and (column_name like ''%GLACCT%'' or column_name like ''%GL_ACCT%'' or column_name like ''%ACCT_ID%'')  ' +
                     '    and InStr( ''___GLACCT_ACCT___GLACCT_SEGMENT___GLACCT_FY_ID___DISABLE_GLACCT_HYPER_BROWSE__'', column_name ) = 0   ' +
                     '    and substr(table_name, 1, 2) <> ''V_'' and SubStr(table_name, 1, 3) <> ''FRL'' ' +
//                     '    and column_name <> ''DISABLE_GLACCT_HYPER_BROWSE'' ' +
                     '    order by table_name ');
        AQry.Open;
        while not AQry.Eof do
        begin
          FColumnName := AQry.FieldByName('column_name').asString;
          FTableName  := AQry.FieldByName('table_name').asString;
          hMsg.Mesg:= Format('Processing %s.%s...', [ FTableName, FColumnName ]);

          ExecuteCommandFmt('update %s set %s = %f where %s = %f',
                    [FTableName,
                     FColumnName,
                     FMergeIntoGlAcctId,
                     FColumnName,
                     aId]);
          AQry.Next;
        end;
      finally
        AQry.Free;
      end;
      Account := SelectValueFmtAsString('select acct from glacct where id = %f', [aId]);
      IQMS.Common.Miscellaneous.WriteEventLogFmt( 'Account %s [%f] merged into account %s [%f]', [ Account, aId, EdGlAcct.Text, FMergeIntoGlAcctId]);
      ExecuteCommandFmt('delete from glacct where id = %f', [AId]);
    end;
  finally
    hMsg.Free;
  end;
  ListViewSelect.Refresh;
  UpdateStatusBar('');
end;

procedure TFrmMergeAndDelGL.Update_C_GLACCT_YTD;
begin

  ExecuteCommand('truncate table c_glacct_ytd');

  ExecuteCommand('Begin                                                            ' +
         ' for v in (select * from v_glacct_ytd)                           ' +
         ' loop                                                            ' +
         '   update c_glacct_ytd set ytd_credit  = v.ytd_credit,           ' +
         '                           ytd_debit   = v.ytd_debit,            ' +
         '                           ytd_balance = v.ytd_balance           ' +
         '    where glyear_id = v.glyear_id and glacct_id = v.glacct_id;   ' +
         '   IF SQL%NOTFOUND then                                          ' +
         '     insert into c_glacct_ytd (glyear_id, glacct_id, start_date, end_date, ytd_credit, ytd_debit, ytd_balance)  ' +
         '                       values (v.glyear_id, v.glacct_id, v.start_date, v.end_date, v.ytd_credit, v.ytd_debit, v.ytd_balance); ' +
         '   end if;                                                       ' +
         ' end loop;                                                       ' +
         'End; ');


  ExecuteCommand('truncate table c_glacct_period_summary');

  ExecuteCommand('declare                                                                                   ' +
         ' begin                                                                                    ' +
         '   for v in (select glyear_id, glacct_id, glperiods_id, start_date, end_date,             ' +
         '                    period_credit, period_debit, period_balance                           ' +
         '               from v_glacct_period_summary                                               ' +
         '            )                                                                             ' +
         '   loop                                                                                   ' +
         '                                                                                          ' +
         '                                                                                          ' +
         '   insert into c_glacct_period_summary                                                    ' +
         '               ( id, glyear_id, glacct_id, glperiods_id, start_date, end_date,            ' +
         '                 period_credit, period_debit, period_balance )                            ' +
         '          values                                                                          ' +
         '               (s_c_glacct_period_summary.nextval,                                        ' +
         '                v.glyear_id, v.glacct_id, v.glperiods_id, v.start_date, v.end_date,       ' +
         '                v.period_credit, v.period_debit, v.period_balance );                      ' +
         '                                                                                          ' +
         '     commit;                                                                              ' +
         '                                                                                          ' +
         '                                                                                          ' +
         '   end loop;                                                                              ' +
         ' end; ');


end;


end.
