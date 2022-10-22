unit spc_select_run_rules;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel;

type
  TFrmSPCSelectRunRules = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    PnlList: TUniPanel;
    gbRunRules: TUniGroupBox;
    chkRule1: TUniCheckBox;
    chkRule2: TUniCheckBox;
    chkRule3: TUniCheckBox;
    chkRule4: TUniCheckBox;
    chkRule5: TUniCheckBox;
    chkRule6: TUniCheckBox;
    chkRule7: TUniCheckBox;
    lblRule1: TUniLabel;
    lblRule2: TUniLabel;
    lblRule3: TUniLabel;
    lblRule4: TUniLabel;
    lblRule5: TUniLabel;
    lblRule6: TUniLabel;
    lblRule7: TUniLabel;
    PList: TUniPopupMenu;
    SelectAll1: TUniMenuItem;
    UnselectAll1: TUniMenuItem;
    procedure SelectAll1Click(Sender: TObject);
    procedure UnselectAll1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvtID: Real;
    procedure SetPrompt;
    procedure GetList;
    procedure SelectAll(const AChecked: Boolean);
    procedure SetArinvtID(const Value: Real);
  public
    { Public declarations }
   // constructor Create(AOwner: TComponent; AArinvtID: Real);
    procedure SaveList;
    //constructor Create(AOwner: TComponent; AArinvtID: Real);

    property ArinvtID: Real read FArinvtID write SetArinvtID;
  end;

function DoSelectRunRules(AArinvtID: Real): Boolean;

//property ArinvtID : Real write SetArinvtID;

//var
//  FrmSPCSelectRunRules: TFrmSPCSelectRunRules;

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  spc_rscstr;

function DoSelectRunRules(AArinvtID: Real): Boolean;
var
  LFrmSPCSelectRunRules : TFrmSPCSelectRunRules;
begin
  if (Trunc(AArinvtID) = 0) then
    Exit;
 // with TFrmSPCSelectRunRules.Create(AOwner, AArinvtID) do

  LFrmSPCSelectRunRules := TFrmSPCSelectRunRules.Create(uniGUIApplication.UniApplication);
  with LFrmSPCSelectRunRules do
  begin
      FArinvtID := AArinvtID;
      Result := ShowModal = mrOk;
      if Result then
        SaveList;
  end;
end;

{ TFrmSPCSelectRunRules }

//constructor TFrmSPCSelectRunRules.Create(AOwner: TComponent;
//  AArinvtID: Real);
//begin
//  inherited Create(AOwner);
//  FArinvtID := AArinvtID;
//  SetPrompt;
//  GetList;
//end;

procedure TFrmSPCSelectRunRules.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]);
end;

procedure TFrmSPCSelectRunRules.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmSPCSelectRunRules.GetList;
var
  i: Integer;
  s: String;
  sl: TStringList;
begin
  { Run Rules:

    1.) "Any one point beyond control limits."
    2.) "Any two of three sequential points within three standard
    deviations on the same side."
    3.) "Any four of five sequential points beyond two
    standard deviations on the same side."
    4.) "Eight sequential points on one side of the average."
    5.) "Six sequential points in increasing or decreasing order."
    6.) "Fourteen sequential points are alternating up and down."
    7.) "Fifteen sequential points are all within +/- one standard deviation."
  }

  // Initialization
  sl := NIL;

  // Get saved list as string
  s := SelectValueFmtAsString
    ('SELECT run_rules FROM arinvt WHERE id = %.0f',
    [FArinvtID]);
  // Evaluate saved string
  if Trim(s) > '' then
    try
      sl := TStringList.Create;
      Tokenize(s, ['_'], sl); // iqstring
      for i := 0 to sl.Count - 1 do
        begin
          if sl.Strings[i] = '1' then
            chkRule1.Checked := True;
          if sl.Strings[i] = '2' then
            chkRule2.Checked := True;
          if sl.Strings[i] = '3' then
            chkRule3.Checked := True;
          if sl.Strings[i] = '4' then
            chkRule4.Checked := True;
          if sl.Strings[i] = '5' then
            chkRule5.Checked := True;
          if sl.Strings[i] = '6' then
            chkRule6.Checked := True;
          if sl.Strings[i] = '7' then
            chkRule7.Checked := True;
        end;
    finally
      if Assigned(sl) then
        FreeAndNil(sl);
    end
    // If no settings have been saved, then we select all
  else
    SelectAll(True);
end;

procedure TFrmSPCSelectRunRules.SaveList;
var
  s: String;
begin
  s := '_';
  if chkRule1.Checked then
    s := s + '1_';
  if chkRule2.Checked then
    s := s + '2_';
  if chkRule3.Checked then
    s := s + '3_';
  if chkRule4.Checked then
    s := s + '4_';
  if chkRule5.Checked then
    s := s + '5_';
  if chkRule6.Checked then
    s := s + '6_';
  if chkRule7.Checked then
    s := s + '7_';
  ExecuteCommandFmt('UPDATE arinvt'#13 +
    'SET run_rules = ''%s'' '#13 +
    'WHERE id = %.0f',
    [s, FArinvtID]);
end;

procedure TFrmSPCSelectRunRules.SelectAll(const AChecked: Boolean);
var
  i: Integer;
begin
  for i := 0 to gbRunRules.ControlCount - 1 do
    if gbRunRules.Controls[i] is TUniCheckBox then
      TUniCheckBox(gbRunRules.Controls[i]).Checked := AChecked;
end;

procedure TFrmSPCSelectRunRules.SetArinvtID(const Value: Real);
begin
  FArinvtID := Value;
end;

procedure TFrmSPCSelectRunRules.SetPrompt;
var
  A: Variant;
  AItemno, ADescrip, s: String;
begin
  if FArinvtID = 0 then
    Exit;
  A := SelectValueArrayFmt
    ('SELECT itemno, descrip FROM arinvt WHERE id = %.0f',
    [FArinvtID]);
  if System.Variants.VarArrayDimCount(A) = 0 then
    Exit;
  AItemno := A[0];
  ADescrip := A[1];
  s := Format('%s, %s', [Trim(AItemno), Trim(ADescrip)]);

  // 'Please select run rules to apply to item, %s.';
  lblPrompt.Caption := Format(spc_rscstr.cTXT000000698,
    [s]);
end;

procedure TFrmSPCSelectRunRules.SelectAll1Click(Sender: TObject);
begin
  SelectAll(True);
end;

procedure TFrmSPCSelectRunRules.UniFormCreate(Sender: TObject);
begin

  SetPrompt;
  GetList;
end;

procedure TFrmSPCSelectRunRules.UnselectAll1Click(Sender: TObject);
begin
  SelectAll(False);
end;

end.
