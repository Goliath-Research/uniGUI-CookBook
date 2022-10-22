unit IQMS.Common.StatChk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl;

type
  TIQNotAuthorizedException = class(Exception)
  public
    constructor Create;
    constructor CreateEx( AStatusException: string );
  end;

  TFrmStatusException = class(TUniForm)
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Label1: TUniLabel;
    Label3: TUniLabel;
    Label2: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    Query1: TFDQuery;
    DataSource1: TDataSource;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    QueryBillTo: TFDQuery;
    CheckBox: TUniCheckBox;
    SR: TIQWebSecurityRegister;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Frcusto_ID: Real;
    procedure Setrcusto_ID(const Value: Real);
    { Private declarations }
  protected
    procedure PrepareQuery( AID: Real ); virtual;
    procedure PrepareQueryBillTo( AID: Real );
    procedure GetLastDialogResult(var AModalResult: TModalResult;var AShowDialog: Boolean); virtual;
    procedure SetLastDialogResult;
  public
    { Public declarations }
    property rcusto_ID:Real write Setrcusto_ID;
  end;

// Authorization exception
procedure CheckCustStatusFor( Arcusto_ID:Real; AStatus:string );

// Status Exceptions
procedure CheckCustBillToStatusIs( ABillTo_ID:Real; AStatus:string );
procedure CheckCustStatusIs( Arcusto_ID:Real; AStatus:string ); overload;
procedure CheckCustStatusIs( Arcusto_ID:Real; const AStatus: array of String ); overload;



implementation

{$R *.DFM}

uses
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure CheckCustStatusFor( Arcusto_ID:Real; AStatus:string );
var
  FrmStatusException: TFrmStatusException;
  S:string;
begin
  S:= Trim(SelectValueFmtAsString('select status_id from arcusto where id = %.0f', [Arcusto_ID]));

  if CompareText( S, AStatus ) = 0 then
     if not IsConsole then
        begin
          FrmStatusException := TFrmStatusException.Create( UniApplication );
          FrmStatusException.rcusto_ID := Arcusto_ID;
          if not (FrmStatusException.ShowModal = mrOK) then
            raise TIQNotAuthorizedException.Create;
        end
     else
        raise TIQNotAuthorizedException.CreateEx( AStatus );
end;

procedure CheckCustBillToStatusIs( ABillTo_ID:Real; AStatus:string );
var
  FrmStatusException: TFrmStatusException;
  S:string;
begin
  S:= Trim(SelectValueFmtAsString('select status_id from bill_to where id = %.0f', [ABillTo_ID]));

  if (S <> '') and (CompareText( S, AStatus ) <> 0) then
     if not IsConsole then
        //if TFrmStatusException.CreateBillTo( Application ) <> nil then
     begin
        FrmStatusException := TFrmStatusException.Create( UniApplication );
        FrmStatusException.rcusto_ID := ABillTo_ID;
        FrmStatusException.PrepareQueryBillTo( FrmStatusException.Frcusto_ID );
        if not (FrmStatusException.ShowModal = mrOK) then
          raise TIQNotAuthorizedException.Create;
     end
     else
        raise TIQNotAuthorizedException .Create;
end;


procedure CheckCustStatusIs( Arcusto_ID:Real; AStatus:string );
var
  FrmStatusException: TFrmStatusException;
  S:string;
begin
  S:= Trim(SelectValueFmtAsString('select status_id from arcusto where id = %.0f', [Arcusto_ID]));

  if (S <> '') and (CompareText( S, AStatus ) <> 0) then
     if not IsConsole then
     begin
        FrmStatusException := TFrmStatusException.Create( UniApplication );
        FrmStatusException.rcusto_ID := Arcusto_ID;
        if not (FrmStatusException.ShowModal = mrOK) then
          raise TIQNotAuthorizedException.Create;
     end
     else
        raise TIQNotAuthorizedException .Create;
end;

procedure CheckCustStatusIs( Arcusto_ID:Real; const AStatus: array of String );
var
  FrmStatusException: TFrmStatusException;
  i: Integer;
  AStatusOK: Boolean;
  ACurStatus: String;
begin
  ACurStatus := Trim(SelectValueFmtAsString('select status_id from arcusto where id = %.0f', [Arcusto_ID]));
  if ACurStatus = '' then Exit;
  AStatusOK := FALSE;
  for i := 0 to High(AStatus) do
   if UpperCase(AStatus[i]) = UpperCase(ACurStatus) then
      begin
        AStatusOK := TRUE;
        BREAK;
      end;


  if not AStatusOK then
  begin
     if not IsConsole then
     begin
        FrmStatusException := TFrmStatusException.Create( UniApplication);
        FrmStatusException.rcusto_ID := Arcusto_ID;
        if not (FrmStatusException.ShowModal = mrOK) then
          raise TIQNotAuthorizedException .Create;
     end
     else
        raise TIQNotAuthorizedException .Create;
  end;
end;

{ TIQStatusException }

constructor TIQNotAuthorizedException.Create;
begin
  inherited Create('Status exception has not been authorized - unable to proceed');
end;

constructor TIQNotAuthorizedException.CreateEx( AStatusException: string );
begin
  inherited CreateFmt('Status exception ''%s'' has not been authorized - unable to proceed', [ AStatusException ]);
end;


{ TFrmStatusException }

procedure TFrmStatusException.FormShow(Sender: TObject);
begin
  PrepareQuery( Frcusto_ID );
  IQSetTablesActive(TRUE, self);
  PageControl1.ActivePage:= TabSheet1;
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmStatusException.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SetLastDialogResult;
end;

procedure TFrmStatusException.PrepareQuery( AID: Real );
begin
  with Query1 do
  begin
    Close;
    ParamByName('ID').Value := AID;
  end;
end;

procedure TFrmStatusException.PrepareQueryBillTo( AID: Real );
begin
  with QueryBillTo do
  begin
    Close;
    ParamByName('ID').Value := AID;
  end;
  DataSource1.DataSet := QueryBillTo;
end;

procedure TFrmStatusException.SetLastDialogResult;
begin
  // Saves the dialog check box result
  if CheckBox.Visible then
    IQMS.Common.RegFrm.SetDialogCheckBoxResult(ClassName, CheckBox.Checked, ModalResult,
      Caption);
end;

procedure TFrmStatusException.Setrcusto_ID(const Value: Real);
begin
  Frcusto_ID := Value;
end;

procedure TFrmStatusException.GetLastDialogResult(
  var AModalResult: TModalResult; var AShowDialog: Boolean);
var
  AChecked: Boolean;
  AMessageText: string;
begin
  // Initialize
  AModalResult := btnOK.ModalResult;
  AShowDialog := True;
  if CheckBox.Visible then
    begin
      IQMS.Common.RegFrm.GetDialogCheckBoxResult(ClassName, {var} AChecked,
        {var} AModalResult, {var} AMessageText, {var} AShowDialog,
        btnOK.ModalResult);
      CheckBox.Checked := AChecked;
    end;
end;

end.
