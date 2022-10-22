// Example:
// 1. Inherit from QuickAddBase.  Name it TQuickAddCustomer.
// 2. Set TabelName, Labels/Fields on the screen.
// 2. procedure TForm2.IQHpick1IQModify(Sender: TObject; var Action: TModalResult; var ResultValue: Variant);
// begin
// Action:= DoQuickAppend( TQuickAddCustomer, ResultValue );
// end;

unit IQMS.Common.QuickAddBase;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniPageControl;

type
  { 07-16-2007 keep adding params as needed }
  TQuickAddBaseCargo = class
    NParam1: Real;
    { assign any real number such as standard_id for instance and the wrapper will know what it is and what to do with it }
    CParam1: string; { assign any char such as uom }
  end;

  TQuickAddBase = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Table1: TFDTable;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Table1NewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    function GetResultValue: Int64; // virtual;
  protected
    FQuickAddBaseCargo: TQuickAddBaseCargo;
  public
    { Public declarations }
    property ResultValue: Int64 read GetResultValue;
  end;

type
  TQuickAddBaseClass = class of TQuickAddBase;

function DoQuickAppend(AForm: TQuickAddBaseClass; var AResultValue: Variant;
  AHideBlend: Boolean = FALSE; AQuickAddBaseCargo: TQuickAddBaseCargo = nil): TModalResult;


implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.JumpConstants,
  System.Variants;


function DoQuickAppend(AForm: TQuickAddBaseClass; var AResultValue: Variant;
  AHideBlend: Boolean = FALSE; AQuickAddBaseCargo: TQuickAddBaseCargo = nil): TModalResult;
begin
  with AForm.Create(Application) do
    try
      FQuickAddBaseCargo := AQuickAddBaseCargo;
      if AHideBlend then
        PostMessage(Handle, iq_Notify, 0, 0); { Post message to the children to hide the box }
      Result := ShowModal;
      if Result = mrOK then
        AResultValue := ResultValue;
    finally
      Release;
    end;
end;

procedure TQuickAddBase.FormCreate(Sender: TObject);
begin
  with Table1 do
  begin
    if State = dsInactive then
      Open;
    Append;
  end;
end;

procedure TQuickAddBase.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TQuickAddBase.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmBOM { HTM } ); { IQMS.Common.HelpHook.pas }
end;

procedure TQuickAddBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TQuickAddBase.btnCancelClick(Sender: TObject);
begin
  with Table1 do
    if State = dsInsert then
      Cancel;
  ModalResult := mrCancel;
end;

procedure TQuickAddBase.btnOKClick(Sender: TObject);
begin
  with Table1 do
    try
      if State in [dsInsert, dsEdit] then
        Post;
      ModalResult := mrOK;
    except
      on E: Exception do
        Application.ShowException(E);
    end;
end;

procedure TQuickAddBase.Table1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TQuickAddBase.Table1NewRecord(DataSet: TDataSet);
begin
  // 04/04/2012
  IQAssignIDBeforePost(DataSet);
  // 04/04/2012
  if DataSet.FindField('USE_USA_MASK') <> nil then
    CheckApplyUSAMask(DataSet.FieldByName('USE_USA_MASK'));
end;

function TQuickAddBase.GetResultValue: Int64;
var
  AField: TField;
begin
  AField := Table1.FindField('ID');
  if Assigned(AField) then
    Result := AField.AsLargeInt;
end;

end.
