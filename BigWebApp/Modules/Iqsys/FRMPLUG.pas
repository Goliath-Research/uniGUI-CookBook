unit FrmPlug;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
//  Mask,
//  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, uniComboBox,
  uniDBComboBox;

type
  TFrmGetGLPlugInValue = class(TUniForm)
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    DBEdit2: TUniDBEdit;
    wwDBLookupSegment: TUniDBLookupComboBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    TblGlAcctDef: TFDTable;
    SrcGlAcctDef: TDataSource;
    edPlugVal: TUniEdit;
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FSegmentName : string;
    FValue : string;
    procedure SetSegmentName(Value : string);
    function GetSegmentName: string;
    procedure SetValue(Value : string);
    function GetValue: string;
  public
    { Public declarations }
    property SegmentName : string read GetSegmentName write SetSegmentName;
    property Value : string read GetValue write SetValue;
  end;

function GetGLPlugInValue( var ASegmentName, AValue: string ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Dialogs,
  iqsys_rscstr;

function GetGLPlugInValue( var ASegmentName, AValue: string ): Boolean;
var
  frm : TFrmGetGLPlugInValue;
begin
  frm := TFrmGetGLPlugInValue.Create(uniGUIApplication.UniApplication);
  frm.SegmentName := ASegmentName;
  frm.Value := AValue;

  Result:= (frm.ShowModal = mrOK);
  if Result then
  begin
    ASegmentName:= frm.wwDBLookupSegment.KeyValueStr;
    AValue      := frm.edPlugVal.Text;
  end;

end;

procedure TFrmGetGLPlugInValue.UniFormCreate(Sender: TObject);
begin
  TblGlAcctDef.Open;
end;


procedure TFrmGetGLPlugInValue.UniFormShow(Sender: TObject);
begin
{ TODO -oLema : Need to find alternative for PerformSearch }
//  wwDBLookupSegment.LookupValue:= ASegmentName;
//  wwDBLookupSegment.PerformSearch;

  edPlugVal.Text:= FValue;
end;

function TFrmGetGLPlugInValue.GetSegmentName: string;
begin
  result := FSegmentName;
end;


procedure TFrmGetGLPlugInValue.SetSegmentName(Value: string);
begin
  FSegmentName := Value;
end;

function TFrmGetGLPlugInValue.GetValue: string;
begin
  result := FValue;
end;

procedure TFrmGetGLPlugInValue.SetValue(Value: string);
begin
  FValue := Value;
end;

procedure TFrmGetGLPlugInValue.btnOKClick(Sender: TObject);
begin
  if wwDBLookupSegment.KeyValueStr = '' then
     raise Exception.Create(iqsys_rscstr.cTXT0000065{'Please select a GL segment name.'});

  if ( Length(Trim(edPlugVal.Text)) <> TblGlAcctDef.FieldByName('GROUP_LENGTH').asInteger ) and ( Length(Trim(edPlugVal.Text)) > 0 ) then
     raise Exception.CreateFmt(iqsys_rscstr.cTXT0000067{'GL Plug-In value length must be %d'},
      [ TblGlAcctDef.FieldByName('GROUP_LENGTH').asInteger  ]);

  if Trim(edPlugVal.Text) = '' then
     IQWarning(iqsys_rscstr.cTXT0000066 {'Please enter a GL Plug-In value.'});

  ModalResult:= mrOK;
end;

end.
