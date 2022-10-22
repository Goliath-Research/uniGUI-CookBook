unit LbsK_Dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  MainModule,
  IQMS.WebVcl.AppDef,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmLbsK_Dlg = class(TUniForm)
    StatusBar1: TUniStatusBar;
    AppDef1: TIQWebAppDef;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Edit1: TUniEdit;
    chkRecalcBOM: TUniCheckBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FExist: Real;
    procedure DoAlterLbsKCalculation;
    procedure UpdateStatusBar(cStr:String);
    procedure RecalculateBOM( AStandard_ID: Real );
  public
    { Public declarations }
  end;

function  AlterLbsKCalculationDialog: Boolean;

implementation

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.RegFrm,
  bom_rscstr;

{$R *.DFM}

function AlterLbsKCalculationDialog: Boolean;
var
  LFrmLbsK_Dlg : TFrmLbsK_Dlg;
begin
  LFrmLbsK_Dlg := TFrmLbsK_Dlg.Create( UniGUIApplication.UniApplication );
  LFrmLbsK_Dlg.FExist := SelectValueAsFloat( 'select NVL(lbsk_percent_runner,0) from mfgtype where RTrim(Upper(mfgtype)) = ''INJECTION''');
  // if FExist = 0 then FExist:= 10; // 10-12-2011 Re: Mfg Type - 0% of runner and sprue is not being retained
  LFrmLbsK_Dlg.Edit1.Text:= FloatToStr( LFrmLbsK_Dlg.FExist );

  Result:= (LFrmLbsK_Dlg.ShowModal = mrOk);
end;

procedure TFrmLbsK_Dlg.FormCreate(Sender: TObject);
begin
  AppDef1.MfgType:= 'INJECTION';
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlLeft01]);
end;

procedure TFrmLbsK_Dlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlLeft01]);
end;

procedure TFrmLbsK_Dlg.UpdateStatusBar(cStr:String);
begin
  { TODO : TUniStatusBar doesn't have property simpletext
  StatusBar1.SimpleText:= cStr; }
  StatusBar1.Update;
end;

procedure TFrmLbsK_Dlg.btnOKClick(Sender: TObject);
begin
  DoAlterLbsKCalculation;
  Close;
  ModalResult:= mrOK;
end;

procedure TFrmLbsK_Dlg.DoAlterLbsKCalculation;
var
  S     : string;
  ANew  : Real;
  DB    : TFDConnection;
begin
  S:= Edit1.Text;
  ANew:= StrToFloat( S );
  IQAssert( ANew >= 0, bom_rscstr.cTXT0000013 {'Percentage must be positive number'});
  //if FExist = ANew then
  //   EXIT;

  DB:= UniMainModule.FDConnection1;
  DB.StartTransaction;
  try
    ExecuteCommandFmt('update mfgtype                              ' +
              '   set lbsk_percent_runner = %f             ' +
              ' where Upper(RTrim(mfgtype)) = ''INJECTION''',
              [ ANew ]);

    if FExist <> ANew then
       ExecuteCommandFmt('insert into eventlog( event_time, userid, text, class ) values (sysdate, ''%s'', ''%s'', ''LBSK'')',
                 [ SecurityManager.UserName,
                   Format('LBSK calculations - percent of runner/sprue is altered. Old = %.6f, New = %.6f',
                          [ FExist, ANew ])]);


    if chkRecalcBOM.Checked then
      begin
        ExecuteCommandFmt('insert into eventlog( event_time, userid, text, class ) values (sysdate, ''%s'', ''%s'', ''LBSK'')',
                  [ SecurityManager.UserName, 'LBSK calculations reapplied to all INJECTION BOMs' ]);

        with TFDQuery.Create(NIL) do
        try
          Connection := UniMainModule.FDConnection1;
          {note - exclude ecos}
          SQL.Add('select s.id, s.mfgno');
          SQL.Add('  from standard s, eco e');
          SQL.Add(' where mfg.lookup_mfgtype(s.mfg_type) = ''INJECTION''');
          SQL.Add('   and s.id = e.eco_standard_id(+)');
          SQL.Add('   and e.id is NULL');
          SQL.Add(' order by s.mfgno');
          Open;
          while not Eof do
            begin
              UpdateStatusBar( Format('Proccessing Mfg # %s ...', [ FieldByName('MFGNO').asString ]));

              RecalculateBOM( FieldByName('ID').asFloat );

              Next;
            end;
        finally
          Free;
        end;
      end;

    DB.Commit;
  finally
    if DB.InTransaction then DB.RollBack;
  end;
end;

procedure TFrmLbsK_Dlg.RecalculateBOM( AStandard_ID: Real );
begin
  with AppDef1 do
  begin
    Execute('LBSK', [ AStandard_ID ]);
    ExecuteCommandFmt('update standard       ' +
              '   set LBSK   = %f,   ' +
              '       shotwt = %.6f, ' +
              '       eplant_id = -1 ' +       {-1 keeps eplant_id as is}
              'where id = %f',
              [ ParamByName('v_LBSK').asFloat,
                ParamByName('v_SHOTWT').asFloat,
                AStandard_ID ]);
  end;
end;


end.
