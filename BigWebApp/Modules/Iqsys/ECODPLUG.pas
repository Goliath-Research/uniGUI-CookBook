unit ECodPlug;

interface

uses

  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  //db_dm,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMultiItem,
  uniListBox,
  uniComboBox,
  uniDBComboBox,
  uniDBLookupComboBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,  Vcl.Controls, Vcl.Forms;

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
  private
    function GetSegmentName: string;
    procedure SetSegmentName(const Value: string);
    function GetValue: string;
    procedure SetValue(const Value: string);
    { Private declarations }
  public
    { Public declarations }

    class function GetGLPlugInValue( var ASegmentName, AValue: string ): Boolean;

    property SegmentName : string read GetSegmentName write SetSegmentName;
    property Value       : string read GetValue       write SetValue;

  end;



var
  FrmGetGLPlugInValue: TFrmGetGLPlugInValue;

implementation

{$R *.DFM}

uses
  iqsys_rscstr;

class function TFrmGetGLPlugInValue.GetGLPlugInValue( var ASegmentName, AValue: string ):Boolean;
var
  frm : TFrmGetGLPlugInValue;
begin

  frm := TFrmGetGLPlugInValue.Create(uniGUIApplication.UniApplication);
  frm.SegmentName := ASegmentName;
  frm.Value       := AValue;

  Result := frm.ShowModal = mrOK;

  if Result then
  begin
     ASegmentName := frm.SegmentName;
     AValue       := frm.Value;
  end;

end;

function TFrmGetGLPlugInValue.GetSegmentName: string;
begin
    Result := wwDBLookupSegment.KeyValueStr;
end;

function TFrmGetGLPlugInValue.GetValue: string;
begin
  Result := edPlugVal.Text;
end;

procedure TFrmGetGLPlugInValue.SetSegmentName(const Value: string);
begin
   wwDBLookupSegment.KeyField := Value;
end;

procedure TFrmGetGLPlugInValue.SetValue(const Value: string);
begin
  edPlugVal.Text:= Value;
end;

procedure TFrmGetGLPlugInValue.btnOKClick(Sender: TObject);
begin

  //if wwDBLookupSegment.LookupValue = '' then

  if wwDBLookupSegment.KeyValueStr = '' then
     raise Exception.Create(iqsys_rscstr.cTXT0000065{'Please select a GL segment name.'});

  if Trim(edPlugVal.Text) = '' then
     raise Exception.Create(iqsys_rscstr.cTXT0000066{'Please enter a GL Plug-In value.'});

  if Length(Trim(edPlugVal.Text)) <> TblGlAcctDef.FieldByName('GROUP_LENGTH').asInteger then
     raise Exception.CreateFmt(iqsys_rscstr.cTXT0000067{'GL Plug-In value length must be %d'},
      [ TblGlAcctDef.FieldByName('GROUP_LENGTH').asInteger  ]);

  ModalResult:= mrOK;
end;

end.
