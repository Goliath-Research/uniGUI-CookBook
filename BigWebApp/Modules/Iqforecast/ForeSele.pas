unit ForeSele;

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
  IQMS.WebVcl.Hpick,
  Db,
  Buttons,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniComboBox, uniDBComboBox;

type
  TFrmForecastFilter = class(TUniForm)
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    edFuture: TUniEdit;
    Label2: TUniLabel;
    edPast: TUniEdit;
    GroupBox2: TUniGroupBox;
    rbtnAllCust: TUniRadioButton;
    rbtnOneCust: TUniRadioButton;
    Label6: TUniLabel;
    sbtnSearchCustomer: TUniSpeedButton;
    wwcombCustomer: TUniDBLookupComboBox;
    wwQryCustomer: TFDQuery;
    wwQryCustomerCUSTNO: TStringField;
    wwQryCustomerCOMPANY: TStringField;
    wwQryCustomerARCUSTO_ID: TBCDField;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    PkArcustoPK_HIDE: TStringField;
    GroupBox3: TUniGroupBox;
    rbtnAnyGroup: TUniRadioButton;
    rbtnOneGroup: TUniRadioButton;
    Label3: TUniLabel;
    wwcombGroup: TUniDBLookupComboBox;
    wwQryGroup: TFDQuery;
    wwQryGroupID: TBCDField;
    wwQryGroupCODE: TStringField;
    wwQryGroupDESCRIP: TStringField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SrcCustomer: TDataSource;
    SrcGroup: TDataSource;
    procedure sbtnSearchCustomerClick(Sender: TObject);
    procedure rbtnAllCustClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rbtnAnyGroupClick(Sender: TObject);
   // procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    {FGroup_ID: Real;
    FArcusto_ID: Real;
    FToDate: TDateTime;
    FFromDate: TDateTime;   }
    { Private declarations }
    function MonthsBetween( ADate1, ADate2: TDateTime ): Integer;
    procedure SetArcusto_ID(const Value: Real);
    procedure SetFromDate(const Value: TDateTime);
    procedure SetGroup_ID(const Value: Real);
    procedure SetToDate(const Value: TDateTime);
  published
    procedure Validate;virtual;
  public
    { Public declarations }
    //constructor Create( AOwner: TComponent; AFromDate, AToDate: TDateTime; AArcusto_ID, AGroup_ID: Real );
    property FromDate : TDateTime write SetFromDate;
    property ToDate : TDateTime write SetToDate;
    property Arcusto_ID : Real write SetArcusto_ID;
    property Group_ID : Real write SetGroup_ID;
  end;

procedure DoForecastFilter( var AFromDate, AToDate: TDateTime; var AArcusto_ID, AGroup_ID: Real);

{var
  FrmForecastFilter: TFrmForecastFilter;   }

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook;

{procedure DoForecastFilter( var AFromDate, AToDate: TDateTime; var AArcusto_ID, AGroup_ID: Real);
begin
  with TFrmForecastFilter.Create( Application, AFromDate, AToDate, AArcusto_ID, AGroup_ID ) do
  try
    if ShowModal = mrOK then
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
    end;
  finally
    Free;
  end;
end;   }

procedure DoForecastFilter( var AFromDate, AToDate: TDateTime; var AArcusto_ID, AGroup_ID: Real);
var
  LFrmForecastFilter: TFrmForecastFilter;
begin
  LFrmForecastFilter := TFrmForecastFilter.Create(UniGUIApplication.UniApplication);
  LFrmForecastFilter.FromDate := AFromDate   ;
  LFrmForecastFilter.ToDate := AToDate   ;
  LFrmForecastFilter.Arcusto_ID := AArcusto_ID   ;

  LFrmForecastFilter.rbtnAllCustClick( LFrmForecastFilter.rbtnAllCust );


  if LFrmForecastFilter.rbtnOneCust.Checked then
  begin
    LFrmForecastFilter.wwcombCustomer.KeyField:= SelectValueFmtAsString('select custno from arcusto where id = %f', [ AArcusto_ID ]);
//     LFrmForecastFilter.wwcombCustomer.PerformSearch;
  end;

  LFrmForecastFilter.Group_ID := AGroup_ID   ;

  LFrmForecastFilter.rbtnAnyGroupClick( LFrmForecastFilter.rbtnAnyGroup );

  if LFrmForecastFilter.rbtnOneGroup.Checked then
    begin
      LFrmForecastFilter.wwcombGroup.KeyField:= SelectValueFmtAsString('select code from fr_group where id = %f', [ AGroup_ID ]);
     //LFrmForecastFilter.wwcombGroup.PerformSearch;
    end;

  if LFrmForecastFilter.ShowModal = mrOK then
    begin
      AFromDate  := IncMonth( Date, - StrToInt( LFrmForecastFilter.edPast.Text   ));
      AToDate    := IncMonth( Date, + StrToInt( LFrmForecastFilter.edFuture.Text ));

      if LFrmForecastFilter.rbtnOneCust.Checked then
         AArcusto_ID:= LFrmForecastFilter.wwQryCustomer.FieldByName('arcusto_id').asFloat
      else
         AArcusto_ID:= 0;

      if LFrmForecastFilter.rbtnOneGroup.Checked then
         AGroup_ID:= LFrmForecastFilter.wwQryGroup.FieldByName('id').asFloat
      else
         AGroup_ID:= 0;
    end;
end;

{constructor TFrmForecastFilter.Create( AOwner: TComponent; AFromDate, AToDate: TDateTime; AArcusto_ID, AGroup_ID: Real );
begin
  inherited Create( AOwner );

  IQSetTablesActive( TRUE, self );

  udPast.Position  := MonthsBetween( AFromDate, Date );
  udFuture.Position:= MonthsBetween( Date, AToDate );

  if AArcusto_ID = 0 then rbtnAllCust.Checked:= TRUE else rbtnOneCust.Checked:= TRUE;
  rbtnAllCustClick( rbtnAllCust );

  if rbtnOneCust.Checked then
  begin
     wwcombCustomer.LookupValue:= SelectValueFmtAsString('select custno from arcusto where id = %f', [ AArcusto_ID ]);
     wwcombCustomer.PerformSearch;
  end;

  if AGroup_ID = 0 then rbtnAnyGroup.Checked:= TRUE else rbtnOneGroup.Checked:= TRUE;
  rbtnAnyGroupClick( rbtnAnyGroup );

  if rbtnOneGroup.Checked then
  begin
     wwcombGroup.LookupValue:= SelectValueFmtAsString('select code from fr_group where id = %f', [ AGroup_ID ]);
     wwcombGroup.PerformSearch;
  end;
end;     }

function TFrmForecastFilter.MonthsBetween( ADate1, ADate2: TDateTime ): Integer;
var
  D1, M1, Y1: Word;
  D2, M2, Y2: Word;
begin
  DecodeDate( ADate1, Y1, M1, D1);
  DecodeDate( ADate2, Y2, M2, D2);

  if Y1 < Y2 then
    Result:= (Y2 - Y1 - 1) * 12 + (12 - M1) + M2
  else
    Result:= M2 - M1;
end;

procedure TFrmForecastFilter.sbtnSearchCustomerClick(Sender: TObject);
begin
  with PkArcusto do
    if Execute then
    begin
      wwcombCustomer.KeyField:= GetValue('custno');
      //wwcombCustomer.PerformSearch;
    end
    else
      Abort;
end;

procedure TFrmForecastFilter.SetArcusto_ID(const Value: Real);
begin
  if Value = 0 then
     rbtnAllCust.Checked:= TRUE
  else
     rbtnOneCust.Checked:= TRUE;
end;

procedure TFrmForecastFilter.SetFromDate(const Value: TDateTime);
begin
  { TODO -oysingh -cWeb Convert : No corresponding uni component for TUpDown component. }
  //udPast.Position  := MonthsBetween( Value, Date );
end;

procedure TFrmForecastFilter.SetGroup_ID(const Value: Real);
begin
  if Value = 0
  then rbtnAnyGroup.Checked:= TRUE
  else rbtnOneGroup.Checked:= TRUE;
end;

procedure TFrmForecastFilter.SetToDate(const Value: TDateTime);
begin
  { TODO -oysingh -cWeb Convert : No corresponding uni component for TUpDown component. }
  //udFuture.Position:= MonthsBetween( Date, Value );
end;

procedure TFrmForecastFilter.UniFormShow(Sender: TObject);
begin
    IQSetTablesActive( TRUE, self );
end;

{procedure TFrmForecastFilter.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );

  udPast.Position  := MonthsBetween( AFromDate, Date );
  udFuture.Position:= MonthsBetween( Date, AToDate );

  if AArcusto_ID = 0 then rbtnAllCust.Checked:= TRUE else rbtnOneCust.Checked:= TRUE;
  rbtnAllCustClick( rbtnAllCust );

  if rbtnOneCust.Checked then
  begin
     wwcombCustomer.LookupValue:= SelectValueFmtAsString('select custno from arcusto where id = %f', [ AArcusto_ID ]);
     wwcombCustomer.PerformSearch;
  end;

  if AGroup_ID = 0 then rbtnAnyGroup.Checked:= TRUE else rbtnOneGroup.Checked:= TRUE;
  rbtnAnyGroupClick( rbtnAnyGroup );

  if rbtnOneGroup.Checked then
  begin
     wwcombGroup.LookupValue:= SelectValueFmtAsString('select code from fr_group where id = %f', [ AGroup_ID ]);
     wwcombGroup.PerformSearch;
  end;
end;      }

procedure TFrmForecastFilter.rbtnAllCustClick(Sender: TObject);
begin
  IQEnableControl( wwcombCustomer, rbtnOneCust.Checked );
  IQEnableControl( sbtnSearchCustomer, rbtnOneCust.Checked );
end;

procedure TFrmForecastFilter.btnOKClick(Sender: TObject);
begin
 Validate;
 ModalResult:= mrOK;
end;

procedure TFrmForecastFilter.Validate;
begin
  if rbtnOneCust.Checked and (wwcombCustomer.KeyField = '') then
     raise Exception.Create('Customer is not assigned');

  if rbtnOneGroup.Checked and (wwcombGroup.KeyField = '') then
     raise Exception.Create('Forecast Group is not assigned');

  if StrToInt( edPast.Text ) < 0 then
     raise Exception.Create('Number of Past months must be greater than -1');

  if StrToInt( edFuture.Text ) < 0 then
     raise Exception.Create('Number of Future months must be greater than -1');
end;


procedure TFrmForecastFilter.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmForecast{CHM}, iqhtmForecast{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmForecastFilter.rbtnAnyGroupClick(Sender: TObject);
begin
  IQEnableControl( wwcombGroup, rbtnOneGroup.Checked );
end;

end.
