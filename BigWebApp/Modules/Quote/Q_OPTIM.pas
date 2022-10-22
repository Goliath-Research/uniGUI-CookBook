unit Q_Optim;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Q_Share,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmOptimize = class(TUniForm)
    OptimGrid: TUniStringGrid;
    Panel1: TUniPanel;
    lblOptimizeBy: TUniLabel;
    ComboBox1: TUniComboBox;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure OptimGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FCalcGrid : TUniStringGrid;
    procedure LoadQuan;
    procedure LoadOptimizedCol;
    function GetOptimizationColumn: Integer;
    function MarkChanged: Boolean;
    procedure SetCalcGrid(const Value: TUniStringGrid);
  public
    { Public declarations }
    OptimizationKind : TOptimizationKind;
    function SilentMarkChanged( nQuoteID : Real; AOptimKind : integer; AOldOptmRate : Real ) : Boolean;
    property CalcGrid : TUniStringGrid write SetCalcGrid;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;


procedure TFrmOptimize.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

function TFrmOptimize.MarkChanged: Boolean;
var
  I     : Integer;
  ACol  : Integer;
  S1, S2: string;
  N1, N2: Real;
begin
  Result:= FALSE;
  ACol:= GetOptimizationColumn;
  if ACol > -1 then
    for I:= 1 to FCalcGrid.ColCount - 1 do
    begin
       S1:= StrTran( Trim( OptimGrid.Cells[ 1, I-1 ] ),  ',',  '');
       S2:= StrTran( Trim( FCalcGrid.Cells [ I, ACol ]),  ',',  '');

       try N1:= StrToFloat(S1); except N1:= 0; end;  
       try N2:= StrToFloat(S2); except N2:= 0; end;

       //if CompareText(S1,S2) = 0 then
       //   OptimGrid.Objects[ 1, I-1 ]:= NIL
       //else if (S2 = '') and (StrToFloat(S1) = 0) then
       //   OptimGrid.Objects[ 1, I-1 ]:= NIL
       //else
       //  begin
       //     OptimGrid.Objects[ 1, I-1 ]:= Pointer(1);
       //     Result:= TRUE;
       //  end;

{ TODO -oGPatil -cWebConvert : TUniStringGrid does not contain Objects
       if (N1 = N2) then  // 04-10-2007  and (N2 = 0) then
          OptimGrid.Objects[ 1, I-1 ]:= NIL
       else
          begin
             OptimGrid.Objects[ 1, I-1 ]:= Pointer(1);
             Result:= TRUE;
          end;    }
    end;
end;

procedure TFrmOptimize.LoadQuan;
var
  I:Integer;
begin
  OptimGrid.RowCount:= FCalcGrid.ColCount - 1;  // minus "Quantity" heading
  for I:= 1 to FCalcGrid.ColCount - 1 do
    OptimGrid.Cells[ 0, I-1 ]:= FCalcGrid.Cells[ I, 0];
end;

procedure TFrmOptimize.LoadOptimizedCol;
var
  I   : Integer;
  ACol: Integer;
begin
  ACol:= GetOptimizationColumn;
  if ACol > -1 then
    for I:= 1 to FCalcGrid.ColCount - 1 do
      OptimGrid.Cells[ 1, I-1 ]  := FCalcGrid.Cells[ I, ACol ];
end;

function TFrmOptimize.GetOptimizationColumn: Integer;
begin
  case TOptimizationKind( ComboBox1.ItemIndex ) of
    okPrice  : Result:= mrPrice;
    okPercent: Result:= mrOptm_prcnt;
    okMargin : Result:= mrMargin;
    okYield  : Result:= mrYield_Hr;
  else
    Result:= -1;
  end;
end;

procedure TFrmOptimize.ComboBox1Change(Sender: TObject);
begin
  LoadOptimizedCol;
end;

procedure TFrmOptimize.FormResize(Sender: TObject);
begin
  with OptimGrid do
  begin
    ColWidths[ 0 ]:= 70;
    ColWidths[ 1 ]:= ClientWidth - ColWidths[ 0 ] - 1;
  end;
end;

procedure TFrmOptimize.btnOKClick(Sender: TObject);
begin
  OptimizationKind:= TOptimizationKind( ComboBox1.ItemIndex );
  if MarkChanged then
     ModalResult:= mrOK
  else
     ModalResult:= mrCancel;
end;


procedure TFrmOptimize.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmQUOTE{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmOptimize.OptimGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  btnOK.Enabled:= TRUE;
end;

procedure TFrmOptimize.SetCalcGrid(const Value: TUniStringGrid);
begin
  FCalcGrid := Value;
end;

function TFrmOptimize.SilentMarkChanged( nQuoteID : Real; AOptimKind : integer; AOldOptmRate : Real ) : boolean;
(*Used for CDEV-113 Custom Quote Price Update Utility - Additional functionality and changes 08-27-14 ABiery*)
var
  I     : Integer;
  ACol  : Integer;
  S1, S2: string;
  N1, N2: Real;
  AQry  : TFDQuery;
  AOKindField : string;
begin
  Result:= FALSE;
  case AOptimKind of
    -1:
    begin
      AOKindField := 'qprice';     (*Price*) //Frandsen uses price, but this will allow them to use any other method
      ACol:= mrPrice;
    end;
    0:
    begin
      AOKindField := 'optm_rate';  (*Percent*)
      ACol:= mrOptm_prcnt;
    end;
    1:
    begin
      AOKindField := 'tot_margin'; (*Margin*)
      ACol:= mrMargin;
    end;
    2:
    begin
      AOKindField := 'yield_hr';   (*Yield*)
      ACol:= mrYield_Hr;
    end;
  else
    ACol:= -1;
  end;

  begin
    if ACol <> -1 then
    begin
       I := 0;
      AQry:= TFDQuery.Create(nil);
      with AQry do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add(Format('select quan, %s from qset_price where quote_id = %f order by quan', [ AOKindField, nQuoteID ]));
        Open;
        while not Eof do (*for each qty, enter its assigned optm_rate*)
        begin
          Inc(I);

          N1:= AOldOptmRate; //whatever was on the previous quote
          N2:= Fields[1].asFloat; (*current this should be zero because we reset it during calculation*)

          OptimGrid.Cells[ 1, I-1]:= FloatToStr(N1); (*Set value back to original optm_rate*)
{ TODO -oGPatil -cWebConvert : TUniStringGrid does not contain Objects
          if (N1 = N2) then  // 04-10-2007  and (N2 = 0) then   Ex: 5.3 = 0
            OptimGrid.Objects[ 1, I-1 ]:= NIL
          else
            begin
              OptimGrid.Objects[ 1, I-1 ]:= Pointer(1);
              Result:= TRUE;
            end; }
          Next;
        end;
      finally
        Free; {AQry}
      end;
    end;
  end;

end;


procedure TFrmOptimize.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  ComboBox1.ItemIndex:= Ord(okPrice);
  ComboBox1.Left := lblOptimizeBy.Left + lblOptimizeBy.Width + 16;
{ TODO -oGPatil -cWebConvert : Access Violaiton Error
  LoadQuan;
  LoadOptimizedCol;  }

end;

end.

