{Base form for grids that allow jumps from Time Phase Data form}
unit TPD_Jump;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Param,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls;

type
  TFrmTPD_JumpBase = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    PopupMenu1: TUniPopupMenu;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    JumpTo1: TUniMenuItem;
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    FArinvt_ID : Real;
    FWeek_Start: TDateTime;
    FWeek_End  : TDateTime;
    function GetSndopCountOfSimilarToASSY1(AArinvt_ID: Real): Real;
  public
    { Public declarations }
    property Arinvt_ID : Real write FArinvt_ID;
	property Week_Start : TDateTime write FWeek_Start;
  end;

  procedure ShowTDPJump(AArinvt_ID: Real; AWeek_Start: TDateTime);

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dates,
  IQMS.Common.Numbers;

procedure ShowTDPJump(AArinvt_ID: Real; AWeek_Start: TDateTime);
var
  aFrmTPD_JumpBase : TFrmTPD_JumpBase;
begin
  aFrmTPD_JumpBase := TFrmTPD_JumpBase.Create(UniGUIApplication.UniApplication);
  aFrmTPD_JumpBase.Arinvt_ID := AArinvt_ID;
  aFrmTPD_JumpBase.Week_Start := AWeek_Start;

  aFrmTPD_JumpBase.ShowModal;
end;

procedure TFrmTPD_JumpBase.Query1BeforeOpen(DataSet: TDataSet);
var
  AParam: TFDParam;
begin
  with DataSet as TFDQuery do
  begin
    AParam:= Params.FindParam('arinvt_id');
    if Assigned(AParam) then
       AParam.asFloat:= FArinvt_ID;

    AParam:= Params.FindParam('date1');
    if Assigned(AParam) then
       AParam.asDateTime:= FWeek_Start;

    AParam:= Params.FindParam('date2');
    if Assigned(AParam) then
       AParam.asDateTime:= FWeek_End;
  end;
end;

procedure TFrmTPD_JumpBase.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, DBGrid1 ]);
end;

procedure TFrmTPD_JumpBase.UniFormDestroy(Sender: TObject);
begin
  IQRegFormWrite( self, [ self, DBGrid1 ]);
end;

procedure TFrmTPD_JumpBase.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(FALSE, self);
  IQSetTablesActive(TRUE, self);

  if FWeek_Start < IQBoW( Date ) then
     begin
       FWeek_Start:= 0;
       FWeek_End  := FWeek_Start;
     end
  else
     begin
       FWeek_End  := FWeek_Start + 7 - 1/86400;
     end;

  Caption:= Format('Item #: %s, Dates: %s - %s',
                   [ SelectValueByID('itemno', 'arinvt', FArinvt_ID),
                     sIIf( FWeek_Start = 0, 'N/A', DateToStr( FWeek_Start )),
                     DateToStr( FWeek_End   )]);
end;

procedure TFrmTPD_JumpBase.DBGrid1DblClick(Sender: TObject);
begin
  JumpTo1.Click;
end;

procedure TFrmTPD_JumpBase.PopupMenu1Popup(Sender: TObject);
begin
  if Query1.Eof and Query1.Bof then
     ABORT
end;


function TFrmTPD_JumpBase.GetSndopCountOfSimilarToASSY1( AArinvt_ID: Real ): Real;
begin
  // ASSY1 processes support
  Result:= SelectValueFmtAsFloat('select count( distinct sndop_id ) '+
            ' from day_hrs h,                  '+
            '      day_pts p,                  '+
            '      partno,                     '+
            '      arinvt a,                   '+
            '      standard s,                 '+
            '      mfgtype m                   '+
            'where h.id = p.day_hrs_id         '+          //   link day_hrs, day_pts
            '  and p.partno_id = partno.id     '+          //   day_pts and partno
            '  and partno.arinvt_id = %f       '+          //   limit to v_arinvt_id
            '  and partno.arinvt_id = a.id     '+          //   link to arinvt
            '  and NVL(a.mps,''N'') = ''Y''    '+          //   to filter only MPS
            '  and partno.standard_id = s.id   '+          //   get mfg_type
            '  and rtrim(s.mfg_type) = rtrim(m.mfgtype) '+
            '  and mfg.is_looked_up_similar_to_assy1(nvl(m.standard_mfgtype, m.mfgtype)) = 1 ',
            [ AArinvt_ID ]);
end;


end.
