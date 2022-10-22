unit iqdbx_findrec;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  Buttons,
  DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniCheckBox;

type
  TFrmIQDBXFindRecord = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    lblFieldName: TUniLabel;
    Panel1: TUniPanel;
    btnFind: TUniBitBtn;
    btnCancel: TUniBitBtn;
    Panel2: TUniPanel;
    sbtnClear: TUniSpeedButton;
    Panel3: TUniPanel;
    edtText: TUniEdit;
    cmbFieldList: TUniComboBox;
    chkCaseSensitive: TUniCheckBox;
    chkPartial: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFindClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    private
      { Private declarations }
      FDataSet: TDataSet;
      procedure SetDefaults(ADefaultText, AFieldName: string);
    public
      { Public declarations }
  end;

function DoFindFieldText(ATableName, AFieldName: string;
  ADefaultText: string; ADataSet: TDataSet): Boolean;

implementation

{$R *.dfm}

uses
  MainModule,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs;
//  iqdbx_shared;

function DoFindFieldText(ATableName, AFieldName: string;
  ADefaultText: string; ADataSet: TDataSet): Boolean;
var
  FrmIQDBXFindRecord : TFrmIQDBXFindRecord;
begin
  FrmIQDBXFindRecord := TFrmIQDBXFindRecord.Create(UniApplication);

  with FrmIQDBXFindRecord do
   begin
//      FillFieldList(cmbFieldList, ATableName);

      // executes when user clicks find
      FDataSet := ADataSet;

      // set default values
      SetDefaults(ADefaultText, AFieldName);

      Result := ShowModal = mrOk;
   end;


end;

procedure TFrmIQDBXFindRecord.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, PnlLeft01]);
end;

procedure TFrmIQDBXFindRecord.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TFrmIQDBXFindRecord.btnFindClick(Sender: TObject);
var
  ALocateOptions: TLocateOptions;
begin
  ALocateOptions := [];
  if chkCaseSensitive.Checked then
    ALocateOptions := [loCaseInsensitive];
  if chkPartial.Checked then
    ALocateOptions := ALocateOptions + [loPartialKey];

  if Assigned(FDataSet) and
    (FDataSet.FindField(cmbFieldList.Text) <> nil) and
    FDataSet.Locate(cmbFieldList.Text, edtText.Text, ALocateOptions) then
    ModalResult := mrOk
  else
    IQInformation('Text not found.');
end;

procedure TFrmIQDBXFindRecord.SetDefaults(ADefaultText, AFieldName: string);
var
  i: Integer;
begin
  // set default values
  edtText.Text := ADefaultText;

  if cmbFieldList.Items.Count = 0 then
    Exit;

  i := cmbFieldList.Items.IndexOf(AFieldName);
  if i = - 1 then
    i := 0;
  cmbFieldList.ItemIndex := i;
end;

end.
