unit PM_Info;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
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
  uniButton,
  uniBitBtn,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniComboBox,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker;

type
  TPMinfo = class(TUniForm)
    SrcPmEqmt: TDataSource;
    TblPmEqmt: TFDTable;
    TblPmEqmtID: TBCDField;
    TblPmEqmtEQNO: TStringField;
    TblPmEqmtCLASS: TStringField;
    TblPmEqmtDESCRIP: TStringField;
    TblPmEqmtLOCATION: TStringField;
    PkEQMT: TIQWebHPick;
    PkEQMTID: TBCDField;
    PkEQMTEQNO: TStringField;
    PkEQMTDESCRIP: TStringField;
    PkEQMTCLASS: TStringField;
    PkEQMTLOCATION: TStringField;
    wwQryLocations: TFDQuery;
    wwQryLocationsID: TBCDField;
    wwQryLocationsLOC_DESC: TStringField;
    wwQryLocationsDESCRIP: TStringField;
    wwQryLocationsEPLANT_NAME: TStringField;
    wwQryLocationsDIVISION_ID: TBCDField;
    wwQryLocationsEPLANT_ID: TBCDField;
    TblPmEqmtSERVICE_DATE_OUT: TDateTimeField;
    TblPmEqmtSERVICE_DATE_IN: TDateTimeField;
    PkEQMTEPLANT_ID: TBCDField;
    TblPmEqmtUOM: TStringField;
    PkEQMTPK_HIDE: TStringField;
    TblPmEqmtLOCATIONS_ID: TBCDField;
    PnlButtons: TUniPanel;
    bbtnOK: TUniBitBtn;
    bbtnCancel: TUniBitBtn;
    bbtnNew: TUniBitBtn;
    bbtnPick: TUniBitBtn;
    PnlMain: TUniPanel;
    GroupBox1: TUniGroupBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblEquipmentNumber: TUniLabel;
    lblDescription: TUniLabel;
    lblClass: TUniLabel;
    lblLocation: TUniLabel;
    lblServiceDateOut: TUniLabel;
    lblServiceDateIn: TUniLabel;
    Eqno: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBComboBox1: TUniDBComboBox;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    wwDateTimeServiceOUT: TUniDBDateTimePicker;
    wwDateTimeServiceIN: TUniDBDateTimePicker;
    procedure bbtnCancelClick(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure bbtnNewClick(Sender: TObject);
    procedure bbtnPickClick(Sender: TObject);
    procedure SrcPmEqmtStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblPmEqmtBeforePost(DataSet: TDataSet);
    procedure TblPmEqmtAfterInsert(DataSet: TDataSet);
    procedure PkEQMTBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure TblPmEqmtBeforeOpen(DataSet: TDataSet);
    procedure wwQryLocationsBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FAID: Real;
    { Private declarations }
    procedure CancelEdit;
    procedure PopulatePMClasses;
    procedure SetAID(const Value: Real);
  public
    //constructor Create(AOwner: TComponent; AID: Real);
    { Public declarations }
    property ID : Real write SetAID;
    //constructor Create(AOwner: TComponent; AID: Real);
  end;

function DoPMInfo(var AID: Real): Boolean;

{var
  PMinfo: TPMinfo; }

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  //IQSecIns,
  IQMS.Common.StringUtils,
  pm_schedmsg;

{$R *.DFM}


{function DoPMInfo(var AID: Real): Boolean;
begin
  with TPMinfo.Create(Application, AID) do
    try
      Result := ShowModal = mrOK;
      if Result then
        AID := TblPmEqmt.FieldByName('ID').asFloat;
    finally
      Release;
    end;
end;      }

function DoPMInfo(var AID: Real): Boolean;
var
  PMinfo: TPMinfo;
begin
  PMinfo := TPMinfo.create(UniGUIApplication.UniApplication);
  PMinfo.ID := AID;
  Result := PMinfo.ShowModal = mrOK;
  if Result then
    PMinfo.ID := PMinfo.TblPmEqmt.FieldByName('ID').asFloat;
end;
{ TPMinfo }

{constructor TPMinfo.Create(AOwner: TComponent; AID: Real);
begin
  inherited Create(AOwner);

  IQSetTablesActiveEx(TRUE, self, ''); // iqlib

  IQRegFormRead(self, [self, PnlLeft01]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);

  PopulatePMClasses;

  if not TblPmEqmt.Locate('ID', AID, []) then
    bbtnNewClick(NIL);
end;     }

procedure TPMinfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, PnlLeft01]);
end;

procedure TPMinfo.CancelEdit;
begin
  if TblPmEqmt.State in [dsInsert, dsEdit] then
    TblPmEqmt.Cancel;
end;

procedure TPMinfo.bbtnCancelClick(Sender: TObject);
begin
  CancelEdit;
  ModalResult := mrCancel;
end;

procedure TPMinfo.bbtnOKClick(Sender: TObject);
var
  ID: Real;
begin
  { Prevent duplicated class+eqno }
  ID := SelectValueFmtAsFloat
    ('select id from pmeqmt where RTrim(class) = ''%s'' and RTrim(eqno) = ''%s''',
    [IQMS.Common.StringUtils.FixStr(Trim(DBComboBox1.Text)),
    IQMS.Common.StringUtils.FixStr(Trim(Eqno.Text))]);

  if ID > 0 then
    with TblPmEqmt do
      begin
        if FieldByName('ID').asFloat <> ID then
          begin
            CancelEdit;
            Locate('ID', ID, []);
          end
        else
          CheckBrowseMode;
      end
  else
    if TblPmEqmt.State in [dsInsert, dsEdit] then
    TblPmEqmt.Post;
  ModalResult := mrOK;
end;

procedure TPMinfo.bbtnNewClick(Sender: TObject);
begin
  CancelEdit;
  TblPmEqmt.Append;
  // EqNo.SetFocus;
end;

procedure TPMinfo.bbtnPickClick(Sender: TObject);
var
  DS: TDataSource;
begin
  with PkEQMT do
    if Execute then
      begin
        CancelEdit;
        if TblPmEqmt.Locate('ID', GetValue('ID'), []) then
          { TODO -oysingh -cWeb Convert : no corresponding uni component for the security register. }
          //bbtnOK.Enabled := TRUE and SR.Enabled['bbtnOK'];
      end;
end;

procedure TPMinfo.SetAID(const Value: Real);
begin
  FAID := Value;
end;

procedure TPMinfo.SrcPmEqmtStateChange(Sender: TObject);
begin
 { TODO -oysingh -cWeb Convert : no corresponding uni component for the security register. }
 { with TblPmEqmt do
    case State of
      dsEdit:
        bbtnOK.Enabled := SR.Enabled['bbtnOK'];
      dsInsert:
        bbtnOK.Enabled := SR.Enabled['bbtnOK'];
      dsBrowse:
        bbtnOK.Enabled := FALSE;
    end;  }
end;

procedure TPMinfo.TblPmEqmtBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); { in IQlib }
  if (TblPmEqmtSERVICE_DATE_IN.asDateTime > 0) and
    (TblPmEqmtSERVICE_DATE_OUT.asDateTime = 0)
    or
    (TblPmEqmtSERVICE_DATE_IN.asDateTime = 0) and
    (TblPmEqmtSERVICE_DATE_OUT.asDateTime > 0) then
    raise Exception.Create('Both IN & OUT dates must be specified');

  if (TblPmEqmtSERVICE_DATE_OUT.asDateTime > TblPmEqmtSERVICE_DATE_IN.asDateTime)
  then
    raise Exception.Create('Invalid service dates range');

  if TblPmEqmtLOCATIONS_ID.asFloat > 0 then
    TblPmEqmtLOCATION.asString := SelectValueFmtAsString
      ('select loc_desc from locations where id = %f',
      [TblPmEqmtLOCATIONS_ID.asFloat]);

  if (TblPmEqmtSERVICE_DATE_IN.asDateTime > 0) and
    (TblPmEqmtSERVICE_DATE_OUT.asDateTime > 0) then
    if not pm_schedmsg.DoShowSchedulingConflict(
      TblPmEqmtID.asFloat,
      TblPmEqmtSERVICE_DATE_OUT.asDateTime,
      TblPmEqmtSERVICE_DATE_IN.asDateTime) then
      System.SysUtils.Abort;
end;



procedure TPMinfo.TblPmEqmtAfterInsert(DataSet: TDataSet);
begin
  TblPmEqmtCLASS.value := 'TL';
  TblPmEqmtUOM.asString := 'Cycles';
end;

procedure TPMinfo.PkEQMTBeforeOpen(DataSet: TDataSet);
var
  S: string;
begin
  IQAssignEPlantFilter(DataSet); { pas }

  S := '';
  if DBComboBox1.Text > '' then
    S := Format('Class = ''%s''', [DBComboBox1.Text]);

  // with DataSet as TFDQuery do
  with DataSet do
    begin
      if (Filter > '') and (S > '') then
        Filter := Format('(%s) and (%s)', [Filter, S])
      else if S > '' then
        Filter := S;
      Filtered := Filter > '';
    end;

  // with DataSet as TFDQuery do
  // begin
  // Filtered:= DBComboBox1.Text > '';
  // if Filtered then
  // Filter:= Format('Class = ''%s''', [ DBComboBox1.Text ])
  // else
  // Filter:= '';
  // end;
end;

procedure TPMinfo.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmBOM { HTM } ); { IQMS.Common.HelpHook.pas }
end;

procedure TPMinfo.TblPmEqmtBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet); // pas

end;

procedure TPMinfo.wwQryLocationsBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet); { pas }
end;

procedure TPMinfo.FormShow(Sender: TObject);
begin
{ TODO -oysingh -cWeb Convert : no corresponding uni component for the security register. }
//  EnsureSecurityInspectorOnTopOf(self);

  IQSetTablesActiveEx(TRUE, self, ''); // iqlib

  IQRegFormRead(self, [self, PnlLeft01]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);

  PopulatePMClasses;

  if not TblPmEqmt.Locate('ID', FAID, []) then
    bbtnNewClick(NIL);
end;

procedure TPMinfo.DBComboBox1Change(Sender: TObject);
begin
  Application.ProcessMessages; // let combo box finish
  wwDateTimeServiceOUT.Enabled := DBComboBox1.Text <> 'MT';
  wwDateTimeServiceIN.Enabled := DBComboBox1.Text <> 'MT';
  lblServiceDateOut.Enabled := wwDateTimeServiceOUT.Enabled;
  lblServiceDateIn.Enabled := wwDateTimeServiceIN.Enabled;
end;

procedure TPMinfo.PopulatePMClasses;
begin
  DBComboBox1.Items.Clear;
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('select class from pm_class order by class');
      Open;
      while not Eof do
        begin
          DBComboBox1.Items.Add(FieldByName('class').asString);
          Next;
        end;
    finally
      Free;
    end;
end;

procedure TPMinfo.FormResize(Sender: TObject);
begin
  // 04/21/2010
  { TODO -oysingh -cWeb Convert : no corresponding uni component for the security register. }
 { IQMS.Common.Controls.RefreshComponentsEx([wwDBLookupCombo1,
    wwDateTimeServiceOUT,
    wwDateTimeServiceIN],
    SR);   }
end;

end.
