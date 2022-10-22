unit AvDtlBas;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Menus,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu;

type
  TFrmFGAvailBase = class(TUniForm)
    DBGrid1: TUniDBGrid;
    Query1: TFDQuery;
    DataSource1: TDataSource;
    PopupMenu1: TUniPopupMenu;
    PnlTouchScreenButtons: TUniPanel;
    PnlTouchScreenButtonsInner: TUniPanel;
    btnTouchScreenClose: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTouchScreenCloseClick(Sender: TObject);
  private
    procedure SetArinvt_ID(const Value: Real);
    procedure SetDate(const Value: TDateTime);
    procedure SetDivision_ID(const Value: Real);
    { Private declarations }
  protected
    FInit_Arinvt_ID  : Real;
    FInit_Tran_Date  : TDateTime;
    FInit_Division_ID: Real;

    procedure AssignQueryParams; virtual;
  public
    { Public declarations }
    property Arinvt_ID:Real write SetArinvt_ID;
    property Date:TDateTime write SetDate;
    property Division_ID: Real write SetDivision_ID;
  end;

  TFGAvailDetailClass = class of TFrmFGAvailBase;

procedure DoFGAvailDetail( AReference: TFGAvailDetailClass; AArinvt_ID:Real; ADate:TDateTime; ADivision_ID: Real = -1 );


implementation

{$R *.DFM}

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  fgavail_rscstr
  { TODO -oSanketG -cWebConvert : Need to revisit
  touchscrn}
  ;

procedure DoFGAvailDetail( AReference: TFGAvailDetailClass; AArinvt_ID:Real; ADate:TDateTime; ADivision_ID: Real = -1 );
var
  LFrmFGAvailBase: TFrmFGAvailBase;
begin
  LFrmFGAvailBase := AReference.Create(UniApplication);
  LFrmFGAvailBase.Arinvt_ID := AArinvt_ID;
  LFrmFGAvailBase.Date := ADate;
  LFrmFGAvailBase.Division_ID := ADivision_ID;
  LFrmFGAvailBase.Show();
end;

procedure TFrmFGAvailBase.FormShow(Sender: TObject);
begin
  Caption:= Format( fgavail_rscstr.cTXT0000006 {'Details for %s, on %s'},
                    [ SelectValueFmtAsString( 'select itemno from arinvt where id = %f', [ FInit_Arinvt_ID ]),
                      DateToStr( FInit_Tran_Date )]);
  AssignQueryParams;

  IQSetTablesActive(TRUE, self);
  PnlTouchScreenButtons.Visible := IQMS.Common.ApplicationSet.IsTouchScreen;
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
    IQRegFormRead( self, [ self, DBGrid1 ])
  else
    begin
      { TODO -oSanketG -cWebConvert : Need to revisit }
      //touchscrn.ApplyTouchscreenFont(Self);
      Width := 800;
      Height := 600;
      { TODO -oSanketG -cWebConvert : Need to revisit, getting Incompatible types: 'TForm' and 'TFrmFGAvailBase'}
      //IQMS.Common.Controls.CenterForm(Self, True);
    end;
end;

procedure TFrmFGAvailBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
    IQRegFormWrite( self, [ self, DBGrid1 ]);
  Action:= caFree;
end;

procedure TFrmFGAvailBase.PopupMenu1Popup(Sender: TObject);
begin
  // 02/04/2015 (Byron) No popup for touch-screen
  // EIQ-4750 AssyData - add Inventory Availability SER 6306
  if IQMS.Common.ApplicationSet.IsTouchScreen then
    System.SysUtils.Abort;
end;

procedure TFrmFGAvailBase.SetArinvt_ID(const Value: Real);
begin
  FInit_Arinvt_ID := Value;
end;

procedure TFrmFGAvailBase.SetDate(const Value: TDateTime);
begin
  FInit_Tran_Date := Value;
end;

procedure TFrmFGAvailBase.SetDivision_ID(const Value: Real);
begin
  FInit_Division_ID := Value;
end;

procedure TFrmFGAvailBase.AssignQueryParams;
begin
  // if Assigned(DataSource1.DataSet) then with DataSource1.DataSet as TFDQuery do
  // begin
  //   Close;
  //   ParamByName('arinvt_id').asFloat   := FInit_Arinvt_ID;
  //   ParamByName('tran_date').asDateTime:= FInit_Tran_Date;
  //   if Params.FindParam('division_id') <> nil then
  //   begin
  //     //if FInit_Division_ID > 0 then
  //     ParamByName('division_id').asFloat:= FInit_Division_ID  {used in TFrmFGAvailDetailWO in AvDtlWO and TFrmFGAvailDetailBackLog in AvDtl_BL}
  //     //else
  //     //   ParamByName('division_id').Clear;
  //   end;
  // end;
  if Assigned(DataSource1.DataSet) then
  begin
     DataSource1.DataSet.Close;
     AssignQueryParamValue(DataSource1.DataSet, 'arinvt_id',   FInit_Arinvt_ID );
     AssignQueryParamValue(DataSource1.DataSet, 'tran_date',   FInit_Tran_Date );
     AssignQueryParamValue(DataSource1.DataSet, 'division_id', FInit_Division_ID);  {used in TFrmFGAvailDetailWO in AvDtlWO and TFrmFGAvailDetailBackLog in AvDtl_BL}
  end;

end;

procedure TFrmFGAvailBase.btnTouchScreenCloseClick(Sender: TObject);
begin
  Close;
end;

end.
