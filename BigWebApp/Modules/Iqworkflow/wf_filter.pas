unit wf_filter;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  wf_const,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniComboBox,
  uniDBComboBox;

type
  TFrmWorkflowFilter = class(TUniForm)
    btnOK: TUniButton;
    btnCancel: TUniButton;
    QryArcusto: TFDQuery;
    QryArcustoID: TBCDField;
    QryArcustoCUSTNO: TStringField;
    QryArcustoCOMPANY: TStringField;
    GroupBox1: TUniGroupBox;
    rbtnCustAll: TUniRadioButton;
    rbtnCustOne: TUniRadioButton;
    wwDBLookupComboArcusto: TUniDBLookupComboBox;
    GroupBox2: TUniGroupBox;
    rbtnShowAll: TUniRadioButton;
    rbtnShowOpen: TUniRadioButton;
    rbtnShowClosed: TUniRadioButton;
    procedure btnOKClick(Sender: TObject);
    procedure EnableControlCustDropDown(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FWorkflowFilter : TWorkflowFilter;
  protected
    procedure InitVars( AFilter: TWorkflowFilter ); virtual;
  public
    { Public declarations }
    property Filter : TWorkflowFilter Write FWorkflowFilter;
    class function DoModify( var AFilter: TWorkflowFilter ): Boolean;
    procedure AssignFilter( var AFilter: TWorkflowFilter ); virtual;
    class procedure Clear( var AFilter: TWorkflowFilter );
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;

class function TFrmWorkflowFilter.DoModify( var AFilter: TWorkflowFilter ): Boolean;
var
  aFrmWorkflowFilter : TFrmWorkflowFilter;
begin
  aFrmWorkflowFilter := TFrmWorkflowFilter.Create(UniGUIApplication.UniApplication);
  aFrmWorkflowFilter.Filter:= AFilter;
  Result:= aFrmWorkflowFilter.ShowModal = mrOK;
end;

procedure TFrmWorkflowFilter.InitVars( AFilter: TWorkflowFilter );
begin
  with AFilter do
  begin
    {customer}
    rbtnCustAll.Checked:= Arcusto_ID <= 0;
    rbtnCustOne.Checked:= Arcusto_ID > 0;
    if rbtnCustOne.Checked then with wwDBLookupComboArcusto do
    begin
      KeyField:= SelectValueByID( 'custno', 'arcusto', Arcusto_ID );
      { -cWebConvert : Undeclared identifier: 'PerformSearch' }
      //PerformSearch;
    end;

    {showing}
    case Showing of
      wsAll   : rbtnShowAll.Checked   := TRUE;
      wsOpen  : rbtnShowOpen.Checked  := TRUE;
      wsClosed: rbtnShowClosed.Checked:= TRUE;
    end;

    if Wording = '' then Wording:= 'Workflow';
    Caption:= Wording + ' Filter';  {Default is Workflow Filter}
    rbtnShowAll.Caption   := Format('All %ss',    [ Wording ]); // All Workflows
    rbtnShowOpen.Caption  := Format('Open %ss',   [ Wording ]); // Open Workflows
    rbtnShowClosed.Caption:= Format('Closed %ss', [ Wording ]); // Closed Workflows
  end;
end;

procedure TFrmWorkflowFilter.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmWorkflowFilter.UniFormDestroy(Sender: TObject);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmWorkflowFilter.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  InitVars( FWorkflowFilter );
  AssignFilter( FWorkflowFilter );
end;

procedure TFrmWorkflowFilter.btnOKClick(Sender: TObject);
begin
  if rbtnCustOne.Checked and (wwDBLookupComboArcusto.Text = '') then
     raise Exception.Create('Customer is not selected');

  ModalResult:= mrOK;
end;

procedure TFrmWorkflowFilter.EnableControlCustDropDown(Sender: TObject);
begin
  IQEnableControl( wwDBLookupComboArcusto, rbtnCustOne.Checked );
end;

procedure TFrmWorkflowFilter.AssignFilter( var AFilter: TWorkflowFilter );
begin
  with AFilter do
  begin
    {customer}
    if rbtnCustAll.Checked then
       Arcusto_ID:= 0
    else
       Arcusto_ID:= QryArcustoID.asFloat;

    {showing}
    if rbtnShowAll.Checked then
       Showing:= wsAll
    else if rbtnShowOpen.Checked then
       Showing:= wsOpen
    else if rbtnShowClosed.Checked then
       Showing:= wsClosed
    else
       raise Exception.Create('Showing mode is not selected');
  end;
end;

class procedure TFrmWorkflowFilter.Clear(var AFilter: TWorkflowFilter);
begin
  with AFilter do
  begin
     Arcusto_ID:= 0;
     Vendor_ID := 0;
     Showing   := wsAll;
  end;
end;

end.
