unit iqdbx_object_prop;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  DB,
  SqlExpr,
  FMTBcd,
  Math,
  DBXOracle,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TFrmIQDBXObjProp = class(TUniForm)
    PnlMain: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    lblObjectNameLabel: TUniLabel;
    edtObjectName: TUniEdit;
    edtObjectType: TUniEdit;
    lblObjectTypeLabel: TUniLabel;
    lblCreatedLabel: TUniLabel;
    edtCreated: TUniEdit;
    lblModifiedLabel: TUniLabel;
    edtModified: TUniEdit;
    lblStatusLabel: TUniLabel;
    edtStatus: TUniEdit;
    procedure UniFormCreate(Sender: TObject);
    private
      { Private declarations }
      FObjectType, FObjectName: string;
      FFdConnection: TFDConnection;
      procedure AdjustControls;
      procedure LoadData;
    public
      { Public declarations }
    property ObjectType : string read FObjectType;
    property ObjectName : string read FObjectName;
    property aFdConnection : TFDConnection read FFdConnection;
  end;

procedure DoObjectProperties(const AFdConnection: TFDConnection; const AObjectType, AObjectName: string);


implementation

{$R *.dfm}

uses
  Mainmodule;
//  dbtdbexp;

procedure DoObjectProperties(const AFdConnection: TFDConnection; const AObjectType, AObjectName: string);
var
  FrmIQDBXObjProp : TFrmIQDBXObjProp;
begin
  FrmIQDBXObjProp := TFrmIQDBXObjProp.Create(UniApplication);
   with FrmIQDBXObjProp do
    begin
      FObjectType := AObjectType;
      FObjectName := AObjectName;
      ShowModal;
    end;
end;

{ TFrmIQDBXObjProp }

procedure TFrmIQDBXObjProp.AdjustControls;
var
  i, l, w: Integer;
begin
  l := 0;
  w := 0;
  for i := 0 to PnlMain.ControlCount - 1 do
    if (PnlMain.Controls[i] is TUniLabel) then
      l := Max(l, TUniLabel(PnlMain.Controls[i]).Width);
  l := l + 32;
  w := PnlMain.ClientWidth - (l + 16);
  for i := 0 to PnlMain.ControlCount - 1 do
    if (PnlMain.Controls[i] is TUniEdit) then
      begin
        TUniEdit(PnlMain.Controls[i]).Left := l;
        TUniEdit(PnlMain.Controls[i]).Width := w;
      end;
end;

procedure TFrmIQDBXObjProp.LoadData;
begin
  if Assigned(aFdConnection) then
    with TFdQuery.Create(nil) do
      try
        Connection := aFdConnection;
        SQL.Add('SELECT object_name, created, last_ddl_time, status');
        SQL.Add('FROM user_objects');
        SQL.Add(Format('WHERE object_name = ''%s'' AND', [ObjectName]));
        SQL.Add(Format('      object_type = ''%s'' AND', [ObjectType]));
        SQL.Add('      ROWNUM < 2');
        Open;
        if (BOF and EOF) then
          Exit;
        edtObjectName.Text := Fields[0].AsString;
        edtObjectType.Text := FObjectType;
        edtCreated.Text := FormatDateTime('ddddd tt', Fields[1].AsDateTime);
        edtModified.Text := FormatDateTime('ddddd tt', Fields[2].AsDateTime);
        edtStatus.Text := Fields[3].AsString;
      finally
        Free;
      end;
end;

procedure TFrmIQDBXObjProp.UniFormCreate(Sender: TObject);
begin
  if Assigned(aFdConnection) then
    FFdConnection := aFdConnection
  else
    begin
//      dbtdbexp.DBX_ConfigureSQLConnection(FDConnection1);  //not required - Hayri
      FFdConnection := UniMainModule.FDConnection1;
    end;
  LoadData;
  AdjustControls;
end;

end.
