unit inv_proprietary;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  vcl.Wwdbdatetimepicker,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmInvProprietary = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    wwDBComboDlg1: TUniEdit;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    wwDBDateTimePicker2: TUniDBDateTimePicker;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoID: TBCDField;
    PkArcustoPK_HIDE: TStringField;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtID: TBCDField;
    QryArinvtARCUSTO_ID: TBCDField;
    QryArinvtPROPRIETARY_EFFECT_DATE: TDateTimeField;
    QryArinvtPROPRIETARY_DEACTIVE_DATE: TDateTimeField;
    QryArinvtCustNo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure QryArinvtCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure wwDBComboDlg1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Integer;
    procedure Validate;
    procedure SetArinvt_ID(const Value: Integer);
  public
    { Public declarations }
    property Arinvt_ID: Integer  write SetArinvt_ID;
    class function DoShowModal( AArinvt_ID: Integer): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm;

{ TFrmInvProprietary }

procedure TFrmInvProprietary.btnOKClick(Sender: TObject);
begin
  Validate;
  QryArinvt.CheckBrowseMode;
  ModalResult:= mrOK;
end;

class function TFrmInvProprietary.DoShowModal(AArinvt_ID: Integer): Boolean;
var
  LFrmInvProprietary : TFrmInvProprietary;
begin
  LFrmInvProprietary := TFrmInvProprietary.Create(UniGUIApplication.UniApplication);
  LFrmInvProprietary.Arinvt_ID := AArinvt_ID;
  Result:= LFrmInvProprietary.ShowModal = mrOK;
end;

procedure TFrmInvProprietary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmInvProprietary.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('arinvt_id').Value := FArinvt_ID;
end;

procedure TFrmInvProprietary.QryArinvtCalcFields(DataSet: TDataSet);
begin
  if QryArinvtARCUSTO_ID.asInteger > 0 then
     QryArinvtCustNo.asString:= SelectValueByID('custno', 'arcusto', QryArinvtARCUSTO_ID.asInteger );
end;

procedure TFrmInvProprietary.SetArinvt_ID(const Value: Integer);
begin
  FArinvt_ID := Value;
end;

procedure TFrmInvProprietary.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmInvProprietary.wwDBComboDlg1CustomDlg(Sender: TObject);
begin
  with PkArcusto do
  if Execute then
  begin
    QryArinvt.Edit;
    QryArinvtARCUSTO_ID.asInteger:= GetValue('id');
  end;
end;

procedure TFrmInvProprietary.wwDBComboDlg1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  CheckClearWWDBComboDlg( Sender, Key, QryArinvtARCUSTO_ID );
end;

procedure TFrmInvProprietary.Validate;
begin
  if QryArinvtPROPRIETARY_EFFECT_DATE.asDateTime = 0 then
     begin
       IQAssert( QryArinvtPROPRIETARY_DEACTIVE_DATE.asDateTime = 0, 'Invalid effective date - operation aborted');
     end
  else
     begin
       IQAssert( QryArinvtARCUSTO_ID.asInteger > 0, 'Default customer must be assigned - operation aborted');
       IQAssert( (QryArinvtPROPRIETARY_DEACTIVE_DATE.asDateTime = 0)
                 or
                 ( QryArinvtPROPRIETARY_DEACTIVE_DATE.asDateTime > QryArinvtPROPRIETARY_EFFECT_DATE.asDateTime ),
                 'Invalid Effective and/or Inactive date - operation aborted');
     end;
end;

end.
