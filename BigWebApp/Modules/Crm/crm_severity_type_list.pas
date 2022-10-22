unit crm_severity_type_list;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  crmlist,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  FireDAC.UI.Intf,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.Search,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,uniGUIAbstractClasses,uniDBGrid,uniGUITypes,
  uniMainMenu, IQUniGrid, uniGUIFrame, uniDBNavigator, uniPanel;

type
  TFrmCRMSeverityTypeList = class(TFrmCRMList)
    SrcSeverityType: TDataSource;
    QrySeverityType: TFDQuery;
    cmbLabelColor: TUniEdit;
    PMain: TUniPopupMenu;
    EditColor1: TUniMenuItem;
    Help1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    FDUpdateSQL1: TFDUpdateSQL;
    QrySeverityTypeID: TBCDField;
    QrySeverityTypeNAME: TStringField;
    QrySeverityTypeDESCRIPTION: TStringField;
    QrySeverityTypeLABEL_COLOR: TBCDField;
    QrySeverityTypeLABEL_COLOR_G: TBCDField;
    QrySeverityTypeLABEL_COLOR_R: TBCDField;
    QrySeverityTypeLABEL_COLOR_B: TBCDField;
    QrySeverityTypeLabelColor: TWideStringField;
    ColorDialog1: TColorDialog;
    procedure FormCreate(Sender: TObject);
    procedure EditColor1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure QrySeverityTypeNewRecord(DataSet: TDataSet);
    procedure SRAfterApply(Sender: TObject);
    procedure GridDBGridDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow(AOwner: TComponent);
  end;

var
  FrmCRMSeverityTypeList: TFrmCRMSeverityTypeList;

implementation

{$R *.dfm}

uses
  IQMS.Common.Graphics,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.JumpConstants;

{ TFrmCRMSeverityTypeList }

class procedure TFrmCRMSeverityTypeList.DoShow(AOwner: TComponent);
begin
  TFrmCRMSeverityTypeList.Create(AOwner).Show;
end;

procedure TFrmCRMSeverityTypeList.FormCreate(Sender: TObject);
begin
  inherited;

  if QrySeverityType.Active then
    QrySeverityType.Close;
  cmbLabelColor.Visible := False;
//  Grid.ControlType.Clear;
//  Grid.ControlType.Text := 'LabelColor;CustomEdit;cmbLabelColor;F';
//  Grid.ApplySelected;
  QrySeverityType.Open;

end;

procedure TFrmCRMSeverityTypeList.GridDBGridDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (UpperCase(Column.Field.FieldName) = 'LABELCOLOR') then
    if QrySeverityTypeLABEL_COLOR.AsInteger > 0 then
      Attribs.Color := TColor(QrySeverityTypeLABEL_COLOR.AsInteger);
end;

procedure TFrmCRMSeverityTypeList.EditColor1Click(Sender: TObject);
var
  R, G, B: Integer;
begin
  if not SR.Enabled['EditColor1'] then
    Exit;
  ColorDialog1.Color := QrySeverityTypeLABEL_COLOR.AsInteger;
  if ColorDialog1.Execute then
    begin
      if not (QrySeverityType.State in [dsEdit, dsInsert]) then
        QrySeverityType.Edit;
      QrySeverityTypeLABEL_COLOR.AsInteger := ColorDialog1.Color;
      IQMS.Common.Graphics.GetColorToRGB(ColorDialog1.Color, { var } R, G, B);
      QrySeverityTypeLABEL_COLOR_R.AsInteger := R;
      QrySeverityTypeLABEL_COLOR_G.AsInteger := G;
      QrySeverityTypeLABEL_COLOR_B.AsInteger := B;
      QrySeverityType.Post;
      QrySeverityType.Refresh;
    end;
end;

procedure TFrmCRMSeverityTypeList.Help1Click(Sender: TObject);
begin
  inherited;
  IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM, IQMS.Common.HelpHook.iqhtmIQCRM);
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmCRMSeverityTypeList.QrySeverityTypeNewRecord(DataSet: TDataSet);
begin
  QrySeverityTypeID.AsLargeInt := GetNextID('CRM_ACTIVITY_SEVERITY');
end;

procedure TFrmCRMSeverityTypeList.SRAfterApply(Sender: TObject);
begin
  cmbLabelColor.Visible := False;
//  cmbLabelColor.ShowButton := SR.Enabled['EditColor1'];
end;

end.
