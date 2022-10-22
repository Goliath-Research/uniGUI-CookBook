unit IQMS.Common.GraphChart;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IniFiles,
  Vcl.FileCtrl,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.Controls;

type
  TIQWebGraphChart = class(TUniForm)
    Panel1: TUniPanel;
    Config: TUniButton;
    Terminate: TUniButton;
    Panel2: TUniPanel;
    procedure ConfigClick(Sender: TObject);
    procedure TerminateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    procedure LoadIniFields;

    function  GetDataSource:TDataSource;
    procedure SetDataSource( ADataSource: TDataSource );
    function  GetDataSet:TDataSet;

  public
    SectionName: string;
    XLabelIndex, XHeader: string;
    YLeftHeader, YLeftTitle: string;
    ColInView, RowInView: integer;

    property DataSource:TDataSource read GetDataSource write SetDataSource;
    property DataSet   :TDataSet    read GetDataSet;
  end;

var
  IQGraphChart: TIQWebGraphChart;
  RealName: array[0..30,0..1] of string;

  procedure ParseString(FieldString: string; var FieldName: array of string);
  function FieldSearch(FieldName: string): string;

implementation

// uses ChrtConf;

{$R *.DFM}


// Place a command Button on the calling form and inside the OnClick event
// Insert the following code.

{procedure TForm1.ButtonClick(Sender: TObject);
begin
  with TIQGraphChart.Create(self) do
  try
    DataSource:= DataSource1;
    SectionName := 'Iqwiniqmspr';
    ColInView := 8
    RowInView := 8;
    XLabelIndex := 'QUAN';
    XHeader := 'QUANTITY';
    YHeader := '$';
    YTitle  := 'VALUES';
    ShowModal;
  finally
    Free;
  end;
end;}

procedure TIQWebGraphChart.FormCreate(Sender: TObject);
begin
  if Assigned(DataSource) then
     LoadIniFields;
end;

function  TIQWebGraphChart.GetDataSource:TDataSource;
begin
  //result:= GraphWindow1.DataSource
end;

procedure TIQWebGraphChart.SetDataSource( ADataSource: TDataSource );
begin
  //GraphWindow1.DataSource:= ADataSource;
end;

function  TIQWebGraphChart.GetDataSet:TDataSet;
begin
  //result:= GraphWindow1.DataSource.DataSet
end;

procedure TIQWebGraphChart.ConfigClick(Sender: TObject);
begin
  //with TFConfig.Create(self) do
  //try
  //  ShowModal;
  //finally
  //  Free;
  //end;
end;

procedure TIQWebGraphChart.TerminateClick(Sender: TObject);
begin
  Close;
end;

procedure TIQWebGraphChart.LoadIniFields;
//var
//  GraphInwindow: TGraphInWindow;
//  Column: TGraphColumn;
//  AxisX: TAxisX;
//  AxisYLeft: TAxisYLeft;
//  Legend: TLegend;
//  IqWin: TIniFile;
//  Section: TStrings;
//  i: integer;
//  FieldString, IniField: string;
//  Directory: string;
//  FieldName: array[0..30] of string;
begin
(*
  IniField := '';
  if SectionName = '' then
    SectionName := 'IQwin_CHART';
  if RowInView = 0 then
    RowInView := 8;
  if ColInView = 0 then
    ColInView := 8;

  try
    for i := 0 to DataSet.FieldCount - 1 do
      begin
        RealName[i,0] := DataSet.Fields[i].FieldName;
        RealName[i,1] := DataSet.Fields[i].DisplayLabel;
      end;
    Directory := ExtractFilePath(Application.ExeName) + 'iqwin.ini';
    IqWin := TIniFile.Create(Directory);
    Section := TStringList.Create;
    IqWin.ReadSection(SectionName,Section);
    for i := 0 to Section.Count - 1 do
      if (Section.Strings[i] = 'Default') or (Section.Strings[i] = 'default') then
        begin
          IniField := Section.Strings[i];
          break;
        end;

    FieldString := IqWin.ReadString(SectionName,IniField,'ERROR');
    if Length(FieldString) > 0 then
      ParseString(FieldString,FieldName);
      for i := 0 to High(FieldName) do
        if FieldName[i] <> '' then
          begin
            GraphWindow1.GraphInWindow.AddColumn(FieldName[i]);
            Column := GraphWindow1.GraphInWindow.GetColumnInGraph(i+1);
            Column.Title := FieldSearch(FieldName[i]);
            ColInView := i+1;
          end
        else
          break;

      GraphWindow1.GraphInWindow.NumRowInView := RowInView;
      GraphWindow1.GraphInWindow.NumColInView := ColInView;

      AxisX := GraphWindow1.GraphInWindow.AxisX;
      AxisX.LabelIndex := XLabelIndex;;
      AxisX.Header := XHeader;

      AxisYLeft := GraphWindow1.GraphInWindow.AxisYLeft;
      AxisYLeft.Title := YLeftTitle;
      AxisYLeft.Header := YLeftHeader;

      Legend := GraphWindow1.GraphInWindow.Legend;
      Legend.Visible := True;
      Legend.OnBest;
  finally
    IqWin.Free;
    Section.Free;
  end;
*)
end;

procedure ParseString(FieldString: string; var FieldName: array of string);
//var
//  j, Lastpos, counter: integer;
begin
(*
  Lastpos := 0;
  counter := 0;
  for j := lastpos to Length(FieldString) do
    if FieldString[j] = ';' then
      begin
        if counter = 0 then
          FieldName[counter] := Copy(FieldString,Lastpos,(j - lastpos) - 1)
        else
          FieldName[counter] := Copy(FieldString,Lastpos,j - lastpos);
        lastpos := j + 1;
        counter := counter + 1;
        if lastpos > Length(FieldString) then
          Exit;
      end;
*)
end;

function FieldSearch(FieldName: string): string;
//var
//  i: integer;
begin
(*
  for i := 0 to High(RealName) do
    if RealName[i,0] = FieldName then
      begin
        Result := RealName[i,1];
        exit;
      end;
  result := 'ID';
*)
end;


end.
