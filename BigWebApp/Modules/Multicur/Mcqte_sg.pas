unit MCQte_sg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  MCBasic,
  Data.DB,
  Wwtable,
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
  FireDAC.Comp.Client,
  Vcl.Menus,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniDBLookupComboBox,
  uniLabel,
  uniPanel;

type
  TFrmMCQuoteStringGrid = class(TFrmMCBasic)
    SG: TUniStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbCurrencyCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);override;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FSG:TUniStringGrid;
    procedure Recalculate;override;
    function  AssignCell(AStr:String):String;
    procedure SetCells;
    procedure SetStringGrid(const Value: TUniStringGrid);
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent; AID:Real; AStringGrid:TUniStringGrid);
  end;

procedure DoMCQuoteStringGrid(AID:Real; AStringGrid:TUniStringGrid);

implementation

{$R *.DFM}

uses
  Q_Share,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  uniGUIApplication;

procedure DoMCQuoteStringGrid(AID:Real; AStringGrid:TUniStringGrid);
var
  LFrmMCQuoteStringGrid : TFrmMCQuoteStringGrid;
begin
  LFrmMCQuoteStringGrid := TFrmMCQuoteStringGrid.Create(UniGUIApplication.UniApplication);
  LFrmMCQuoteStringGrid.FSG := AStringGrid;
  LFrmMCQuoteStringGrid.Show;
end;

{constructor TFrmMCQuoteStringGrid.Create(AOwner:TComponent; AID:Real; AStringGrid:TUniStringGrid);
begin
  inherited Create(AOwner, AID);
  IQRegFormRead( self, [self]);
  FSG := AStringGrid;
  cbCurrencyCloseUp(nil, nil, nil, True);
end;     }

procedure TFrmMCQuoteStringGrid.SetCells;
var
  i, j:Integer;
begin
  with FSG do
  begin
    SG.ColCount :=ColCount;
    SG.RowCount :=RowCount;
    SG.DefaultRowHeight := DefaultRowHeight;
    for i := 0 to ColCount - 1 do
      for j := 0 to RowCount - 1 do
        SG.Cells[i, j] := Cells[i, j];
    Recalculate;
  end;
end;

procedure TFrmMCQuoteStringGrid.SetStringGrid(const Value: TUniStringGrid);
begin
  FSG := Value;
end;

procedure TFrmMCQuoteStringGrid.UniFormShow(Sender: TObject);
begin
  inherited;
  IQRegFormRead( self, [self]);
  cbCurrencyCloseUp(nil, nil, nil, True);
end;

procedure TFrmMCQuoteStringGrid.Recalculate;
var
  i:Integer;
begin
  inherited;   {nothing}
  with SG do
  for i := 1 to ColCount - 1 do
  begin
    Cells[i, mrCost                 ] := AssignCell(Cells[i, mrCost                 ]);
    Cells[i, mrPrice                ] := AssignCell(Cells[i, mrPrice                ]);
    Cells[i, mrPrice1000            ] := AssignCell(Cells[i, mrPrice1000            ]);
    Cells[i, mrProd_Cost            ] := AssignCell(Cells[i, mrProd_Cost            ]);
    Cells[i, mrProd_Markup_Dollars  ] := AssignCell(Cells[i, mrProd_Markup_Dollars  ]);
    Cells[i, mrNetValue_Hr          ] := AssignCell(Cells[i, mrNetValue_Hr          ]);
    Cells[i, mrCost_Lb              ] := AssignCell(Cells[i, mrCost_Lb              ]);
    Cells[i, mrPlastic_Cost         ] := AssignCell(Cells[i, mrPlastic_Cost         ]);
    Cells[i, mrInsert_Cost          ] := AssignCell(Cells[i, mrInsert_Cost          ]);
    Cells[i, mrPkg_Cost             ] := AssignCell(Cells[i, mrPkg_Cost             ]);
    Cells[i, mrMatl_Cost            ] := AssignCell(Cells[i, mrMatl_Cost            ]);
    Cells[i, mrMat_Markup           ] := AssignCell(Cells[i, mrMat_Markup           ]);
    Cells[i, mrTbl_Fix_Mat_Markup   ] := AssignCell(Cells[i, mrTbl_Fix_Mat_Markup   ]);
    Cells[i, mrTotal_EXchrg         ] := AssignCell(Cells[i, mrTotal_EXchrg         ]);
    Cells[i, mrTotal_Commiss        ] := AssignCell(Cells[i, mrTotal_Commiss        ]);
    Cells[i, mrTotal_Dollars        ] := AssignCell(Cells[i, mrTotal_Dollars        ]);
    Cells[i, mrTotal_Profit         ] := AssignCell(Cells[i, mrTotal_Profit         ]);
    Cells[i, mrTotal_Cost_Dollars   ] := AssignCell(Cells[i, mrTotal_Cost_Dollars   ]);
    Cells[i, mrProd_Total_Dollars   ] := AssignCell(Cells[i, mrProd_Total_Dollars   ]);
    Cells[i, mrMat_Total_Dollars    ]  := AssignCell(Cells[i, mrMat_Total_Dollars   ]);
  end;
end;

function TFrmMCQuoteStringGrid.AssignCell(AStr:String):String;
var
  AVal:Real;
  AThousandSeparator, ADecimalSeparator:String;
  ADecLength:Integer;
  ADecStr:String;
begin
  AThousandSeparator := FormatSettings.ThousandSeparator;
  ADecimalSeparator := FormatSettings.DecimalSeparator;
  ADecLength := 2;
  if Trim(AStr) = '' then AVal := 0
  else
  begin
    ADecLength := Length(Copy(AStr, Pos(ADecimalSeparator, AStr) + 1, Length(AStr)));
    if ADecLength = 0 then
      ADecLength := 2;
    AVal :=StrToFloat(Strtran(AStr, AThousandSeparator, ''));
  end;
  ADecStr := Repl('0', ADecLength) + ';; ';


  Result := FormatFloat('###' + AThousandSeparator  + '##0' + ADecimalSeparator + ADecStr, Factor * AVal);
  if Copy(Result, 1, 1) = ADecimalSeparator then
    Result := '0' + Result;

  if Length(AStr) <> Length(Result) then
    Result := Copy(Result, 1, Length(AStr));




//  if Trim(AStr) = '' then AVal := 0
//  else AVal :=StrToFloat(Strtran(AStr, ',', ''));
//  Result := FormatFloat('###,##0.00;; ', Factor * AVal);


end;

procedure TFrmMCQuoteStringGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  inherited;
end;

procedure TFrmMCQuoteStringGrid.cbCurrencyCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
//  Factor := tblCurrency.FieldByName('SPOT_RATE').asFloat;
//  Factor := tblCurrency.FieldByName('SPOT_RATE').asFloat/FBanchRate;
  Factor := 1/tblCurrency.FieldByName('SPOT_RATE').asFloat;
  SetCells;
end;

end.
