unit MCBreaks;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  MCFrmBas,
  Data.DB,
  Vcl.DBGrids,
  Wwtable,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  Vcl.Menus,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniDBNavigator, uniMainMenu, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniLabel, uniPanel;

type
  TFrmMCBreaks = class(TFrmMCFormBasic)
    grid: TUniDBGrid;
    Src: TDataSource;
    Qry: TFDQuery;
    nav: TUniDBNavigator;
    QryQUAN: TBCDField;
    QryQPRICE: TFMTBCDField;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FTableName: String;
    FIDField: String;
    FParentTable: TFDTable;
    FParentField: String;
    FBuying: String;
    procedure RefreshCaption; override;
    procedure Recalculate; override;
    procedure ReadForm; override;
    procedure WriteForm; override;
    procedure SetBuying(const Value: string);
    procedure SetIDField(const Value: string);
    procedure SetParentTable(const Value: TFDTable);
    procedure SetParentTableField(const Value: string);
    procedure SetTableName(const Value: string);
  public
    { Public declarations }
    property TableName: string write SetTableName;
    property IDField: string write SetIDField;
    property ParentTable: TFDTable write SetParentTable;
    property ParentTableField: string write SetParentTableField;
    property Buying: string write SetBuying;
  end;

procedure DoMCBREAKS(AID: Real; ATableName, AIDField: String;
  AParentTable: TFDTable; AParentTableField, ABuying: String);

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.NLS,
  IQMS.Common.McRscstr,
  UniGuiApplication;

procedure DoMCBREAKS(AID: Real; ATableName, AIDField: String;
  AParentTable: TFDTable; AParentTableField, ABuying: String);
var
  LFrm: TFrmMCBreaks;
begin
  LFrm := TFrmMCBreaks.Create(UniGuiApplication.UniApplication);
  LFrm.ID := AID;
  LFrm.IDField := AIDField;
  LFrm.ParentTable := AParentTable;
  LFrm.ParentTableField := AParentTableField;
  LFrm.Buying := ABuying;
  LFrm.Show;
end;

procedure TFrmMCBreaks.SetBuying(const Value: string);
begin
  FBuying := Value;
end;

procedure TFrmMCBreaks.SetIDField(const Value: string);
begin
  FIDField := Value;
end;

procedure TFrmMCBreaks.SetParentTable(const Value: TFDTable);
begin
  FParentTable := Value;
end;

procedure TFrmMCBreaks.SetParentTableField(const Value: string);
begin
  FParentField := Value;
end;

procedure TFrmMCBreaks.SetTableName(const Value: string);
begin
  FTableName := Value;
end;

procedure TFrmMCBreaks.UniFormShow(Sender: TObject);
begin
  inherited;
  Recalculate;
  RefreshCaption;
end;

procedure TFrmMCBreaks.ReadForm;
begin
  IQRegFormRead(self, [self, grid]);
end;

procedure TFrmMCBreaks.WriteForm;
begin
  IQRegFormWrite(self, [self, grid]);
end;

procedure TFrmMCBreaks.Recalculate;
begin
  if (FParentTable <> nil) and (FParentTable.State <> dsInactive) then
    with Qry do
    begin
      Close;
      Sql[2] := Format('from %s', [FTableName]);
      if FTableName = 'ARINVT_BREAKS' then
        Sql[3] := IQFormat('where %s = %f and NVL(buying, ''N'') = ''%s''',
          [FIDField, FParentTable.FieldByName(FParentField).asFloat, FBuying])
      else
        Sql[3] := IQFormat('where %s = %f',
          [FIDField, FParentTable.FieldByName(FParentField).asFloat]);
      ParamByName('nFactor').Value := Factor;
      Open;
    end;
end;

procedure TFrmMCBreaks.RefreshCaption;
begin
  if FTableName = 'ARINVT_BREAKS' then
    with TFDQuery.Create(self) do
      try
        Connection := UniMainModule.FDConnection1;
        Sql.Add(IQFormat('select itemno, rev from arinvt where id = %f',
          [FParentTable.FieldByName(FParentField).asFloat]));
        Open;
        self.Caption := Format(cTXT0000008,
          // 'Default Price List for Item %s, Revision %s'
          [FieldByName('itemno').asString, FieldByName('rev').asString]);
      finally
        Free;
      end
  else
    Caption := cTXT0000009; // 'Default Price List'
end;

end.
