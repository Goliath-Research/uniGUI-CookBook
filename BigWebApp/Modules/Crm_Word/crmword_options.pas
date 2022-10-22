unit crmword_options;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.DBTrans.dbttypes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TListCargo = class
   DataType: TCustomTableType;
   constructor Create(ADataType: TCustomTableType);
end;

type
  TFrmCRMWordOption = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblDataFormat: TUniLabel;
    cmbDataFormat: TUniComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DoControlChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FModified: Boolean;
    procedure LoadComboBox;
    procedure GetSettings;
    procedure SetSettings;
  public
    { Public declarations }
  end;

  procedure DoMailMergeOptions;


implementation

{$R *.dfm}

uses
  crm_settings,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm;

procedure DoMailMergeOptions;
begin
  TFrmCRMWordOption.Create(UniApplication).ShowModal;
end;

{ TListCargo }

constructor TListCargo.Create(ADataType: TCustomTableType);
begin
  DataType := ADataType;
end;

{ TFrmCRMWordOption }

procedure TFrmCRMWordOption.FormCreate(Sender: TObject);
begin
  crm_settings.CheckCRMSettingsCreated;
  LoadComboBox;
  GetSettings;
//  IQMS.Common.Controls.CenterForm(Self);
end;

procedure TFrmCRMWordOption.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft01]);
  FModified := False;
end;

procedure TFrmCRMWordOption.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FModified and IQMS.Common.Dialogs.IQConfirmYN('Save settings?') then
     SetSettings;
end;

procedure TFrmCRMWordOption.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TFrmCRMWordOption.LoadComboBox;

  // ---------------------------------------------------------------------------
  procedure _AddType(AType: TCustomTableType);
  var
     ACaption: String;
  begin
    ACaption := Format('%s (%s)', [CustomTableType2[AType], CustomTableExt[AType]]);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'AddItem'
    cmbDataFormat.AddItem(ACaption, TListCargo.Create(AType)); }
  end;
  // ---------------------------------------------------------------------------

begin
{
  'Paradox (.DB)'#9'1'
  'DBase (.DBF)'#9'2'
  'Comma-Delimited Text File (.CSV)'#9'4'
  'Microsoft Access (.MDB)'#9'5'
  'Microsoft Excel (.XLS)'#9'6')
}
  try
     cmbDataFormat.Items.BeginUpdate;
     cmbDataFormat.Items.Clear;
     _AddType(dttParadox);
     _AddType(dttDBase);
     _AddType(dttASCII);
     _AddType(dttMSAccess);
     _AddType(dttMSExcel);
  finally
     cmbDataFormat.Items.EndUpdate;
  end;
end;

procedure TFrmCRMWordOption.GetSettings;
var
   i: Integer;
begin
  // Apply Mail Merge data format value
  for i := 0 to cmbDataFormat.Items.Count - 1 do
   if Ord(TListCargo(cmbDataFormat.Items.Objects[i]).DataType) =
      CRMSettings.MailMergeOptions.DefaultDataFormat then
      begin
        cmbDataFormat.ItemIndex := i;
        Break;
      end;
end;

procedure TFrmCRMWordOption.SetSettings;
begin
  // Mail Merge data format
  if cmbDataFormat.ItemIndex > -1 then
  CRMSettings.MailMergeOptions.DefaultDataFormat :=
   Ord(TListCargo(cmbDataFormat.Items.Objects[cmbDataFormat.ItemIndex]).DataType);

  // Set the switch to False
  FModified := False;
end;

procedure TFrmCRMWordOption.DoControlChange(Sender: TObject);
begin
  FModified := True;
end;

procedure TFrmCRMWordOption.btnOkClick(Sender: TObject);
begin
  SetSettings;
  ModalResult := mrOk;
end;

end.
