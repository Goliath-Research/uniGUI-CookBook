unit Snd_BL;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Snd_Base,
  Vcl.Menus,
  Vcl.Buttons,
  Vcl.DBGrids,
  Mask,
  Data.DB,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Vcl.Dialogs,
  IQMS.WebVcl.RepDef, IQMS.WebVcl.About, IQMS.WebVcl.HPick,
  IQMS.WebVcl.DocumentsExternal, IQMS.WebVcl.Documents, IQUniGrid, uniGUIFrame,
  uniPageControl, Vcl.Controls;

type
  TSndBL = class(TSndBase)
    Panel5: TUniPanel;
    Panel4: TUniPanel;
    SBCalc: TUniSpeedButton;
    NavBlendQtyBreaks: TUniDBNavigator;
    GridBlendQtyBreaks: TUniDBGrid;
    Splitter3: TUniSplitter;
    Panel3: TUniPanel;
    pmBlends: TUniPopupMenu;
    procCheckCircularRef: TFDStoredProc;
    SBCalcAll: TUniSpeedButton;
    DBCheckBox1: TUniDBCheckBox;
    DBCheckUseLetDown: TUniDBCheckBox;
    PnlItem01: TUniPanel;
    Splitter4: TUniSplitter;
    PnlItemLeft01: TUniPanel;
    PnlItemClient01: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    dbeItemNo: TUniDBEdit;
    dbeRev: TUniDBEdit;
    dbeDescrip: TUniDBEdit;
    dbeUnit: TUniDBEdit;
    bbtnEditBlendInv: TUniBitBtn;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    DBExt: TUniDBEdit;
    Label8: TUniLabel;
    lblSPG: TUniLabel;
    wwDBComboDlgSPG: TUniEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnEditBlendInvClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure GridMaterialsEditButtonClick(Sender: TObject);
    procedure SBCalcClick(Sender: TObject);
    procedure pmBlendsPopup(Sender: TObject);

    procedure ClickOnpmBlends(Sender: TObject);
    //procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
    (*
    procedure GridMaterialsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    *)
    procedure SBCalcAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBComboDlgSPGCustomDlg(Sender: TObject);

  protected
    procedure TblArinvtNewRecord(DataSet: TDataSet);
    procedure TblSndOpBeforeEdit(DataSet: TDataSet);
    procedure TblSndOpBeforeInsert(DataSet: TDataSet);
    procedure TblSndOpBeforeDelete(DataSet: TDataSet);
    procedure AfterDeleteEnableButtons(DataSet: TDataSet);  override;
    procedure SrcSndOpDataChange(Sender: TObject; Field: TField);
    procedure TblSndOpBeforePost(DataSet: TDataSet); override;
    procedure TblOpMatBeforePost(DataSet: TDataSet);
    procedure TblOpMatBeforeDelete(DataSet: TDataSet);
  private
    nId : Real;
    DBase:TFDConnection;
    lDeleteMaster:Boolean;
    AMenuItemPosition:Integer;
    ACalcAll:Boolean;
    { Private declarations }
    procedure CheckBlend;
    function GetPrice(nQty:Integer; nSndOpId:Real):Real;

    procedure AssignMaterialGridEditMethod( AUse_Let_Down: string );
    procedure TblSndOpAfterScroll(DataSet: TDataSet);
    procedure TblSndOpAfterPost(DataSet: TDataSet);
    procedure TblOpMatAfterPost(DataSet: TDataSet);
    procedure TblOpMatAfterDelete(DataSet: TDataSet);
    function  GetMenuItem:TUniMenuItem;
  public
    { Public declarations }
  end;

var
  SndBL: TSndBL;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.Panelmsg,
  sndop_rscstr;

procedure TSndBL.FormCreate(Sender: TObject);
begin
  OpClass:= 'BL';
  inherited;
  nId := 0;
  lDeleteMaster := False;
  DBase := UniMainModule.FDConnection1;
  if not DBase.InTransaction then DBase.StartTransaction;
  GridBlendQtyBreaks.DataSource:= SrcBlendArinvt_Breaks;
  navBlendQtyBreaks.DataSource := SrcBlendArinvt_Breaks;

  TblOpMat.FieldByName('PTSPER_DISP').DisplayLabel := sndop_rscstr.cTXT0000015; // 'Blend %'
  TblArinvt.OnNewRecord  := TblArinvtNewRecord;

  TblSndOp.BeforeEdit    := TblSndOpBeforeEdit;
  TblSndOp.BeforeInsert  := TblSndOpBeforeInsert;
  TblSndOp.BeforeDelete  := TblSndOpBeforeDelete;

  {LD Ratio change}
  { ------------------------------------------ }
  TblSndOp.AfterScroll   := TblSndOpAfterScroll;
  TblSndOp.AfterPost     := TblSndOpAfterPost;
  TblOpMat.AfterPost     := TblOpMatAfterPost;

  TblOpMat.AfterDelete   := TblOpMatAfterDelete;
  { ------------------------------------------ }

  TblOpMat.BeforePost    := TblOpMatBeforePost;
  TblOpMat.BeforeDelete  := TblOpMatBeforeDelete;

  SrcSndOp.OnDataChange  := SrcSndOpDataChange;

  // adjust check boxes for localization
  //IQMS.Common.Controls.ResizeCheckBoxes(PnlHeaderClient01); // iqctrl

  // ensure navigation bar Vcl.Buttons are 25x25 (after security)
  (*
  IQMS.Common.Controls.ResizeNavBar(NavMain);
  IQMS.Common.Controls.ResizeNavBar(NavBlendQtyBreaks);
  IQMS.Common.Controls.ResizeNavBar(navMaterials);
  IQMS.Common.Controls.ResizeNavBar(navMatQPB);
  *)
  IQRegFormRead(Self, [PnlItem01, PnlItemLeft01, GridBlendQtyBreaks, Panel5]); // iqregfrm

end;

procedure TSndBL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [PnlItem01, PnlItemLeft01, GridBlendQtyBreaks, Panel5]); // iqregfrm
  inherited;
end;

procedure TSndBL.TblArinvtNewRecord(DataSet: TDataSet);
begin
  with TblArinvt do begin
    FieldByName('CLASS').Value:= 'PL';
    FieldByName('UNIT').Value := sndop_rscstr.cTXT0000016; // 'LBS'
    FieldByName('REV').Value  := ' ';
  end;
end;

procedure TSndBL.bbtnEditBlendInvClick(Sender: TObject);
begin
  SrcSndOp.DataSet.CheckBrowseMode;
  SrcSndOp.OnDataChange := nil;
  inherited;  // invoke edit form
  SrcSndOp.OnDataChange := SrcSndOpDataChange;
  nId := TblSndOp.FieldByName('ID').asFloat;
  if not DBase.InTransaction then
     DBase.StartTransaction;
end;

procedure TSndBL.SrcSndOpDataChange(Sender: TObject; Field: TField);
begin
  if (nId <> 0) and Assigned(Sender) and (Sender is TFDTable) and (TFDTable(Sender).State = dsBrowse) then
  begin
    CheckBlend;
    DBase.StartTransaction;
  end;
end;

procedure TSndBL.TblSndOpBeforePost(DataSet: TDataSet);
begin
  inherited;
  nId := TblSndOp.FieldByName('ID').asFloat;
end;


procedure TSndBL.TblOpMatBeforePost(DataSet: TDataSet);
begin
  with procCheckCircularRef do
  begin
    ParamByName('v_arinvt_id_parent').Value := TblSndOp.FieldByName('ARINVT_ID').asFloat;
    ParamByName('v_arinvt_id_child').Value := TblOpMat.FieldByName('ARINVT_ID').asFloat;
    ExecProc;
  end;

  if TblOpMat.FieldByName('PTSPER_DISP').asFloat < 0 then
    raise Exception.Create(sndop_rscstr.cTXT0000017 {'Blend percentage cannot be less then zero.'});
  nId := TblSndOp.FieldByName('ID').asFloat;
  if not DBase.InTransaction then DBase.StartTransaction;
//  DBase.StartTransaction;
end;

procedure TSndBL.TblOpMatBeforeDelete(DataSet: TDataSet);
begin
  if not lDeleteMaster then nId := TblSndOp.FieldByName('ID').asFloat;
  lDeleteMaster := False;
end;


procedure TSndBL.TblSndOpBeforeEdit(DataSet: TDataSet);
begin
end;

procedure TSndBL.TblSndOpBeforeInsert(DataSet: TDataSet);
begin
end;

procedure TSndBL.TblSndOpBeforeDelete(DataSet: TDataSet);
begin
  lDeleteMaster := True;
  nId := 0;
end;

procedure TSndBL.AfterDeleteEnableButtons(DataSet: TDataSet);
begin
  inherited;
  lDeleteMaster := False;
  if DBase.InTransaction then with DBase do
  begin
    Commit;
    StartTransaction;
  end;
end;

procedure TSndBL.CheckBlend;
begin
  if DBase.InTransaction then
  begin
    if SelectValueAsFloat(IQFormat('select arinvt_id from sndop where id = %f', [nId])) = 0 then
    begin
      SrcSndOp.OnDataChange := nil;
      TblSndop.Locate('ID', nId, [loCaseInsensitive]);
      SrcSndOp.OnDataChange := SrcSndOpDataChange;
      raise Exception.Create(sndop_rscstr.cTXT0000018 {'Blend operation is not assigned to inventory.'});
    end;

    if (SelectValueAsFloat(IQFormat('select sum(ptsper_disp) from opmat where sndop_id = %f', [nId])) <> 100) then
    begin
      SrcSndOp.OnDataChange := nil;
      TblSndop.Locate('ID', nId, [loCaseInsensitive]);
      SrcSndOp.OnDataChange := SrcSndOpDataChange;
      // 'Either no materials have been assigned to the blend operation, or the total blend percentage does not equal 100.';
      raise Exception.Create(sndop_rscstr.cTXT0000019);
    end;
    nId := 0;
    DBase.Commit;
  end;
end;


procedure TSndBL.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  NavMain.DataSource.DataSet.CheckBrowseMode;
  TblOpMat.CheckBrowseMode;
  with TblSndop do
    if (State in [dsInsert, dsEdit]) and (FieldByName('arinvt_id').asFloat = 0) then
       raise Exception.Create(sndop_rscstr.cTXT0000018 {'Blend operation is not assigned to inventory.'});

  if nId <> 0 then
    CheckBlend;
end;

procedure TSndBL.FormDestroy(Sender: TObject);
begin
  inherited;
//  if DBase.InTransaction then DBase.RollBack;
  if DBase.InTransaction then DBase.Commit;
end;

procedure TSndBL.GridMaterialsEditButtonClick(Sender: TObject);
begin
  SrcSndOp.OnDataChange := nil;
  inherited;  // invoke edit form
  SrcSndOp.OnDataChange := SrcSndOpDataChange;
  nId := TblSndOp.FieldByName('ID').asFloat;
  if not DBase.InTransaction then DBase.StartTransaction;
end;

procedure TSndBL.pmBlendsPopup(Sender: TObject);
var
  i:Integer;
  NewItem: TUniMenuItem;
  AMax:Real;
  AInclude:Boolean;
begin
  AMenuItemPosition := -1;
  while pmBlends.Items.Count <> 0 do
    pmBlends.Items.Delete(0);

  with TblOpMat do
  try
    GridMaterials.DataSource := nil;
    // First;
    Close;
    Open;
    AMax := 0;
    while not eof do
    begin
      NewItem:= TUniMenuItem.Create( GridQtyBreaks );
      NewItem.Caption := Format(sndop_rscstr.cTXT0000020 {'Price Breaks by %s (Blend %f %%)'}, [FieldByName('ItemNo').asString,
                                                                   FieldByName('PtSper_Disp').asFloat]);
      AInclude := True;
      if (SelectValueFmtAsFloat('select count(arinvt_id) from arinvt_breaks where arinvt_id = %f and NVL(buying, ''N'') = ''Y''',
                                                 [FieldByName('ARINVT_ID').asFloat]) = 0 ) then
      begin
        if ACalcAll then
          AInclude := False
        else
          IqWarning(Format(sndop_rscstr.cTXT0000021 {'No Price Breaks for item, %s'}, [FieldByName('ItemNo').asString]));
      end;

      NewItem.Tag      := FieldByName('ARINVT_ID').asInteger;
      NewItem.OnClick  := ClickOnpmBlends;
      pmBlends.Items.Add(NewItem);
      if (FieldByName('PtSper_Disp').asFloat > AMax) and AInclude then
      begin
        AMax := FieldByName('Ptsper_Disp').asFloat;
        AMenuItemPosition := pmBlends.Items.Count - 1;
      end;
      Next;
    end;

    with TFDTable(GridBlendQtyBreaks.DataSource.DataSet) do
    begin
      CheckBrowseMode;
      if FieldByName('ARINVT_ID').asFloat <> 0 then
      begin
        NewItem:= TUniMenuItem.Create( GridQtyBreaks );
        NewItem.Tag      := 0;
        NewItem.OnClick  := ClickOnpmBlends;
        NewItem.Caption := '-';
        pmBlends.Items.Add(NewItem);

        NewItem:= TUniMenuItem.Create( GridQtyBreaks );
        NewItem.Tag      := 0;
        NewItem.OnClick  := ClickOnpmBlends;
        NewItem.Caption := sndop_rscstr.cTXT0000022; // 'Recalculate based on existing Price Breaks.'
        pmBlends.Items.Add(NewItem);
        AMenuItemPosition := pmBlends.Items.Count - 1;
      end;
    end;
  finally
    GridMaterials.DataSource := SrcOpMat;
  end;
end;


procedure TSndBL.SBCalcClick(Sender: TObject);
var
  P, Q : TPoint;
begin
  P.X := GridMaterials.Left;                          { P is the TPoint record for the form}
  P.Y := GridMaterials.Top;
  Q := Panel5.ClientToScreen(P);
  pmBlends.Popup(Q.X, Q.Y);
end;

procedure TSndBL.ClickOnpmBlends(Sender: TObject);
var
  nId, nArinvtId  : Real;
  AArinvt_BreaksID: Real;
  S               : string;
begin
  nId := TFDTable(dbeItemNo.DataSource.DataSet).FieldByName('ID').asFloat;
  nArinvtId := TFDTable(dbeItemNo.DataSource.DataSet).FieldByName('ARINVT_ID').asFloat;

  if nId = 0 then
  begin
    if not ACalcAll then
      raise Exception.Create(sndop_rscstr.cTXT0000023 {'Inventory item not created.'})
    else
      Exit;
  end;

  with TFDTable(GridBlendQtyBreaks.DataSource.DataSet) do
  begin
    CheckBrowseMode;
    if (TUniMenuItem(Sender).tag = 0) and (FieldByName('ARINVT_ID').asFloat = 0) then
    begin
      if not ACalcAll then
        raise Exception.Create(sndop_rscstr.cTXT0000024 {'Nothing to calculate.'})
      else
        Exit;
    end;

    if not ACalcAll then
      if FieldByName('ARINVT_ID').asFloat <> 0 then
        if not IQConfirmYN(sndop_rscstr.cTXT0000025 {'Overwrite current Price Breaks?'}) then Exit;

    if TUniMenuItem(Sender).tag <> 0 then
      ExecuteCommandFmt('delete from arinvt_breaks where arinvt_id = %f and NVL(buying, ''N'') = ''Y''', [nArinvtId]);

    ExecuteCommandFmt('insert into arinvt_breaks ' +
              '(arinvt_id, '               +
              'quan, '                     +
              'price_date, '               +
              'BUYING, '                   +
              'effect_date) '              +
              'select '                    +
              '%f, '                       +
              'quan, '                     +
              'price_date, '               +
              '''Y'', '                    +
              'effect_date '               +
              'from arinvt_breaks '        +
              'where arinvt_id = %d '      +
              '  and NVL(buying, ''N'') = ''Y'' ' +
              '  and NVL(deactive_date, trunc(sysdate) + 10) > Trunc(sysdate) ' +
              '  and NVL(effect_date, trunc(sysdate) - 10) <= Trunc(sysdate) ' , [nArinvtId, TUniMenuItem(Sender).tag]);

    Refresh;
    // First;
    Close;
    Open;
    while not eof do
    begin
      if FieldByName('QUAN').asInteger = 0 then
         begin
           if TUniMenuItem(Sender).tag > 0 then
              S:= Format('One of the price breaks quantities of the component ''%s'' is zero', [ SelectValueByID( 'itemno', 'arinvt', TUniMenuItem(Sender).tag )])
           else
              S:= 'One of the existing price breaks quantities is zero';
           IQWarning( Format('Encountered error while calculating blend ''%s'' price breaks.'#13#13+
                             '%s, modify or delete the price break and re-calculate.',
                             [ SelectValueByID( 'itemno', 'arinvt', nArinvtId ),
                               S ]));
         end
      else
         begin
           Edit;
           FieldByName('QPRICE').asFloat := GetPrice(FieldByName('QUAN').asInteger, nId );
           AArinvt_BreaksID:= FieldByName('ID').asFloat;  {Delphi is losing position after POST}
           Post;
           Locate('ID', AArinvt_BreaksID, []);
         end;
      Next;
    end;
    Refresh;
    First;
  end;
  if DBase.InTransaction then with DBase do
  begin
    Commit;
    StartTransaction;
  end;
end;

function TSndBL.GetPrice(nQty:Integer; nSndOpId:Real):Real;
var
  nPrice  :Real;
  nTotQty :Integer;
  AQty:Real;
  ACurrencyId:Real;
begin
  Result := 0;
  nTotQty := nQty;
  with TblOpMat do
  try
    GridMaterials.DataSource := nil;
    First;
    while not eof do
    begin
      ACurrencyId := 0;
      if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
      begin
        ACurrencyId := SelectValueAsFloat('select currency_id from iqsys where rownum < 2');
        if SelectValueFmtAsFloat('select id from arinvt_breaks where arinvt_id = %f and currency_id = %f and NVL(buying, ''N'') = ''Y'' ' +
                     'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500)',
                        [FieldByName('ARINVT_ID').asFloat, ACurrencyId]) = 0 then
          ACurrencyId := 0;
      end;

      AQty   := nTotQty * FieldByName('PTSPER_DISP').asFloat/100;
      nPrice := GetPriceBreak( AQty, FieldByName('ARINVT_ID').asFloat, 'ARINVT_ID', 'ARINVT_BREAKS', 'Y', ACurrencyId);
      Result :=  Result + nPrice * AQty;
      Next;
    end;
    Result := Result/nTotQty;
  finally
    GridMaterials.DataSource := SrcOpMat;
  end;
end;
(*
procedure TSndBL.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;  // nothing
  if Button = nbInsert then
     if bbtnEditBlendInv.Enabled then  {Snd_BLQ sets enabled to false on the startup and resets back to true}
        bbtnEditBlendInv.Click;
end;

procedure TSndBL.GridMaterialsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if not (gdSelected in State) then
    with GridMaterials.Canvas do
      if Column.ReadOnly then Brush.Color:= clBtnFace else Brush.Color:= clWindow;

  GridMaterials.DefaultDrawColumnCell( Rect, DataCol, Column, State );
end;
*)
procedure TSndBL.AssignMaterialGridEditMethod( AUse_Let_Down: string );
begin

  (* TODO -ombaral -cWebIQ : Check dependecies
  with IQColumnByName( GridMaterials, 'ptsper_disp' ) do
    ReadOnly:= AUse_Let_Down = 'Y';

  with IQColumnByName( GridMaterials, 'let_down_ratio' ) do
    ReadOnly:= AUse_Let_Down <> 'Y';

  with TblOpMat do
  begin
    FieldByName('ptsper_disp').Required:= AUse_Let_Down <> 'Y';
    FieldByName('let_down_ratio').Required:= AUse_Let_Down = 'Y';
  end;

  GridMaterials.Refresh;

  *)
end;

procedure TSndBL.TblSndOpAfterScroll(DataSet: TDataSet);
begin
  AssignMaterialGridEditMethod( TblSndOp.FieldByName('use_let_down_ratio').asString );
end;

procedure TSndBL.TblSndOpAfterPost(DataSet: TDataSet);
begin
  inherited;
  TblSndOpAfterScroll( DataSet );
end;

procedure TSndBL.TblOpMatAfterPost(DataSet: TDataSet);
begin
  if TblSndOp.FieldByName('use_let_down_ratio').asString = 'Y' then
     ExecuteCommandFmt('begin SndOp_Misc.Assign_PtsPer_Based_LD_Ratio( %f ); end;', [ TblSndOp.FieldByName('ID').asFloat ]);
  TblOpMat.Refresh;
end;

procedure TSndBL.TblOpMatAfterDelete(DataSet: TDataSet);
begin
  fFormStarted:= True;
  TblOpMatAfterPost( DataSet );
end;

procedure TSndBL.SBCalcAllClick(Sender: TObject);
var
  AId :Real;
  AMenuItem:TUniMenuItem;
  HMsg:TPanelMesg;
begin
  if not IqConfirmYN(sndop_rscstr.cTXT0000026 {'Calculate Price Breaks for all blends?'}) then
     Exit;

  ACalcAll := True;
  HMsg:= hPleaseWait('');
  with TblSndop do
  try
    GridBlendQtyBreaks.DataSource.DataSet.DisableControls;
    DisableControls;
    AId:= FieldByname('id').asfloat;
    First;
    while not eof do
    begin
      HMsg.Mesg:= Format(sndop_rscstr.cTXT0000027 {'Processing Operation #, %s.'}, [FieldByName('opno').asString]);
      if FieldByName('arinvt_id').asFloat <> 0 then
      begin
        AMenuItem := GetMenuItem;
        if Assigned(AMenuItem) then
          ClickOnpmBlends(AMenuItem);
      end;
      Next;
    end;
    Locate('ID', aId, []);
  finally
    GridBlendQtyBreaks.DataSource.DataSet.EnableControls;
    TblSndop.EnableControls;
    HMsg.Free;
    ACalcAll := False;
  end;
end;


function TSndBL.GetMenuItem:TUniMenuItem;
var
  I:Integer;
  AMax:Real;
begin
  pmBlendsPopup(nil);
  if AMenuItemPosition = -1 then
    Result := nil
  else
    Result := pmBlends.Items[AMenuItemPosition];
end;


procedure TSndBL.wwDBComboDlgSPGCustomDlg(Sender: TObject);
begin
  inherited;  // n

  if not IQConfirmYN( sndop_rscstr.cTXT0000052 {'Are you sure you want to recalculate SPG?'}) then
     EXIT;

  TblSndOp.CheckBrowseMode;
  TblOpmat.CheckBrowseMode;
  IQAssert( TblSndOp.FieldByName('ARINVT_ID').asFloat > 0, sndop_rscstr.cTXT0000053 {'Blend item is undefined - operation aborted'});

  ExecuteCommandFmt('update arinvt                                                   '+
            '   set spg = ( select sum(opmat.ptsper_disp / 100 * arinvt.spg) '+
            '                 from opmat, arinvt                             '+
            '                where opmat.sndop_id = %f                       '+
            '                  and opmat.arinvt_id = arinvt.id )             '+
            ' where id = %f                                                  ',
            [ TblSndOp.FieldByName('ID').asFloat,
              TblSndOp.FieldByName('ARINVT_ID').asFloat ]);

  RefreshDataSetByID( TblSndOp );
end;

end.
