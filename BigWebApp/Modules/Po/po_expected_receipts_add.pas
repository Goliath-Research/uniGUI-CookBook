{05-29-2013 chkAutoAppend.visible is toggled temporarily to false}

unit po_expected_receipts_add;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  Data.DB,
  System.Generics.Collections,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker, IQUniGrid, uniGUIFrame;

type
  TER_Cargo = class
    RecvDate: TDateTime;
    EPlant_ID: Real;
    Division_ID: Real;
    AutoAppend: Boolean;
    VendorList: TList<Real>;
    constructor Create;
    destructor Destroy;
  end;

  TFrmPOExpectedReceiptsAdd = class(TUniForm)
    Panel2: TUniPanel;
    srchVendors: TIQUniGridControl;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    pnlHeader: TUniPanel;
    Splitter2: TUniSplitter;
    pnlLeft01: TUniPanel;
    Splitter3: TUniSplitter;
    pnlLeft02: TUniPanel;
    Label4: TUniLabel;
    Panel8: TUniPanel;
    Label1: TUniLabel;
    lblDivision: TUniLabel;
    wwDBDateTimePickRecvDate: TUniDBDateTimePicker;
    Panel9: TUniPanel;
    chkAutoAppend: TUniCheckBox;
    wwDBComboDlgEPlant: TUniEdit;
    wwDBComboDlgDivision: TUniEdit;
    Panel1: TUniPanel;
    sbtnApply: TUniSpeedButton;
    SrcVendors: TDataSource;
    QryVendors: TFDQuery;
    PKEplant: TIQWebHPick;
    PKEplantNAME: TStringField;
    PkDivision: TIQWebHPick;
    PkDivisionNAME: TStringField;
    QryVendorsVENDOR_ID: TBCDField;
    QryVendorsVENDORNO: TStringField;
    QryVendorsCOMPANY: TStringField;
    QryVendorsADDR1: TStringField;
    QryVendorsADDR2: TStringField;
    QryVendorsADDR3: TStringField;
    QryVendorsCITY: TStringField;
    QryVendorsSTATE: TStringField;
    QryVendorsZIP: TStringField;
    QryVendorsCOUNTRY: TStringField;
    QryVendorsDIVISION_ID: TBCDField;
    QryVendorsEPLANT_ID: TBCDField;
    QryVendorsDIVISION_NAME: TStringField;
    QryVendorsEPLANT_NAME: TStringField;
    QryVendorsEPLANT_NAME_SHORT: TStringField;
    PkDivisionEPLANT_NAME: TStringField;
    PkDivisionID: TBCDField;
    PkDivisionEPLANT_ID: TBCDField;
    PKEplantID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure wwDBComboDlgDivisionCustomDlg(Sender: TObject);
    procedure wwDBComboDlgEPlantCustomDlg(Sender: TObject);
    procedure wwDBComboDlgEPlantKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryVendorsBeforeOpen(DataSet: TDataSet);
    procedure sbtnApplyClick(Sender: TObject);
    procedure PkDivisionBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    FDivision_ID: Real;
    FEPlant_ID: Real;
    function GetRecvDate: TDateTime;
    procedure SetRecvDate(const Value: TDateTime);
    procedure CloseQuery;
    procedure OpenQuery;
    procedure SetDivision_ID(const Value: Real);
    procedure SetEPlant_ID(const Value: Real);

    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( ACargo: TER_Cargo ): Boolean;

    procedure AddSelectedToList( AList: TList<Real> );
    property RecvDate: TDateTime read GetRecvDate write SetRecvDate;
    property EPlant_ID: Real read FEPlant_ID write SetEPlant_ID;
    property Division_ID: Real read FDivision_ID write SetDivision_ID;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.SysShare;

{ TER_Cargo }

constructor TER_Cargo.Create;
begin
  inherited;
  VendorList:= TList<Real>.Create;
end;

destructor TER_Cargo.Destroy;
begin
  FreeAndNil(VendorList);
  inherited;
end;


{ TFrmPOExpectedReceiptsAdd }

class function TFrmPOExpectedReceiptsAdd.DoShowModal( ACargo: TER_Cargo): Boolean;
var
  FrmPOExpectedReceiptsAdd: TFrmPOExpectedReceiptsAdd;
begin
  FrmPOExpectedReceiptsAdd := self.Create( UniGUIApplication.uniApplication );
  with FrmPOExpectedReceiptsAdd do
  begin
    try
      Result:= ShowModal = mrOK;
      if Result then
      begin
        ACargo.RecvDate   := RecvDate;
        ACargo.EPlant_ID  := EPlant_ID;
        ACargo.Division_ID:= Division_ID;
        if (Division_ID = 0) and (QryVendorsDIVISION_ID.asFloat <> 0) then
          ACargo.Division_ID:= QryVendorsDIVISION_ID.asFloat;
        ACargo.AutoAppend := chkAutoAppend.Checked;
        AddSelectedToList( ACargo.VendorList );
      end;
    finally
      //Release;
    end;
  end;
end;

procedure TFrmPOExpectedReceiptsAdd.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, chkAutoAppend ]);
  IQRegFloatScalarWrite( self, 'eplant_id', EPlant_ID );
  IQRegFloatScalarWrite( self, 'division_id', Division_ID );
end;

procedure TFrmPOExpectedReceiptsAdd.btnOKClick(Sender: TObject);
begin
  IQAssert( not (QryVendors.Eof and QryVendors.Bof), 'Nothing is selected - operation aborted.');
  ModalResult:= mrOK;
end;

function TFrmPOExpectedReceiptsAdd.GetRecvDate: TDateTime;
begin
  Result:= wwDBDateTimePickRecvDate.DateTime;
end;

procedure TFrmPOExpectedReceiptsAdd.OpenQuery;
begin
  Reopen(QryVendors);
end;

procedure TFrmPOExpectedReceiptsAdd.QryVendorsBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('recv_date').asDateTime:= RecvDate;
    ParamByName('eplant_id').Value := EPlant_ID;
    ParamByName('division_id').Value := Division_ID;
  end;
end;

procedure TFrmPOExpectedReceiptsAdd.sbtnApplyClick(Sender: TObject);
begin
  OpenQuery;
end;

procedure TFrmPOExpectedReceiptsAdd.SetDivision_ID(const Value: Real);
begin
  FDivision_ID := Value;
  if FDivision_ID = 0 then
     wwDBComboDlgDivision.Text:= ''
  else
     wwDBComboDlgDivision.Text:= SelectValueByID('name', 'division', FDivision_ID);
end;

procedure TFrmPOExpectedReceiptsAdd.SetEPlant_ID(const Value: Real);
begin
  FEPlant_ID := Value;
  if FEPlant_ID = 0 then
     wwDBComboDlgEPlant.Text:= ''
  else
     wwDBComboDlgEPlant.Text:= SelectValueByID('name', 'eplant', FEPlant_ID);
end;

procedure TFrmPOExpectedReceiptsAdd.SetRecvDate(const Value: TDateTime);
begin
  wwDBDateTimePickRecvDate.DateTime:= Value;
end;

procedure TFrmPOExpectedReceiptsAdd.UniFormCreate(Sender: TObject);
var
  AValue: Real;
begin
  IQRegFormRead( self, [ self, chkAutoAppend ]);

  wwDBDateTimePickRecvDate.DateTime := Date;
  if IQRegFloatScalarRead( self, 'eplant_id', AValue ) then
     EPlant_ID:= AValue;
  if IQRegFloatScalarRead( self, 'division_id', AValue ) then
     Division_ID:= AValue;

  lblDivision.Caption:= CheckReplaceDivisionCaption( lblDivision.Caption ); {Sys_share}
end;

procedure TFrmPOExpectedReceiptsAdd.wwDBComboDlgDivisionCustomDlg(
  Sender: TObject);
begin
  with PkDivision do
    if Execute then
    begin
      Division_ID:= GetValue('ID');
      CloseQuery;
    end;
end;

procedure TFrmPOExpectedReceiptsAdd.wwDBComboDlgEPlantCustomDlg(Sender: TObject);
var
  aDivisionEplantId:Real;
begin
  with PkEplant do
    if Execute then
    begin
      EPlant_ID:= GetValue('ID');
      aDivisionEplantId := SelectValueFmtAsFloat('select eplant_id from division where id = %f', [Division_ID]);
      if (aDivisionEplantId <> 0) and (aDivisionEplantId <> EPlant_ID) then
      begin
        Division_ID := 0;
        wwDBComboDlgDivision.Text := '';
      end;
      CloseQuery;
    end;
end;

procedure TFrmPOExpectedReceiptsAdd.wwDBComboDlgEPlantKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    if Sender = wwDBComboDlgEPlant then
       EPlant_ID:= 0
    else if Sender = wwDBComboDlgDivision then
       Division_ID:= 0
    else
       EXIT;
    Key:= 0;
    CloseQuery;
  end;
end;

procedure TFrmPOExpectedReceiptsAdd.CloseQuery;
begin
  QryVendors.Close;
end;

procedure TFrmPOExpectedReceiptsAdd.AddSelectedToList(AList: TList<Real>);
var
  I: Integer;
begin
  AList.Clear;
  {NOTE : Dataset replaced with DataSource.DataSet}
  with srchVendors do
  try
     DataSource.DataSet.DisableControls;
     if DataSource.DataSet.Eof and DataSource.DataSet.Bof then
        EXIT;
     { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
     {if wwDBGrid.SelectedList.Count > 0 then
        for I:= 0 to wwDBGrid.SelectedList.Count - 1 do
        begin
          DataSource.DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
          AList.Add( DataSource.DataSet.FieldByName('vendor_id').asFloat );
        end
     else
        AList.Add( DataSource.DataSet.FieldByName('vendor_id').asFloat );}

  finally
     DataSource.DataSet.EnableControls;
  end;
end;

procedure TFrmPOExpectedReceiptsAdd.PkDivisionBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AEPLANTID', EPlant_ID);
end;



end.




