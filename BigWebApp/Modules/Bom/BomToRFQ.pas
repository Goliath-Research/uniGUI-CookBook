unit BomToRFQ;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.About,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniImageList,
  uniTreeView,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, uniDateTimePicker, uniDBDateTimePicker, Vcl.ComCtrls;

type
  TTVCargo = class
    sStandard_ID         : Real;
    sFutureQuote_ID      : Real;
    sRfqNo               : String;
    sUpdate_Comp_Pricing : boolean;
    sUpdate_StdCost      : boolean;
    sDueDate             : TDateTime;
    sRev                 : Integer;
    sChecked             : boolean;

    constructor Create(aStandard_ID         : Real;
                       aFutureQuote_ID      : Real;
                       aRfqNo               : String;
                       aUpdate_Comp_Pricing : boolean;
                       aUpdate_StdCost      : boolean;
                       aDueDate             : TDateTime;
                       aRev                 : Integer;
                       aChecked             : boolean);

  end;


type
  TFrmBOMToRFQ = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel5: TUniPanel;
    sbtnExpand: TUniSpeedButton;
    sbtnCollapse: TUniSpeedButton;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnConvert: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    IQAbout1: TIQWebAbout;
    Convert1: TUniMenuItem;
    PnlTree: TUniPanel;
    Bevel1: TUniPanel;
    TV: TUniTreeView;
    Splitter1: TUniSplitter;
    sbEditCtrls: TUniScrollBox;
    PnlDetail: TUniPanel;
    PnlBOM: TUniPanel;
    PnlClient01: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label7: TUniLabel;
    Label9: TUniLabel;
    PnlClient02: TUniPanel;
    CheckBox1: TUniCheckBox;
    Edit1: TUniEdit;
    Edit2: TUniEdit;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    CheckBox2: TUniCheckBox;
    ImageList1: TUniImageList;
    Contents1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TUniTreeNode);
    procedure TVChanging(Sender: TObject; Node: TUniTreeNode;
      var AllowChange: Boolean);
    procedure TVGetImageIndex(Sender: TObject; Node: TUniTreeNode);
    procedure BtnConvertClick(Sender: TObject);
    procedure sbtnExpandClick(Sender: TObject);
    procedure sbtnCollapseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FStandardId:Real;
    FQuoteId:Real;
    FMfgno:String;
    FAbsoluteIndex : Integer;
    procedure LoadBOMToTreeView;
    procedure ClearTreeView;
    procedure AddChildren(aId:Real; Node:TUniTreeNode);
    function CheckAllTVItems:boolean;
    procedure GetCaption;
    function Validate(Node: TUniTreeNode):String;
    procedure ConvertBomToQuote;
    procedure SetQuoteId(const Value: Real);
    procedure SetStandardID(const Value: Real);

  public
    { Public declarations }

    property StandardID: Real read FStandardID write SetStandardID;
    property QuoteId: Real read FQuoteId write SetQuoteId;
  end;

function DoBOMToRFQ(aStandardID:Real; aQuoteId:Real = 0): boolean;


implementation

uses
  bom_rscstr,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  bom_share;

{$R *.dfm}


constructor TTVCargo.Create(aStandard_ID         : Real;
                            aFutureQuote_ID      : Real;
                            aRfqNo               : String;
                            aUpdate_Comp_Pricing : boolean;
                            aUpdate_StdCost      : boolean;
                            aDueDate             : TDateTime;
                            aRev                 : Integer;
                            aChecked             : boolean);

begin
  sStandard_ID         := aStandard_ID        ;
  sFutureQuote_ID      := aFutureQuote_ID     ;
  sRfqNo               := aRfqNo              ;
  sUpdate_Comp_Pricing := aUpdate_Comp_Pricing;
  sUpdate_StdCost      := aUpdate_StdCost     ;
  sDueDate             := aDueDate            ;
  sRev                 := aRev                ;
  sChecked             := aChecked            ;
end;

function DoBOMToRFQ(aStandardID:Real; aQuoteId:Real = 0): boolean;
var
  LFrmBOMToRFQ : TFrmBOMToRFQ;
begin
  Result := false;
  LFrmBOMToRFQ := TFrmBOMToRFQ.Create( uniGUIApplication.UniApplication );
  LFrmBOMToRFQ.FStandardID := aStandardID;
  LFrmBOMToRFQ.FQuoteId := aQuoteId;
  Result := LFrmBOMToRFQ.ShowModal = MROK;
end;

procedure TFrmBOMToRFQ.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmBOMToRFQ.GetCaption;
begin
  FMfgno := SelectValueFmtAsString('select mfgno from standard where id = %f', [FStandardID]);
  Caption := Format(bom_rscstr.cTXT0000026 , [FMfgno]);
end;


procedure TFrmBOMToRFQ.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBOMToRFQ.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmBOM{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmBOMToRFQ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TV.OnChange := nil;
  ClearTreeView;
  IQRegFormWrite( self, [self, PnlTree, PnlLeft01]);
end;

procedure TFrmBOMToRFQ.LoadBOMToTreeView;
var
  CurrentNode:TUniTreeNode;
  nStandardId, nArcustoId, nEPlant_Id : Real;
  cMfgNo:String;
  aRFQ:String;
begin
  ClearTreeView;
  GetCaption;
  aRFQ := GetNextRFQ(''); {bom_share.pas}
  CurrentNode := TV.Items.Add(TV.Selected, Format(bom_rscstr.cTXT0000027, [FMfgno]));
  CurrentNode.Data:= TTVCargo.Create( FStandardID, 0, aRFQ, false, false, 0, 0, false );
//  AddAttachedMaterial(FId, CurrentNode);
  AddChildren(FStandardID, CurrentNode);
  try
    TV.OnChange := nil;
    TV.FullExpand;
    TV.Items[0].Selected := True;
    FAbsoluteIndex := 0;
  finally
    Screen.Cursor := crDefault;
    { TODO -oathite -cWebConvert : TuniTreeView does not have event OnChanging
    TV.OnChanging := TVChanging;
    }
  end;
end;

procedure TFrmBOMToRFQ.sbtnCollapseClick(Sender: TObject);
begin
  TV.FullCollapse;
end;

procedure TFrmBOMToRFQ.sbtnExpandClick(Sender: TObject);
begin
  with TV do
  begin
    FullExpand;
    Selected:= Items.GetFirstNode;
    Top := Selected.SelectedIndex;
  end;

end;

procedure TFrmBOMToRFQ.SetQuoteId(const Value: Real);
begin
  FQuoteId := Value;
end;

procedure TFrmBOMToRFQ.SetStandardID(const Value: Real);
begin
  FStandardID := Value;
end;

procedure TFrmBOMToRFQ.TVChange(Sender: TObject; Node: TUniTreeNode);
begin
  if SelectValueAsString('select NVL(IS_QUOTE_DUE_DATE_MANDATORY, ''N'') from qparams where rownum < 2') = 'N' then
  begin
    Label9.Visible := false;
    wwDBDateTimePicker1.Visible := false;
  end
  else
  begin
    Label9.visible := true;
    wwDBDateTimePicker1.visible := true;
  end;


  Edit1.Text               := TTVCargo(Node.Data).sRfqNo;
  Edit2.Text               := FloatToStr(TTVCargo(Node.Data).sRev);
  CheckBox1.checked        := TTVCargo(Node.Data).sUpdate_Comp_Pricing;
  CheckBox2.checked        := TTVCargo(Node.Data).sUpdate_StdCost;
  wwDBDateTimePicker1.DateTime := TTVCargo(Node.Data).sDueDate;
end;

procedure TFrmBOMToRFQ.TVChanging(Sender: TObject; Node: TUniTreeNode; var AllowChange: Boolean);
var
  ARfq:String;
  ARev:Integer;
  L:Real;
  AError:String;
begin
  try
    AError := Validate(TUniTreeNode(Sender));

   if AError <> '' then
   begin
    AllowChange := false;
    IQWarning( AError );
   end
   else
   begin
    AllowChange := true;
    ARfq := Edit1.Text;
    ARev := StrToInt(Edit2.Text);
    TTVCargo(TV.Selected.Data).sRfqNo := ARfq;
    TTVCargo(TV.Selected.Data).sRev   := ARev;
    TTVCargo(TV.Selected.Data).sUpdate_Comp_Pricing := CheckBox1.checked;
    TTVCargo(TV.Selected.Data).sUpdate_StdCost := CheckBox2.checked;
    if (wwDBDateTimePicker1.Visible) then
      TTVCargo(TV.Selected.Data).sDueDate := wwDBDateTimePicker1.DateTime;

    TTVCargo(TV.Selected.Data).sChecked := true;

    TV.Refresh;
   end;
  except
    on E:Exception do
    begin
      AllowChange := False;
      Application.ShowException(E);
    end;
  end;
end;

function TFrmBOMToRFQ.Validate(Node: TUniTreeNode):String;
var
  AResult:String;
  ARfq:String;
  ARev:Integer;
  L:Real;
begin
  AResult := '';
  if Edit1.Text = '' then
    AResult := 'RFQ # must be entered';

  if AResult = '' then
  begin
    if (wwDBDateTimePicker1.Visible) and (wwDBDateTimePicker1.DateTime = 0) then
      AResult := 'Quote Due Date must be entered.';
  end;

  if AResult = '' then
  try
    if not ((StrToInt(Edit2.Text) >= 0 ) and (StrToFloat(Edit2.Text) <= 999)) then
      AResult := 'Quote Rev is a number between 0 - 999.';
  except
    AResult := Format('Invalid Rev. %s', [ Edit2.Text ]);
  end;

  if AResult = '' then
  begin
    ARev := StrToInt(Edit2.Text);
    ARfq := Edit1.Text;

    if SelectValueFmtAsFloat('select id from quote where rfq = ''%s'' and NVL(quote_rev,0) = %d', [ ARfq, ARev ]) > 0 then
      AResult := Format('RFQ # %s / Rev %d already exists', [ ARfq, ARev ]);
  end;

  if AResult = '' then
  begin
    L:= SelectValueAsFloat( 'select data_length from user_tab_columns where table_name = ''QUOTE'' and column_name = ''RFQ''');
    if Length(ARfq) > L then
      AResult := Format('RFQ # length must not exceed %.0f characters.', [ L ]);
  end;
  Result := AResult;
end;


procedure TFrmBOMToRFQ.TVGetImageIndex(Sender: TObject; Node: TUniTreeNode);
begin
  with Node do
    if TTVCargo(Node.Data).sChecked then
    begin
      ImageIndex    := 3;
      SelectedIndex := 3;
    end
    else
    begin
      ImageIndex    := 1;
      SelectedIndex := 1;
    end

end;

procedure TFrmBOMToRFQ.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self, PnlTree, PnlLeft01]);
  LoadBOMToTreeView;
end;

procedure TFrmBOMToRFQ.AddChildren(aId:Real; Node:TUniTreeNode);
var
  CurrentNode: TUniTreeNode;
  aQry:TFDQuery;
  aArInvtId:Real;
  aMfgNo:String;
  aRFQ:String;
begin
  aQry := TFDQuery.Create(nil);
  try
    aQry.Connection := UniMainModule.FDConnection1;
    aQry.Sql.Add(IQFormat('select distinct a.standard_id    ' +
                     '  from partno p,                 ' +
                     '       ptoper o,                 ' +
                     '       opmat t,                  ' +
                     '       arinvt a                  ' +
                     ' where p.standard_id = %f        ' +
                     '   and o.partno_id = p.id        ' +
                     '   and t.sndop_id = o.sndop_id   ' +
                     '   and t.arinvt_id = a.id', [aId]));
    aQry.Open;
    while not aQry.eof do
    begin
      aMfgno := SelectValueFmtAsString('select mfgno from standard where id = %f', [aQry.FieldByName('standard_id').asFloat]);
      if aMfgno <> '' then
      begin
        aRFQ := GetNextRFQ(''); {bom_share.pas}
        CurrentNode := TV.Items.AddChild(Node, Format(bom_rscstr.cTXT0000027, [aMfgno]));
        CurrentNode.Data:= TTVCargo.Create( aQry.FieldByName('standard_id').asFloat, 0, aRFQ, false, false, 0, 0, false);
        AddChildren(aQry.FieldByName('standard_id').asFloat, CurrentNode);
      end;
      aQry.Next;
    end;
  finally
    aQry.Free;
  end;
end;


procedure TFrmBOMToRFQ.btnCancelClick(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TFrmBOMToRFQ.BtnConvertClick(Sender: TObject);
var
  AllowChange:Boolean;
  DBase:TFDConnection;
begin
   if not CheckAllTVItems then exit;
   if not IqConfirmYN(bom_rscstr.cTXT0000029) then exit;
   try
     DBase:= UniMainModule.FDConnection1;
     DBase.StartTransaction;
     ExecuteCommand('truncate table GTT_BOM_TO_QUOTE');
     ConvertBomToQuote;
     ExecuteCommand('truncate table GTT_BOM_TO_QUOTE');
     DBase.Commit;
     IQInformation(bom_rscstr.cTXT0000028);

     Close;
     ModalResult := mrOK;
   except
     begin
       if DBase.InTransaction then
         DBase.RollBack;
       raise;
     end;
   end;
end;


procedure TFrmBOMToRFQ.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmBOMToRFQ.ConvertBomToQuote;
var
  i:Integer;
  AStr:String;
  AQuoteId:Real;
begin
  AQuoteId := FQuoteId;
  try
    for i := 0 to TV.Items.Count - 1 do
    begin
      if i <> 0 then
        AQuoteId := 0;  // Only pass the quote_id from the first item;

      ExecuteCommandFmt( 'begin  bom_to_quote_multi_level.standard_to_quote_wrapper(''%s'',       '+     // rfqno
                 '                                  %f,                              '+     // standard_id
                 '                                  %f,                              '+     // quote_id
                 '                                  %s,                              '+     // v_Update_Comp_Pricing true/false
                 '                                  %s,                              '+     // v_Update_StdCost true/false
                 '                                  To_Date(''%s'', ''MM/DD/RRRR''), '+     // due date
                 '                                  %d );                            '+     // rev
                 'end;',
                 [ TTVCargo(TV.Items[i].Data).sRfqNo,
                   TTVCargo(TV.Items[i].Data).sStandard_id,
                   AQuoteId,
                   IQMS.Common.Numbers.sIIf( TTVCargo(TV.Items[i].Data).sUpdate_Comp_Pricing, 'TRUE', 'FALSE' ),
                   IQMS.Common.Numbers.sIIf( TTVCargo(TV.Items[i].Data).sUpdate_StdCost, 'TRUE', 'FALSE' ),
                   FormatDateTime('mm/dd/yyyy', TTVCargo(TV.Items[i].Data).sDueDate),
                   TTVCargo(TV.Items[i].Data).sRev]);


{
      ExecuteCommandFmt( 'declare                             '+
                 '  v_quote_id number::= 0;          '+
                 '  v_mandatory_due_date varchar2(1); '+
                 'begin                               '+
                 '  v_quote_id number::= %f;          '+
                 '  select nvl(is_quote_due_date_mandatory, ''N'') into v_mandatory_due_date from qparams where rownum < 2;  ' +
                 '  bom_to_quote_multi_level.standard_to_quote( ''%s'',                          '+     // rfqno
                 '                                  %f,                              '+     // standard_id
                 '                                  v_quote_id,                      '+     // quote_id
                 '                                  %s,                              '+     // v_Update_Comp_Pricing true/false
                 '                                  %s,                              '+     // v_Update_StdCost true/false
                 '                                  To_Date(''%s'', ''MM/DD/RRRR''), '+     // due date
                 '                                  %d );                            '+     // rev
                 'end;',
                 [ AQuoteId,
                   TTVCargo(TV.Items[i].Data).sRfqNo,
                   TTVCargo(TV.Items[i].Data).sStandard_id,
                   IQMS.Common.Numbers.sIIf( TTVCargo(TV.Items[i].Data).sUpdate_Comp_Pricing, 'TRUE', 'FALSE' ),
                   IQMS.Common.Numbers.sIIf( TTVCargo(TV.Items[i].Data).sUpdate_StdCost, 'TRUE', 'FALSE' ),
                   FormatDateTime('mm/dd/yyyy', TTVCargo(TV.Items[i].Data).sDueDate),
                   TTVCargo(TV.Items[i].Data).sRev]);
}
      Application.processmessages;
//      exit;
    end;
  finally
    { TODO -oathite -cWebConvert : TuniTreeView does not have event OnChanging
    TV.OnChanging := TVChanging; }
  end;
end;

function TFrmBOMToRFQ.CheckAllTVItems:boolean;
var
  i:Integer;
  AError:String;
  AList:TStringList;
  AllowChange:boolean;
begin
  Result := true;
  TVChanging(nil, nil, AllowChange);
  try
    AList := TStringList.Create;
    TV.OnChange := nil;
    for i := 0 to TV.Items.Count - 1 do
    begin
      TV.Items[i].Selected := True;
      TVChange(TV, TV.Items[i]);
      if AList.IndexOf(TTVCargo(TV.Items[i].Data).sRfqNo) > - 1 then
      begin
        IqWarning(Format('Duplicate RFQ# %s', [TTVCargo(TV.Items[i].Data).sRfqNo]));
        Result := false;
        Exit;
      end
      else
        AList.Add(TTVCargo(TV.Items[i].Data).sRfqNo);

      AError := Validate(TV.Items[i]);
      if AError <> '' then
      begin
        IqWarning(AError);
        Result := false;
        Exit;
      end;
      Application.processmessages;
    end;
  finally
    AList.Free;
    { TODO -oathite -cWebConvert : TuniTreeView does not have event OnChanging
    TV.OnChanging := TVChanging; }
  end;
end;


procedure TFrmBOMToRFQ.ClearTreeView;
var
  i:Integer;
begin
  for i:= TV.Items.Count - 1 downto 0 do with TV.Items[ I ] do
  begin
    if Assigned(Data) then
       TObject(Data).Free;
    TV.Items[ I ].Destroy;
  end;
  TV.Items.Clear;
end;



end.
