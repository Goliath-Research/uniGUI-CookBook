unit hrevent_types;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Mask,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniGUIFrame, IQUniGrid, Vcl.Controls;

type
  TFrmHREventTypes = class(TUniForm)
    Panel2: TUniPanel;
    Grid: TIQUniGridControl;
    Bevel1: TUniPanel;
    ColorDialog1: TColorDialog;
    SrcEventType: TDataSource;
    TblEventType: TFDTable;
    TblEventTypeID: TBCDField;
    TblEventTypeNAME: TStringField;
    TblEventTypeDESCRIPTION: TStringField;
    TblEventTypeLABEL_COLOR: TBCDField;
    cmbLabelColor: TUniEdit;
    TblEventTypeLabelColor: TStringField;
    QryEPlantLookup: TFDQuery;
    QryEPlantLookupID: TBCDField;
    QryEPlantLookupNAME: TStringField;
    TblEventTypeEPLANT_ID: TBCDField;
    TblEventTypeEPlant: TStringField;
    cmbEPlant: TUniEdit;
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbLabelColorCustomDlg(Sender: TObject);
   { TODO : 'TGridDrawState' not yet converted }
   { procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);       }
    procedure TblEventTypeBeforeDelete(DataSet: TDataSet);
    procedure TblEventTypeNewRecord(DataSet: TDataSet);
    procedure cmbEPlantCustomDlg(Sender: TObject);
    procedure TblEventTypeBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure DoHREventTypes;

implementation

{$R *.DFM}

uses
  IQMS.Common.HrRscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO : iqsecins not converted }
  //iqsecins,
  IQMS.COmmon.SetPlant;


procedure DoHREventTypes;
var
  LFrmHREventTypes : TFrmHREventTypes;
begin
  LFrmHREventTypes := TFrmHREventTypes.Create(UniGUIApplication.UniApplication);
  LFrmHREventTypes.Show;
end;

procedure TFrmHREventTypes.FormCreate(Sender: TObject);
begin
  if NavMain.DataSource <> NIL then
     NavMain.DataSource.DataSet.Open;
  { TODO : Incompatible types: 'TForm' and 'TFrmHREventTypes' }
  //CenterForm(Self);
  IQRegFormRead( Self, [ Self, Grid ] );

  cmbLabelColor.Visible := False;
  cmbEPlant.Visible := False;
end;

procedure TFrmHREventTypes.FormShow(Sender: TObject);
begin
  { TODO : iqsecins not converted }
  //EnsureSecurityInspectorOnTopOf( Self ); // IQSecIns.pas
end;

procedure TFrmHREventTypes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self, Grid ] );
end;

procedure TFrmHREventTypes.cmbLabelColorCustomDlg(Sender: TObject);
begin
  with ColorDialog1 do
  begin
   Color := TblEventTypeLABEL_COLOR.AsInteger;
   if Execute then
      begin
        if not (TblEventType.State in [dsEdit, dsInsert]) then
           TblEventType.Edit;
        TblEventTypeLABEL_COLOR.AsInteger := Color;
        TblEventType.Post;
      end;
  end;
end;

{ TODO : 'TGridDrawState' not yet converted }
{procedure TFrmHREventTypes.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  //if Highlight then Exit;
  if (UpperCase(Field.FieldName) = 'LABELCOLOR') then
     if TblEventTypeLABEL_COLOR.AsInteger > 0 then
        ABrush.Color := TColor(TblEventTypeLABEL_COLOR.AsInteger);
end;   }

procedure TFrmHREventTypes.TblEventTypeBeforeDelete(DataSet: TDataSet);
begin
  if IsFoundFmt('select id from hr_events where hr_event_type_id = %.0f',
     [TblEventTypeID.AsFloat]) then
     //'Cannot delete.  This type is referenced by another record.'
     raise Exception.Create(IQMS.Common.HrRscstr.cTXT0000016);
end;

procedure TFrmHREventTypes.TblEventTypeNewRecord(DataSet: TDataSet);
begin
  TblEventTypeID.AsFloat := GetNextID( 'HR_EVENT_TYPE' );
end;

procedure TFrmHREventTypes.cmbEPlantCustomDlg(Sender: TObject);
begin
  DoChangePlantID( TblEventType );  // IQMS.COmmon.SetPlant.pas
end;

procedure TFrmHREventTypes.TblEventTypeBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
  DataSet.Filtered := True;
end;

end.
