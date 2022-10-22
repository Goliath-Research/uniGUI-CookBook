unit repdef_cat_rep_list;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniGUIFrame,
  IQUniGrid, Vcl.Controls;

type
  TFrmRepdef_Cat_Rep_List = class(TUniForm)
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1APP_ID: TStringField;
    Query1REPNAME: TStringField;
    Query1DESCRIP: TStringField;
    Query1MFGTYPE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
    { TODO : TGridDrawState not yet converted }
    {procedure IQSearch1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush); }
  private
    FDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow(ADataSource: TDataSource );
    property DataSource : TDataSource write SetDataSource;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  repdef_cat;

{ TFrmRepdef_Cat_Rep_List }

class procedure TFrmRepdef_Cat_Rep_List.DoShow(ADataSource: TDataSource);
var
  LFrmRepdef_Cat_Rep_List : TFrmRepdef_Cat_Rep_List;
begin
  LFrmRepdef_Cat_Rep_List := TFrmRepdef_Cat_Rep_List.create(UniGUIApplication.UniApplication);
  with LFrmRepdef_Cat_Rep_List do
  begin
    DataSource := ADataSource;
    Show;
  end;
end;

procedure TFrmRepdef_Cat_Rep_List.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   IQRegFormWrite(self, [self]);
end;

procedure TFrmRepdef_Cat_Rep_List.SetDataSource(const Value: TDataSource);
begin
    FDataSource := Value;
    Query1.DataSource:= FDataSource;
end;

procedure TFrmRepdef_Cat_Rep_List.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [self]);
end;

{ TODO : TGridDrawState not yet converted }
{procedure TFrmRepdef_Cat_Rep_List.IQSearch1CalcCellColors(Sender: TObject;  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
var
  AIsVisible: Boolean;

  procedure ChangeColorTo( AF1, AB1, AF2, AB2: TColor );
  begin
    if AIsVisible then
       begin
         AFont.Color:= AF1;
         ABrush.Color:= AB1;
       end
    else
       begin
         AFont.Color:= AF2;
         ABrush.Color:= AB2;
       end
  end;

begin
  if not (Owner is TFrmRepDef_Cat) then
     EXIT;

  AIsVisible:= TFrmRepDef_Cat(self.Owner).IsReportVisible( Query1REPNAME.asString );

  if not Highlight then
     ChangeColorTo( clBlack, clWhite, clSilver, clWhite )
  else
     ChangeColorTo( clWhite, clHighlight, clWhite, clGray )
end; }

end.
