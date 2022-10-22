unit InvtFltrEx;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  InvtFltr,
  Data.DB,
  InvtClas,
  Data.SqlExpr,
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
  Data.FMTBcd,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  UniGUIApplication,
  uniLabel, Vcl.StdCtrls, uniSplitter, uniButton, uniComboBox, uniDBComboBox;

type
  TFrmInvClassFilterEx = class(TFrmInvClassFilter)
    GroupBox2: TUniGroupBox;
    rbtnIncludeAll: TUniRadioButton;
    rbtnScope: TUniRadioButton;
    edExcepScope: TUniEdit;
    Label3: TUniLabel;
    DBCheckBox1: TUniDBCheckBox;
    TblParams: TFDTable;
    TblParamsCAPACITY_CONSOLIDATE_DIV_REQ: TStringField;
    SrcParams: TDataSource;
    pnlMainInvParamBottom: TUniPanel;
    Panel1: TUniPanel;
    Label4: TUniLabel;
    SQLQuery1: TSQLQuery;
    wwDBLookupComboMfgtype: TUniDBLookupComboBox;
    QryMfgtype: TFDQuery;
    QryMfgtypeMFGTYPE: TStringField;
    MfgtypeSrc: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure EnableMustOrderByControls(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitFrom( AInvClassFilter: TInvClassFilter ); override;
  end;


function GetInventoryClassFilterEx( var AInvClassFilter: TInvClassFilter ):Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls;

function GetInventoryClassFilterEx( var AInvClassFilter: TInvClassFilter ):Boolean;
var
  LFrmInvClassFilterEx : TFrmInvClassFilterEx;
begin
  LFrmInvClassFilterEx := TFrmInvClassFilterEx.Create( UniGUIApplication.UniApplication );

  LFrmInvClassFilterEx.InitFrom( AInvClassFilter );

  Result:= LFrmInvClassFilterEx.ShowModal = mrOK;

  if Result then with AInvClassFilter do
  begin
    Kind          := LFrmInvClassFilterEx.InvClassFilter.Kind;
    InvClass      := LFrmInvClassFilterEx.InvClassFilter.InvClass;
    Division_ID   := LFrmInvClassFilterEx.InvClassFilter.Division_ID;
    Buyer_Code_ID := LFrmInvClassFilterEx.InvClassFilter.Buyer_Code_ID;
    IncludeAll    := LFrmInvClassFilterEx.InvClassFilter.IncludeAll;
    ExceptionScope:= LFrmInvClassFilterEx.InvClassFilter.ExceptionScope;
    Mfgtype       := LFrmInvClassFilterEx.InvClassFilter.Mfgtype;
  end;

end;

procedure TFrmInvClassFilterEx.btnOKClick(Sender: TObject);
var
  tmp: TInvClassFilter;
begin
  TblParams.CheckBrowseMode;


  tmp := InvClassFilter;
  with tmp do
  begin
    IncludeAll:= rbtnIncludeAll.Checked;
    if rbtnScope.Checked then
       ExceptionScope:= StrToFloat(edExcepScope.Text);
    // future use. for now we only refer to this switch on the back end
    ConsolidateDivReq:= TblParamsCAPACITY_CONSOLIDATE_DIV_REQ.asString = 'Y';

    MfgType:= wwDBLookupComboMfgtype.Text;
  end;
  InvClassFilter := tmp;


  inherited;
end;

procedure TFrmInvClassFilterEx.InitFrom(AInvClassFilter: TInvClassFilter);
begin
  with AInvClassFilter do
  begin
    // rbtnIncludeAll.Checked:= TRUE;  // IncludeAll;  02-05-2008 Flexible wants it by default IncludeAll
    // rbtnScope.Checked     := FALSE; // not IncludeAll;
    // 07-13-2009 restored for Alwin
    rbtnIncludeAll.Checked:= IncludeAll;
    rbtnScope.Checked     := not rbtnIncludeAll.Checked;
    if rbtnScope.Checked then
       edExcepScope.Text:= FloatToStr(ExceptionScope);

    if MfgType <> '' then
    begin
      wwDBLookupComboMfgtype.KeyField:= MfgType;
      { TODO -oathite -cWebConvert : Undeclared identifier: 'PerformSearch'
      wwDBLookupComboMfgtype.PerformSearch;}
    end;
  end;

  inherited;
end;


procedure TFrmInvClassFilterEx.EnableMustOrderByControls(Sender: TObject);
begin
  inherited;
  IQMS.Common.Controls.IQEnableControl( edExcepScope, rbtnScope.Checked );
end;

end.
