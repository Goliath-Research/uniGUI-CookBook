unit subacct;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Vcl.Buttons,
  Mask,
  Data.DB,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl;

type
  TFrmSubAccts = class(TUniForm)
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    sbtnToggleTableFormView: TUniSpeedButton;
    SrcSubAccountType: TDataSource;
    TblSubAccountType: TFDTable;
    TblSubAccountTypeID: TBCDField;
    TblSubAccountTypeDESCRIP: TStringField;
    TblSubAccountTypeACCT_TYPE: TStringField;
    Panel2: TUniPanel;
    pcMain: TUniPageControl;
    TabGrid: TUniTabSheet;
    GridSubAccount: TUniDBGrid;
    TabForm: TUniTabSheet;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label2: TUniLabel;
    Label1: TUniLabel;
    PnlClient02: TUniPanel;
    DBEdit1: TUniDBEdit;
    DBComboBox1: TUniDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnToggleTableFormViewClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    function AccountTypeWasNotChanged:boolean;
    function GetAccountNumbers:string;
    function GetNumberofAffectedAccounts:Integer;
    procedure SetTable(const Table: TFDTable);
  protected
    procedure TblSubAccountsBeforePost(DataSet: TDataSet); virtual;

  public
    { Public declarations }
    lFiltered:Boolean;
    eBeforePost:TDataSetNotifyEvent;
    property aTable:TFDTable write SetTable;
  end;

procedure DoSubAccounts(Table:TFDTable);

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.DataConst;


{$R *.DFM}

procedure DoSubAccounts( Table:TFDTable);
begin
  with TFrmSubAccts.Create(uniGUIApplication.UniApplication ) do
  begin
    aTable:=Table;
    ShowModal;
  end;
end;

procedure TFrmSubAccts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SrcSubAccountType.DataSet.Filtered   :=lFiltered;
  SrcSubAccountType.DataSet.BeforePost := eBeforePost;
  IQRegFormWrite( self, [ self, GridSubAccount, PnlLeft01 ]);
end;

procedure TFrmSubAccts.sbtnToggleTableFormViewClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(pcMain);
end;

procedure TFrmSubAccts.SetTable(const Table: TFDTable);
begin
  if Table <> nil
    then SrcSubAccountType.DataSet := Table;

  eBeforePost                          := SrcSubAccountType.DataSet.BeforePost;
  SrcSubAccountType.DataSet.BeforePost := TblSubAccountsBeforePost;
  SrcSubAccountType.DataSet.Open;

  lFiltered := SrcSubAccountType.DataSet.Filtered;
  SrcSubAccountType.DataSet.Filtered :=False;
end;

procedure TFrmSubAccts.TblSubAccountsBeforePost(DataSet: TDataSet);
var
  nAccounts:Integer;
  cAcctString:string;
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
  if DataSet.State in [dsEdit] then
  begin
   if AccountTypeWasNotChanged then Exit;
   nAccounts := GetNumberofAffectedAccounts;
   if nAccounts = 0 then Exit;
   cAcctString := GetAccountNumbers;
   if not (IqConfirmYN(Format('Modifying the Account Type will change the Account type in the following %d account(s)',
                          [nAccounts]) +  #13 + cAcctString + 'Proceed with the change?')) then Abort;
  end;
end;


procedure TFrmSubAccts.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, GridSubAccount, PnlLeft01 ]);

  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
end;

function TFrmSubAccts.AccountTypeWasNotChanged:boolean;
begin
  with SrcSubAccountType.DataSet do
  Result := FieldByName('ACCT_TYPE').asString =
            SelectValueAsString(IQFormat('select acct_type from glsub_acct_type where id = %f', [FieldByName('ID').asFloat]));
end;

function TFrmSubAccts.GetNumberofAffectedAccounts:Integer;
begin
  Result := Trunc(SelectValueAsFloat(IQFormat('select count(id) from glacct where gl_subacct_type_id = %f'
                                 , [SrcSubAccountType.DataSet.FieldByName('ID').asFloat])));
end;

function TFrmSubAccts.GetAccountNumbers:string;
var
  i:integer;
begin
  Result := '';
  i:= 0;
  with TFDQuery.Create(self) do
  try
    ConnectionName := cnstFDConnectionName;
    Sql.Add(IQFormat('select acct from glacct where gl_subacct_type_id = %f',
                   [SrcSubAccountType.DataSet.FieldByName('ID').asFloat] ));
    Open;
    while not eof do
    begin
      Inc(i);
      Result := Result + Trim(IntToStr(i)) + '. ' + FieldByName('ACCT').AsString + #13;
      Next;
    end;
  finally
    Free;
  end;
end;


end.


