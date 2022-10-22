unit Sel_Div;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
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
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniComboBox, uniDBComboBox;

type
  TFrmSelectDivision = class(TUniForm)
    wwQryDivision: TFDQuery;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    rbtnAllDiv: TUniRadioButton;
    rbtnOneDiv: TUniRadioButton;
    Bevel1: TUniPanel;
    wwQryDivisionID: TBCDField;
    wwQryDivisionNAME: TStringField;
    wwQryDivisionEPLANT_NAME: TStringField;
    SrcDivision: TDataSource;
    procedure rbtnAllDivClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetDivision_ID(const Value: Real);
  protected
    procedure InitRadioButtons(ADivision_ID: Real); virtual;
    procedure InitCaptions; virtual;
  public
    { Public declarations }
    property Division_ID: Real write SetDivision_ID;
  end;

function DoSelectDivision( var ADivision_ID: Real ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.SysShare;

function DoSelectDivision( var ADivision_ID: Real ): Boolean;
var
  LFrmSelectDivision : TFrmSelectDivision;
begin
  LFrmSelectDivision := TFrmSelectDivision.Create( uniGUIApplication.UniApplication );
  LFrmSelectDivision.Division_ID := ADivision_ID;
  Result:= LFrmSelectDivision.ShowModal = mrOK;
  if Result then
  begin
    if LFrmSelectDivision.rbtnAllDiv.Checked then
       ADivision_ID:= 0
    else
       ADivision_ID:= LFrmSelectDivision.wwQryDivision.FieldByName('ID').asFloat;
  end;
end;

procedure TFrmSelectDivision.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmSelectDivision.InitRadioButtons(ADivision_ID: Real);
begin
  wwDBLookupCombo1.Text:= SelectValueFmtAsString( 'select name from division where id = %f', [ ADivision_ID ]);
  { TODO -oathite -cWebConvert : Undeclared identifier: 'PerformSearch'
  wwDBLookupCombo1.PerformSearch; }

  if wwDBLookupCombo1.Text = '' then
     rbtnAllDiv.Checked:= TRUE
  else
     rbtnOneDiv.Checked:= TRUE;
end;

procedure TFrmSelectDivision.rbtnAllDivClick(Sender: TObject);
begin
  IQEnableControl( wwDBLookupCombo1, rbtnOneDiv.Checked );
end;

procedure TFrmSelectDivision.SetDivision_ID(const Value: Real);
begin
  InitRadioButtons(Value);
  rbtnAllDivClick( NIL );

  {Division/Warehouse}
  InitCaptions;
end;

procedure TFrmSelectDivision.InitCaptions;
begin
  Caption                               := CheckReplaceDivisionCaption( Caption );      {Sys_Share}
  with rbtnAllDiv do Caption            := CheckReplaceDivisionCaption( Caption );
  with rbtnOneDiv do Caption            := CheckReplaceDivisionCaption( Caption );
  with wwQryDivisionNAME do DisplayLabel:= CheckReplaceDivisionCaption( DisplayLabel );
  { TODO -oathite -cWebConvert : Undeclared identifier: 'Selected'
  with wwDBLookupCombo1 do CheckReplaceDivisionOfWWSelected( Selected );}
end;


end.
