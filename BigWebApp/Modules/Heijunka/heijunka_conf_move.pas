unit heijunka_conf_move;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniDBGrid; // TUniDBGridColumn

type
  TFrmHeijunkaConfirmMove = class(TUniForm)
    Label1: TUniLabel;
    Bevel1: TUniPanel;
    Label2: TUniLabel;
    Bevel2: TUniPanel;
    Label3: TUniLabel;
    Bevel3: TUniPanel;
    edCount: TUniEdit;
    Panel1: TUniPanel;
    Bevel4: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    lblSource: TUniLabel;
    lblTarget: TUniLabel;
    SR: TIQWebSecurityRegister;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSrcCol: TUniDBGridColumn;
    FTrgCol: TUniDBGridColumn;
    FSrcCount: Integer;
    function GetSrcCol: TUniDBGridColumn;
    procedure SetSrcCol(value : TUniDBGridColumn);
    function GetTrgCol: TUniDBGridColumn;
    procedure SetTrgCol(value : TUniDBGridColumn);
    function GetSrcCount: Integer;
    procedure SetSrcCount(value : integer);
  public
    { Public declarations }
    property SrcCol: TUniDBGridColumn read GetSrcCol write SetSrcCol;
    property TrgCol: TUniDBGridColumn read GetTrgCol write SetTrgCol;
    property SrcCount: integer read GetSrcCount write SetSrcCount;
    class function DoShowModal(ASrcCol, ATrgCol: TUniDBGridColumn; ASrcCount: Integer; var ATrgCount: Integer ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.StringUtils,
  IQMS.Common.Numbers,
  IQMS.Common.Miscellaneous;
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns;


//  class function TFrmHeijunkaConfirmMove.DoShowModal(AOwner: TComponent; ASrcCol, ATrgCol: TwwColumn; ASrcCount: Integer; var ATrgCount: Integer): Boolean;
class function TFrmHeijunkaConfirmMove.DoShowModal(ASrcCol, ATrgCol: TUniDBGridColumn; ASrcCount: Integer; var ATrgCount: Integer): Boolean;
var
  frm : TFrmHeijunkaConfirmMove;
begin
  frm := TFrmHeijunkaConfirmMove.Create(uniGUIApplication.UniApplication);
  frm.SrcCol := ASrcCol;
  frm.TrgCol := ATrgCol;
  frm.SrcCount := ASrcCount;
  Result:= (frm.ShowModal = mrOK);
  if Result then
     ATrgCount:= StrToInt( frm.edCount.Text );
end;

procedure TFrmHeijunkaConfirmMove.btnOKClick(Sender: TObject);
var
  Value: Integer;
begin
  IQAssert( IQMS.Common.Numbers.IsStringValidInteger( edCount.Text, Value ) and (Value > 0), 'Invalid number of cards - operation aborted.' );
  IQAssert( FSrcCount >= Value, 'Moved cards count cannot exceed source count - operation aborted.' );
  ModalResult:= mrOK;
end;

procedure TFrmHeijunkaConfirmMove.FormShow(Sender: TObject);
begin

  lblSource.Caption:= IQMS.Common.StringUtils.StrTran( FSrcCol.Field.AsString, '~', #13 );
  lblTarget.Caption:= IQMS.Common.StringUtils.StrTran( FSrcCol.Field.AsString, '~', #13 );

//  lblSource.Caption:= IQMS.Common.StringUtils.StrTran( FSrcCol.DisplayLabel, '~', #13 );
//  lblTarget.Caption:= IQMS.Common.StringUtils.StrTran( ATrgCol.DisplayLabel, '~', #13 );

  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );
end;

function TFrmHeijunkaConfirmMove.GetSrcCol: TUniDBGridColumn;
begin
  result := FSrcCol;
end;

procedure TFrmHeijunkaConfirmMove.SetSrcCol(value: TUniDBGridColumn);
begin
  FSrcCol := value;
end;

function TFrmHeijunkaConfirmMove.GetTrgCol: TUniDBGridColumn;
begin
  result := FTrgCol;
end;

procedure TFrmHeijunkaConfirmMove.SetTrgCol(value: TUniDBGridColumn);
begin
  FTrgCol := value;
end;

function TFrmHeijunkaConfirmMove.GetSrcCount: Integer;
begin
  result := FSrcCount;
end;

procedure TFrmHeijunkaConfirmMove.SetSrcCount(value: integer);
begin
  FSrcCount := value;
end;



end.
