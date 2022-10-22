unit WhereUsd_WO;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
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
  Vcl.Controls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmWhereUsedWO = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1MFGNO: TStringField;
    Query1ITEMNO: TStringField;
    Query1DESCRIP: TStringField;
    Query1DESCRIP2: TStringField;
    Query1REV: TStringField;
    Query1ORIGIN: TStringField;
    Query1MFG_TYPE: TStringField;
    Query1FIRM: TStringField;
    PopupMenu1: TUniPopupMenu;
    JumptoWorkorder1: TUniMenuItem;
    IQJumpWO: TIQWebJump;
    Query1SCHEDULED_ON: TStringField;
    Query1ID: TBCDField;
    Query1EPLANT_ID: TBCDField;
    Query1CYCLES_REQ: TBCDField;
    Query1BUCKET: TBCDField;
    Query1MAX_LEVEL: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure JumptoWorkorder1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FThisStandard_ID: Real;
    FArinvt_ID      : Real;
    procedure AssignCaption;
    procedure SetThisStandard_ID(const Value: Real);
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow( AThisStandard_ID, AArinvt_ID: Real );
    property ThisStandard_ID: Real write SetThisStandard_ID;
    property Arinvt_ID: Real write SetArinvt_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  inv_rscstr;

{ TFrmWhereUsedWO }

class procedure TFrmWhereUsedWO.DoShow( AThisStandard_ID, AArinvt_ID: Real );
var
  LFrmWhereUsedWO:  TFrmWhereUsedWO;
begin
  LFrmWhereUsedWO := TFrmWhereUsedWO.Create( UniGUIApplication.UniApplication );

  LFrmWhereUsedWO.ThisStandard_ID := AThisStandard_ID;
  LFrmWhereUsedWO.Arinvt_ID := AArinvt_ID;
  LFrmWhereUsedWO.Show;
end;

procedure TFrmWhereUsedWO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmWhereUsedWO.AssignCaption;
begin
  if FThisStandard_ID > 0 then
     self.Caption:= Format(inv_rscstr.cTXT0000128 {'Where Used Work Orders [MFG # %s]'}, [ SelectValueByID('mfgno', 'standard', FThisStandard_ID)])
  else
     self.Caption:= Format(inv_rscstr.cTXT0000129 {'Where Used All Work Orders [Item # %s]'}, [ SelectValueByID('itemno', 'arinvt', FArinvt_ID) ]);
end;

procedure TFrmWhereUsedWO.Query1BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('standard_id').Value := FThisStandard_ID;
    ParamByName('arinvt_id').Value := FArinvt_ID;
  end;
end;

procedure TFrmWhereUsedWO.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmWhereUsedWO.SetThisStandard_ID(const Value: Real);
begin
  FThisStandard_ID := Value;
end;

procedure TFrmWhereUsedWO.UniFormShow(Sender: TObject);
begin
  AssignCaption;

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmWhereUsedWO.JumptoWorkorder1Click(Sender: TObject);
begin
  IQJumpWO.Execute;
end;

end.
