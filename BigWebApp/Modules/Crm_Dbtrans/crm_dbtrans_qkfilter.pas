unit crm_dbtrans_qkfilter;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Vcl.Buttons,
  Vcl.Menus,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniMemo,
  uniPanel,
  uniDateTimePicker,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox;

type
  TFrmCRMDbTransFilterField = class(TUniForm)
    Panel2: TUniPanel;
    PnlFilterEditor: TUniPanel;
    lblPrompt: TUniLabel;
    lblFilter: TUniLabel;
    Label1: TUniLabel;
    cmbDate: TUniDateTimePicker;
    cmbUniaryOperator: TUniDBComboBox;
    edtFieldValue: TUniEdit;
    PMain: TUniPopupMenu;
    EditExpression1: TUniMenuItem;
    PnlButtons: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnClear: TUniBitBtn;
    PnlFilterExpression: TUniPanel;
    Label3: TUniLabel;
    Bevel1: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    lblSQLWhere: TUniLabel;
    PnlSQLExpression: TUniPanel;
    edtFilterExpression: TUniMemo;
    sbtnShowHideSQL: TUniSpeedButton;
    procedure UniaryOperatorChange(Sender: TObject);
    procedure edtFieldValueChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure cmbDateChange(Sender: TObject);
    procedure EditExpression1Click(Sender: TObject);
    procedure sbtnShowHideSQLClick(Sender: TObject);
  private
    { Private declarations }
    //FIsText: Boolean;
    FDataType: String; // oracle datatype
    procedure BuildFilterExpression;
    procedure ParseFilterExpression( const AValue: String );
    procedure ShowHideSQL( AShow: Boolean );
  public
    { Public declarations }
    constructor Create( AOwner: TComponent; AFieldName: String; AValue: String; ADataType: String );
  end;

  function GetFieldFilter( AFieldName: String; var AValue: String; ADataType: String ): Boolean;

var
  FrmCRMDbTransFilterField: TFrmCRMDbTransFilterField;

implementation

{$R *.DFM}

uses
  IQMS.Common.StringUtils,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  crm_rscstr;

function GetFieldFilter( AFieldName: String; var AValue: String; ADataType: String ): Boolean;
begin
     with TFrmCRMDbTransFilterField.Create( Application, AFieldName, AValue, ADataType ) do
      try
         Result := ( ShowModal = mrOk );
         if Result then AValue := edtFilterExpression.Text;
      finally
         Free;
      end;
end;

constructor TFrmCRMDbTransFilterField.Create(AOwner: TComponent;
  AFieldName: String; AValue: String; ADataType: String );
begin
     FDataType := ADataType;
     inherited Create(AOwner);
     Caption := Format( crm_rscstr.cTXT0001190 {'Filter Field: %s'}, [AFieldName] );
     edtFieldValue.Visible := not ( FDataType = 'DATE' );
     cmbDate.Visible       := ( FDataType = 'DATE' );

     ShowHideSQL(FALSE);
     IQEnableControl( edtFilterExpression, FALSE ); // default state
     PnlSQLExpression.Color := clBtnFace;
     edtFilterExpression.ParentColor := TRUE;

     edtFilterExpression.Text := AValue;
     ParseFilterExpression(AValue);
     lblSQLWhere.Caption := Format( 'WHERE %s', [AFieldName] );

     if ( ADataType = 'DATE' ) and ( cmbDate.Visible ) then ActiveControl := cmbDate
     else if ( edtFieldValue.Visible ) then ActiveControl := edtFieldValue;
end;

procedure TFrmCRMDbTransFilterField.UniaryOperatorChange(
  Sender: TObject);
begin
     BuildFilterExpression;
end;

procedure TFrmCRMDbTransFilterField.edtFieldValueChange(Sender: TObject);
begin
     BuildFilterExpression;
end;

procedure TFrmCRMDbTransFilterField.BuildFilterExpression;
var
   AUniary, AValue, AFilter: String;
begin
     AUniary := cmbUniaryOperator.Text;

     if ( FDataType = 'CHAR'    ) or
        ( FDataType = 'VARCHAR' ) or
        ( FDataType = 'VARCHAR2') then
        begin // text
             AValue  := edtFieldValue.Text;
             AValue  := StrTran( AValue, '"', '''' );
             AValue  := Format( '''%s''', [FixStr( AValue )] );
             AValue  := StrTran( AValue, '''''''', '''' );
        end
     else if ( FDataType = 'DATE' ) then
        begin
             AValue := Format( 'to_date( ''%s'', ''MM/DD/RRRR'' )', [FormatDateTime( 'mm/dd/yyyy', cmbDate.Date )] );
        end
     else  // numeric
        begin
             AValue  := edtFieldValue.Text;
             AValue  := StrTran( AValue, '"', '' );
             AValue  := StrTran( AValue, '''', '' );
        end;
     AFilter := Format( '%s (%s)', [AUniary, AValue] );
     edtFilterExpression.Text := AFilter;
end;

procedure TFrmCRMDbTransFilterField.ParseFilterExpression(
  const AValue: String);
var
   AUniary, AFilter: String;
   i1, i2: Integer;
   ADate: TDateTime;
begin
     // Redisplay the filter expression
     AFilter := Trim( AValue );
     if (AFilter = '' ) then Exit;


     // Initial values
     i1:=0;
     i2:=Length(AValue);

     AUniary := LeftStr( AFilter, 1 ); // iqstring
     AFilter  := RightStr( AFilter, Length( AFilter ) - 1);
     AFilter  := StrTran( AFilter, '(', '' );
     AFilter  := StrTran( AFilter, ')', '' );
     if ( FDataType = 'DATE' ) then
        begin
             AFilter := StrTran( AFilter, 'to_date', '' );
             AFilter := StrTran( AFilter, 'MM/DD/RRRR', '' );
             AFilter := StrTran( AFilter, ',', '' );
             AFilter  := StrTran( AFilter, '''', '' );
        end;
     AFilter  := Trim( AFilter );
     if ( LeftStr( AFilter, 1 ) = '''' ) then i1:=2;
     if ( RightStr( AFilter, 1 ) = '''' ) then i2:=Length(AFilter)-2;
     AFilter  := Copy(AFilter,i1,i2);
     AFilter  := StrTran( AFilter, '''''', '''' );

     cmbUniaryOperator.Text := AUniary;


     if ( FDataType = 'DATE' ) then
        begin
             if IsStringValidDate( AFilter, ADate ) then  //iqdate
                cmbDate.Date := ADate;
        end;




     edtFieldValue.Text := Trim( AFilter );

end;

procedure TFrmCRMDbTransFilterField.btnClearClick(Sender: TObject);
begin
     edtFilterExpression.Clear;
end;

procedure TFrmCRMDbTransFilterField.cmbDateChange(Sender: TObject);
begin
     BuildFilterExpression;
end;

procedure TFrmCRMDbTransFilterField.EditExpression1Click(Sender: TObject);
begin
     IQEnableControl( edtFilterExpression, TRUE );
     PnlSQLExpression.Color := clWhite;
     edtFilterExpression.ParentColor := TRUE;
end;

procedure TFrmCRMDbTransFilterField.sbtnShowHideSQLClick(Sender: TObject);
begin
     Application.ProcessMessages;
     ShowHideSQL(sbtnShowHideSQL.Down);
end;

procedure TFrmCRMDbTransFilterField.ShowHideSQL(AShow: Boolean);
const cOffSet = 26;
begin
Exit;
  PnlFilterExpression.Visible := AShow;
  if AShow then
     Height := PnlButtons.Height +  PnlFilterExpression.Height + cOffSet
  else
     Height := PnlButtons.Height +cOffSet;
end;

end.
