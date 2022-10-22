unit TAPrPT;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Db,
  DBCtrls,
  ExtCtrls,
  Grids,
  DBGrids,
//  TaByEmp,
//  TaPrep,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniBasicGrid,
  uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFrmTAPrepostPayTypeSummary = class(TUniForm)
    Src: TDataSource;
    Qry: TFDQuery;
    grid: TUniDBGrid;
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    QryDESCRIPTION: TStringField;
    QryTOTAL: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowPayTypeSummary(AOwner:TUniForm);

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

procedure DoShowPayTypeSummary(AOwner:TUniForm);
var
  FrmTAPrepostPayTypeSummary : TFrmTAPrepostPayTypeSummary;
begin
  FrmTAPrepostPayTypeSummary := TFrmTAPrepostPayTypeSummary.Create(UniApplication);
  with FrmTAPrepostPayTypeSummary do
   begin
//     if TUniForm(Owner) is TFrmTAPrepost then
      begin
//        Qry.DataSource := TFrmTAPrepost(Owner).SrcLog;
//        TFrmTAPrepost(Owner).FShowSummary := True;
      end;
//      else if TUniForm(Owner) is TFrmPrepLogByEmp then
//      begin
//        Qry.DataSource := TFrmPrepLogByEmp(Owner).SrcEmp;
//        TFrmPrepLogByEmp(Owner).FShowSummary := True;
//      end;
    show;
   end;
end;

procedure TFrmTAPrepostPayTypeSummary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
//  if TUniForm(Owner) is TFrmTAPrepost then
//    TFrmTAPrepost(Owner).FShowSummary := False
//  else if TUniForm(Owner) is TFrmPrepLogByEmp then
//    TFrmPrepLogByEmp(Owner).FShowSummary := False;
end;

procedure TFrmTAPrepostPayTypeSummary.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, Grid]);
end;

end.
