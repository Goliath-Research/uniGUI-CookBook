unit FrmCostInvolved;

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
  Mask,
//  IQMS.Common.UserMessages,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
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
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  IQUniGrid,
  uniMainMenu, uniGUIFrame;

type
  TFrmCostInvolvedCalcCopy = class(TUniForm)
    Panel1: TUniPanel;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    GroupBox1: TUniGroupBox;
    SrcArinv: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtITEMNO: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtEPLANT_ID: TBCDField;
    StatusBar1: TUniStatusBar;
    IQAbout1: TIQWebAbout;
    btnRecalc: TUniButton;
    Panel3: TUniPanel;
    Panel5: TUniPanel;
    chkNetChange: TUniCheckBox;
    PnRight01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft02: TUniPanel;
    PnlClient03: TUniPanel;
    Splitter2: TUniSplitter;
    PnlClient01: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label4: TUniLabel;
    Label6: TUniLabel;
    Label8: TUniLabel;
    edItem: TUniDBEdit;
    edDesc: TUniDBEdit;
    edExtDesc: TUniDBEdit;
    Label5: TUniLabel;
    Label7: TUniLabel;
    Label9: TUniLabel;
    edClass: TUniDBEdit;
    edRev: TUniDBEdit;
    edEplant: TUniDBEdit;
    Panel6: TUniPanel;
    gboxInvolved: TUniGroupBox;
    Panel2: TUniPanel;
    SrcInvolved: TDataSource;
    QryInvolved: TFDQuery;
    QryInvolvedARINVT_ID: TBCDField;
    QryInvolvedITEMNO: TStringField;
    QryInvolvedDESCRIP: TStringField;
    QryInvolvedCLASS: TStringField;
    QryInvolvedREV: TStringField;
    QryInvolvedEPLANT_ID: TBCDField;
    wwDBGrid: TIQUniGridControl;
    QryInvolvedMAX_LEVEL: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    ChkDisablePIT: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure chkNetChangeClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure btnRecalcClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChkDisablePITClick(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FCalculated: Boolean;
    procedure InitVars;
//    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure Recalc_Involved;
    procedure RollOver_Involved;
    procedure SetStatusText(S: string);
    function GetItemsInvolvedCount: Real;
    property StatusText: string write SetStatusText;
    procedure Recalc_RollOver_NetChange;
  public
    { Public declarations }
    //constructor Create(  AArinvt_ID: Real );
    class function Execute(  AArinvt_ID: Real ): Boolean;
    class function IsMfgItem( AArinvt_ID: Real ): Boolean;
    class function IsFutureCostExist( AArinvt_ID: Real ): Boolean;
    class function IsSoftBlend( AArinvt_ID: Real ): Boolean;
  end;


implementation

{$R *.DFM}

uses
 // FrmCost,
  inv_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
//  IQSecIns,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  System.Variants,
  IQMS.Common.DataConst ;

class function TFrmCostInvolvedCalcCopy.Execute(  AArinvt_ID: Real ): Boolean;
var
  Frm  : TFrmCostInvolvedCalcCopy;
  ACheckValue: Boolean;
begin
  Frm  := TFrmCostInvolvedCalcCopy.Create(UniGUIApplication.UniApplication);
  Frm.FArinvt_ID:= AArinvt_ID;

//  IQRegFormRead( self, [ self, PnlLeft01, PnlLeft02, PnRight01, wwDBGrid ]);
  Frm.ChkDisablePIT.Checked := SelectValueAsString('select NVL(DONT_ADJ_UNPOSTED_PIT, ''N'') from iqsys2 where rownum < 2') = 'Y';
 if IQRegBooleanScalarRead( Frm, 'RollNetChange', ACheckValue ) then
  try
    Frm.chkNetChange.OnClick:= NIL;
    Frm.chkNetChange.Checked:= ACheckValue;
  finally
    Frm.chkNetChange.OnClick:= Frm.chkNetChangeClick;
  end;

  Frm.QryArinvt.Close;
  IQSetTablesActive( TRUE, Frm );

  Frm.InitVars;

  Result:= Frm.ShowModal = mrOK;
end;

procedure TFrmCostInvolvedCalcCopy.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCostInvolvedCalcCopy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  IQRegFormWrite( self, [ self, PnlLeft01, PnlLeft02, PnRight01, wwDBGrid ]);
  IQRegBooleanScalarWrite( self, 'RollNetChange', chkNetChange.Checked );
end;

procedure TFrmCostInvolvedCalcCopy.FormShow(Sender: TObject);
begin
  //EnsureSecurityInspectorOnTopOf( self );
end;

//procedure TFrmCostInvolvedCalcCopy.IQNotify( var Msg: TMessage );
//begin
//  btnRecalc.Click;
//end;

procedure TFrmCostInvolvedCalcCopy.InitVars;
begin
end;

procedure TFrmCostInvolvedCalcCopy.btnOKClick(Sender: TObject);
begin
  {'About to recalculate and roll over cost elements of all the items involved or affected by, %s, or its consumed items.'#13#13+
   'Continue?'}
  if not IQConfirmYN(Format(inv_rscstr.cTXT0000037, [ SelectValueByID('RTrim(descrip)', 'arinvt', FArinvt_ID) ])) then
     EXIT;

  if not FCalculated then
     btnRecalc.Click;        // recalc what items are involved

  if not chkNetChange.Checked then
     begin
       Recalc_Involved;           {recalc cost of top most parents}
       RollOver_Involved;         {then roll them all over}
     end
  else
     Recalc_RollOver_NetChange;   {recalc every parent and roll over 1 at a time based on arinvt_elements only w/o recalc the children}

  ModalResult:= mrOK;
end;

procedure TFrmCostInvolvedCalcCopy.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('id').Value := FArinvt_ID;
end;

class function TFrmCostInvolvedCalcCopy.IsMfgItem( AArinvt_ID: Real ): Boolean;
begin
  Result:= SelectValueByID( 'standard_id', 'arinvt', AArinvt_ID ) > 0;
end;

class function TFrmCostInvolvedCalcCopy.IsFutureCostExist( AArinvt_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select id from arinvt_cost_tmp where arinvt_id = %f and rownum < 2', [ AArinvt_ID ]) > 0;
end;

class function TFrmCostInvolvedCalcCopy.IsSoftBlend( AArinvt_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select id from sndop where arinvt_id = %f and rownum < 2', [ AArinvt_ID ]) > 0;
end;

procedure TFrmCostInvolvedCalcCopy.SetStatusText( S: string );
begin
//  StatusBar1.SimpleText:= S;
  StatusBar1.Update;
end;

procedure TFrmCostInvolvedCalcCopy.Recalc_Involved;
var
  I: Integer;
  ACost_Calc_Batch: Real;
  Qry: TFDQuery;
begin
  try
    ACost_Calc_Batch:= GetNextSequenceNumber('S_ARINVT_COST_CALC_BATCH');

    {assign items that must be skipped during recalc - main arinvt id and any consumed by it or its children}
    ExecuteCommandFmt('begin inv_cost.assign_skipped_arinvt( %f ); end;', [ FArinvt_ID ]);

    {recalc top parents!}
    Qry:= TFDQuery.Create( nil );
    try
      Qry.ConnectionName := cnstFDConnectionName;
//      Qry.DataBaseName:= 'IQ';
      Qry.SQL.Add('select a.arinvt_id, c.descrip, c.standard_id '+
                  '  from gtt_calc_cost_items_involved a,       '+
                  '       arinvt c                              '+
                  ' where a.max_level = 0                       '+
                  '   and a.arinvt_id = c.id                    '+
                  ' order by a.arinvt_id                        ');
      Qry.Open;
      while not Qry.Eof do
      begin
        StatusText:= Format(inv_rscstr.cTXT0000040 {'Calculating future cost of %s ...'}, [ Qry.FieldByName('descrip').asString ]);

//        TFrmCostCalc(self.Owner).RecalcCostOf( Qry.FieldByName('arinvt_id').asFloat,       // AArinvt_ID,
//                                               Qry.FieldByName('standard_id').asFloat,     // AStandard_ID
//                                               ACost_Calc_Batch );                         // Optimization
//        Qry.Next;
        Application.ProcessMessages();
      end;
    finally
      Qry.Free;
    end;
  finally
    ExecuteCommand('begin inv_cost.clear_skipped_arinvt; end;');
  end;
end;

procedure TFrmCostInvolvedCalcCopy.RollOver_Involved;
var
  I: Integer;
  AGLPrepost_Cycle_ID: Real;
  Qry: TFDQuery;
begin
  if SelectValueAsString('select NVL(std_cost_posting, ''Y'') from  iqsys where rownum < 2') = 'Y' then
  begin
    if SelectValueAsFloat('select count(start_date) from glperiods where Trunc(sysdate) between start_date and end_date and GL.CheckGLYearEplant(id) = 1') = 0 then
      raise exception.create(inv_rscstr.cTXT0000158);
  end;

  AGLPrepost_Cycle_ID:= 0;
  if GetItemsInvolvedCount() > 0 then
     AGLPrepost_Cycle_ID:= GetNextID('GLPrepost_Cycle');

  Qry:= TFDQuery.Create( nil );
  try
    Qry.ConnectionName := cnstFDConnectionName;
//    Qry.DataBaseName:= 'IQ';
    Qry.SQL.Add('select a.arinvt_id, c.descrip          '+
                '  from gtt_calc_cost_items_involved a, '+
                '       arinvt c                        '+
                ' where a.arinvt_id = c.id              '+
                ' order by a.arinvt_id                  ');
    Qry.Open;
    while not Qry.Eof do
    begin
      StatusText:= Format(inv_rscstr.cTXT0000041 {'Updating standard cost of %s ...'}, [ Qry.FieldByName('descrip').asString ]);

//      TFrmCostCalc(self.Owner).RollTmpToStd( Qry.FieldByName('arinvt_id').asFloat, AGLPrepost_Cycle_ID );
//
      Qry.Next;
      Application.ProcessMessages();
    end;
  finally
    Qry.Free;
  end;
end;


procedure TFrmCostInvolvedCalcCopy.Recalc_RollOver_NetChange;
var
  I: Integer;
  ACost_Calc_Batch   : Real;
  AGLPrepost_Cycle_ID: Real;
  Qry: TFDQuery;
begin
  AGLPrepost_Cycle_ID:= 0;
  if GetItemsInvolvedCount() > 0 then
     AGLPrepost_Cycle_ID:= GetNextID('GLPrepost_Cycle');

  try
    ACost_Calc_Batch:= GetNextSequenceNumber('S_ARINVT_COST_CALC_BATCH');

    {assign items that must be skipped during recalc - main arinvt id and any consumed by it or its children}
    ExecuteCommandFmt('begin inv_cost.assign_skipped_arinvt( %f ); end;', [ FArinvt_ID ]);

    {recalc and roll over as you go. The grid is sorted so that the highest bom levels are on top.}
    Qry:= TFDQuery.Create( nil );
    try
      Qry.ConnectionName := cnstFDConnectionName;
//      Qry.DataBaseName:= 'IQ';
      Qry.SQL.Add('select a.arinvt_id, c.descrip, c.standard_id '+
                  '  from gtt_calc_cost_items_involved a,       '+
                  '       arinvt c                              '+
                  ' where a.arinvt_id = c.id                    '+
                  ' order by a.max_level desc, a.arinvt_id      ');  // note how higher max_level items are getting processed first
      Qry.Open;
      while not Qry.Eof do
      begin
        StatusText:= Format(inv_rscstr.cTXT0000042 {'Calculating future cost of %s ...'}, [ Qry.FieldByName('descrip').asString  ]);
//        TFrmCostCalc(self.Owner).RecalcCostOf( Qry.FieldByName('arinvt_id').asFloat,       // AArinvt_ID,
//                                               Qry.FieldByName('standard_id').asFloat,     // AStandard_ID
//                                               ACost_Calc_Batch,                           // Optimization
//                                               0 );                                        // ARecalc_Sub = 0 meaning we are going based on arinvt_elements and w/o recalc of the children
        {roll over}
        StatusText:= Format(inv_rscstr.cTXT0000041 {'Updating standard cost of %s ...'}, [ Qry.FieldByName('descrip').asString ]);
//        TFrmCostCalc(self.Owner).RollTmpToStd( Qry.FieldByName('arinvt_id').asFloat, AGLPrepost_Cycle_ID );

        Qry.Next;
        Application.ProcessMessages();
      end;
    finally
      Qry.Free;
    end;
  finally
    ExecuteCommand('begin inv_cost.clear_skipped_arinvt; end;');
  end;
end;


procedure TFrmCostInvolvedCalcCopy.chkNetChangeClick(Sender: TObject);
begin
//  PostMessage( Handle, iq_Notify, 0, 0 );   { LoadInvolved }
end;

procedure TFrmCostInvolvedCalcCopy.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCostInvolvedCalcCopy.btnRecalcClick(Sender: TObject);
begin
  chkNetChange.Enabled:= FALSE;
  FCalculated:= FALSE;
  QryInvolved.Close;
  wwDBGrid.Color:= clBtnFace; wwDBGrid.Update;
  try
    // IQMS.Common.StringUtils.BoolToYN( chkNetChange.Checked )
    ExecuteCommandFmt('begin                                                       '+
              '  inv_cost_calc_misc.populate_items_involved( %f, ''%s'' ); '+
              'end;                                                        ',
              [ FArinvt_ID,
                IQMS.Common.StringUtils.BoolToYN( chkNetChange.Checked )]);

    gboxInvolved.Caption:= Format(inv_rscstr.cTXT0000039 {' Items Involved (%d) '}, [ Trunc( GetItemsInvolvedCount())]);
    QryInvolved.Open;
    FCalculated:= TRUE;
    wwDBGrid.Color:= clWindow;
  finally
    chkNetChange.Enabled:= TRUE;
    StatusText:= '';
    wwDBGrid.Update;
  end;
end;

procedure TFrmCostInvolvedCalcCopy.ChkDisablePITClick(Sender: TObject);
begin
  if ChkDisablePIT.Checked then
    ExecuteCommand('update iqsys2 set DONT_ADJ_UNPOSTED_PIT = ''Y''')
  else
    ExecuteCommand('update iqsys2 set DONT_ADJ_UNPOSTED_PIT = ''N''');
end;

function TFrmCostInvolvedCalcCopy.GetItemsInvolvedCount: Real;
begin
  Result:= SelectValueAsFloat('select count(*) from gtt_calc_cost_items_involved');
end;


end.
