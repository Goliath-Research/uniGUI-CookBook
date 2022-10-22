unit ExcelSele;

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
  ForeSele,
  IQMS.WebVcl.Hpick,
  DB,
  StdCtrls,
  Buttons,
  ComCtrls,
  ExtCtrls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniRadioButton,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniPanel, uniComboBox, uniDBComboBox,
  uniEdit;

type
  TFrmExcelFilter = class(TFrmForecastFilter)
    GroupBox4: TUniGroupBox;
    Label4: TUniLabel;
    sbtnSearchShipTo: TUniSpeedButton;
    rbtnAllShipTo: TUniRadioButton;
    rbtnOneShipTo: TUniRadioButton;
    wwcombShipTo: TUniDBLookupComboBox;
    wwQryShip_To_Id: TFDQuery;
    wwQryShip_To_IdATTN: TStringField;
    wwQryShip_To_IdID: TBCDField;
    PkShipTo: TIQWebHPick;
    PkShipToATTN: TStringField;
    PkShipToADDR1: TStringField;
    PkShipToCITY: TStringField;
    PkShipToSTATE: TStringField;
    PkShipToCOUNTRY: TStringField;
    PkShipToZIP: TStringField;
    PkShipToPHONE_NUMBER: TStringField;
    PkShipToPRIME_CONTACT: TStringField;
    PkShipToID: TBCDField;
    PkShipToPK_HIDE: TStringField;
    SrcShip_To_Id: TDataSource;
    procedure rbtnAllShipToClick(Sender: TObject);
    procedure sbtnSearchCustomerClick(Sender: TObject);
    procedure rbtnAllCustClick(Sender: TObject);
    {procedure wwcombCustomerCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);}
    procedure sbtnSearchShipToClick(Sender: TObject);
    procedure PkShipToBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    FGroup_ID: Real;
    FArcusto_ID: Real;
    FToDate: TDateTime;
    FShip_To_Id: Real;
    FFromDate: TDateTime;
    { Private declarations }
    procedure Validate;override;
    procedure ResetShipToQuery;
    procedure SetArcusto_ID(const Value: Real);
    procedure SetFromDate(const Value: TDateTime);
    procedure SetGroup_ID(const Value: Real);
    procedure SetShip_To_Id(const Value: Real);
    procedure SetToDate(const Value: TDateTime);
  public
    { Public declarations }
    property FromDate: TDateTime write SetFromDate;
    property ToDate: TDateTime write SetToDate;
    property Arcusto_ID: Real write SetArcusto_ID;
    property Group_ID: Real write SetGroup_ID;
    property Ship_To_Id: Real write SetShip_To_Id;
  end;

function DoExcelFilter( var AFromDate, AToDate: TDateTime; var AArcusto_ID, AGroup_ID, AShip_To_Id: Real):boolean;



implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.Controls;
{$R *.dfm}

function DoExcelFilter( var AFromDate, AToDate: TDateTime; var AArcusto_ID, AGroup_ID, AShip_To_Id: Real):boolean;
var
  FrmExcelFilter: TFrmExcelFilter;
begin
  FrmExcelFilter := TFrmExcelFilter.Create( uniGUIApplication.UniApplication );

  with FrmExcelFilter do
  try
    FromDate := AFromDate;
    ToDate := AToDate;
    Arcusto_ID := AArcusto_ID;
    Group_ID:= AGroup_ID;
    Ship_To_Id := AShip_To_Id;
    ShowModal;
    result := ModalResult = mrOK;
    if ModalResult = mrOK then
    begin
      AFromDate  := IncMonth( Date, - StrToInt( edPast.Text   ));
      AToDate    := IncMonth( Date, + StrToInt( edFuture.Text ));

      if rbtnOneCust.Checked then
         AArcusto_ID:= wwQryCustomer.FieldByName('arcusto_id').asFloat
      else
         AArcusto_ID:= 0;

      if rbtnOneGroup.Checked then
         AGroup_ID:= wwQryGroup.FieldByName('id').asFloat
      else
         AGroup_ID:= 0;

      if (rbtnOneShipTo.Checked) and (wwcombShipTo.text <> '') then
         AShip_To_ID:= wwQryShip_To_Id.FieldByName('id').asFloat
      else
         AShip_To_ID:= 0;
    end;
  finally
//    Free;
  end;
end;

procedure TFrmExcelFilter.UniFormCreate(Sender: TObject);
begin
  inherited;
  if FShip_To_ID = 0 then rbtnAllShipTo.Checked:= TRUE else rbtnOneShipTo.Checked:= TRUE;
  rbtnAllShipToClick( rbtnAllShipTo );


  if rbtnOneCust.Checked then
  begin
    wwQryShip_To_Id.Close;
//    wwQryShip_To_Id.ParamByName('aId').asFloat := wwQryCustomerARCUSTO_ID.asFloat;
    AssignQueryParamValue(wwQryShip_To_Id, 'aId', wwQryCustomerARCUSTO_ID.asFloat);
    wwQryShip_To_Id.Open;
    if FShip_To_ID <> 0 then
    begin
      if SelectValueFmtAsFloat('select id from ship_to where arcusto_id = %f and id = %f', [wwQryCustomerARCUSTO_ID.asFloat, FShip_To_ID]) <> 0 then
        rbtnOneShipTo.Checked:= TRUE
      else
        rbtnAllShipTo.Checked:= TRUE;
    end
    else
      rbtnAllShipTo.Checked:= TRUE;
  end
  else
  begin
    rbtnAllShipTo.Checked:= TRUE;
    wwQryShip_To_Id.Close;
  end;

  rbtnAllShipToClick( rbtnAllShipTo );
  IQEnableControl( rbtnOneShipTo, ((rbtnOneCust.Checked) and  (wwcombCustomer.text <> '')));


  if rbtnOneShipTo.Checked then
  begin
//     wwcombShipTo.LookupValue:= FShip_To_ID;
     wwQryShip_To_Id.Locate('ID', FShip_To_ID, []);
     wwcombShipTo.text:= wwQryShip_To_IdATTN.asString;
//     wwcombShipTo.PerformSearch;
  end;
end;

procedure TFrmExcelFilter.Validate;
begin
  inherited;
  if rbtnOneShipTo.Checked and (wwcombShipTo.text = '') then
     raise Exception.Create('Ship To is not assigned');
end;


procedure TFrmExcelFilter.rbtnAllShipToClick(Sender: TObject);
begin
//  IQEnableControl( wwcombShipTo, rbtnOneShipTo.Checked );
//  IQEnableControl( sbtnSearchShipTo, rbtnOneShipTo.Checked );

  IQEnableControl( wwcombShipTo, ((rbtnOneCust.Checked) and (rbtnOneShipTo.Checked) and  (wwcombCustomer.text <> '')));
  IQEnableControl( sbtnSearchShipTo, ((rbtnOneCust.Checked) and(rbtnOneShipTo.Checked) and  (wwcombCustomer.text <> '')) );


  if rbtnAllShipTo.Checked then wwcombShipTo.text:= '';

end;

procedure TFrmExcelFilter.sbtnSearchCustomerClick(Sender: TObject);
begin
  inherited;
  ResetShipToQuery;
  IQEnableControl( rbtnOneShipTo, ((rbtnOneCust.Checked) and  (wwcombCustomer.text <> '')));
end;

procedure TFrmExcelFilter.rbtnAllCustClick(Sender: TObject);
begin
  inherited;
  rbtnAllShipTo.Checked:= TRUE;
  rbtnAllShipToClick( rbtnAllShipTo );

  IQEnableControl( rbtnOneShipTo, ((rbtnOneCust.Checked) and  (wwcombCustomer.text <> '')));

end;

{procedure TFrmExcelFilter.wwcombCustomerCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  IQEnableControl( rbtnOneShipTo, ((rbtnOneCust.Checked) and  (wwcombCustomer.text <> '')));
  ResetShipToQuery;
end;}

procedure TFrmExcelFilter.ResetShipToQuery;
begin
  wwQryShip_To_Id.Close;
//  wwQryShip_To_Id.ParamByName('aId').asFloat := wwQryCustomerARCUSTO_ID.asFloat;
  AssignQueryParamValue(wwQryShip_To_Id, 'aId', wwQryCustomerARCUSTO_ID.asFloat);
  wwQryShip_To_Id.Open;
  wwcombShipTo.text:= '';
  rbtnAllShipTo.Checked:= TRUE;
  rbtnAllShipToClick( rbtnAllShipTo );
end;


procedure TFrmExcelFilter.sbtnSearchShipToClick(Sender: TObject);
begin
  with PkShipTo do
    if Execute then
    begin
       wwQryShip_To_Id.Locate('ID', GetValue('ID'), []);
       wwcombShipTo.text:= wwQryShip_To_IdATTN.asString;
    end
    else
      Abort;

end;

procedure TFrmExcelFilter.SetArcusto_ID(const Value: Real);
begin
  FArcusto_ID := Value;
end;

procedure TFrmExcelFilter.SetFromDate(const Value: TDateTime);
begin
  FFromDate := Value;
end;

procedure TFrmExcelFilter.SetGroup_ID(const Value: Real);
begin
  FGroup_ID := Value;
end;

procedure TFrmExcelFilter.SetShip_To_Id(const Value: Real);
begin
  FShip_To_Id := Value;
end;

procedure TFrmExcelFilter.SetToDate(const Value: TDateTime);
begin
  FToDate := Value;
end;

procedure TFrmExcelFilter.PkShipToBeforeOpen(DataSet: TDataSet);
begin
//  TFDQuery(DataSet).ParamByName('aID').asFloat := wwQryCustomerARCUSTO_ID.asFloat;
  AssignQueryParamValue(DataSet, 'aId', wwQryCustomerARCUSTO_ID.asFloat);
end;


end.
