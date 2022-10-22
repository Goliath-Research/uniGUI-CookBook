unit IQMS.Common.ChartConfig;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IniFiles,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFConfig = class(TUniForm)
    Panel1: TUniPanel;
    NewConfig: TUniLabel;
    OK: TUniButton;
    Save: TUniButton;
    Cancel: TUniButton;
    SectionEdit: TUniEdit;
    Load: TUniButton;
    Panel2: TUniPanel;
    pnlAvail: TUniPanel;
    ListIni: TUniListBox;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    pnlSelected: TUniPanel;
    SelectColumn: TUniListBox;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    AvailColumn: TUniListBox;
    Panel7: TUniPanel;
    Panel9: TUniPanel;
    Select: TUniButton;
    Deselect: TUniButton;
    SelectAll: TUniButton;
    DeselectAll: TUniButton;
    Splitter2: TUniSplitter;
    procedure SelectAllClick(Sender: TObject);
    procedure DeselectAllClick(Sender: TObject);
    procedure SelectClick(Sender: TObject);
    procedure DeselectClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AvailColumnDblClick(Sender: TObject);
    procedure SelectColumnDblClick(Sender: TObject);
    procedure AvailColumnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SelectColumnDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SelectColumnDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SelectColumnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AvailColumnDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure AvailColumnDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListIniMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SaveDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SaveDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SectionEditMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LoadClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListIniDblClick(Sender: TObject);
    procedure ListIniClick(Sender: TObject);
    procedure SelectColumnKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    procedure OnOffButtons(OnOff: Boolean);
    function FieldSearch(FieldName: string; SearchType: Boolean): string;
    procedure BlankArray;
    function ColumnPos(FieldName: string): integer;
    function SelectColumnSearch(FieldName: string; SelectColumn: TUniListBox): Boolean;
    procedure DeleteSection;
  public
    { Public declarations }
  end;

var
  FConfig: TFConfig;
  RealName: array[0..30,0..2] of string;
  FieldName: array[0..30] of string;
  Origin: integer;

implementation

uses
  IQMS.Common.GraphChart,
  IQMS.Common.ResStrings;

{$R *.DFM}

procedure TFConfig.FormActivate(Sender: TObject);
var
  i: integer;
  IqWin: TIniFile;
  SectionString: TStrings;
  Directory: string;
begin
  AvailColumn.Clear;
  SelectColumn.Clear;
  ListIni.Clear;
  OnOffButtons(False);
  Directory := ExtractFilePath(Application.ExeName) + 'iqwin.ini';
  IqWin := TIniFile.Create(Directory);
  SectionString := TStringList.Create;
  IqWin.ReadSection( TIQWebGraphChart(Owner).SectionName,SectionString);
  try
    for i := 0 to TIQWebGraphChart(owner).DataSet.FieldCount - 1 do
    with TIQWebGraphChart(owner).DataSet do
      begin
        AvailColumn.Items.Add(Fields[i].DisplayLabel);
        RealName[i,0] := Fields[i].FieldName;
        RealName[i,1] := Fields[i].DisplayLabel;
      end;

    if SectionString.Count > 0 then
      begin
        for i := 0 to SectionString.Count - 1 do
          ListIni.Items.Add(SectionString.Strings[i]);

        ListIni.SetFocus;
        ListIni.ItemIndex := 0;
        SectionEdit.Text := ListIni.Items[ListIni.ItemIndex];
      end;

  finally
    SectionString.Free;
    Iqwin.Free;
  end;
end;

procedure TFConfig.SelectAllClick(Sender: TObject);
var
  i: integer;
begin
  OnOffButtons(True);
  for i := 0 to AvailColumn.Items.Count - 1 do
    SelectColumn.Items.Add(AvailColumn.Items[i]);

  AvailColumn.Clear;
end;

procedure TFConfig.DeselectAllClick(Sender: TObject);
var
  i: integer;
begin
  OnOffButtons(False);
  AvailColumn.Clear;
  for i := 0 to TIQWebGraphChart(owner).DataSet.FieldCount - 1 do
    AvailColumn.Items.Add(TIQWebGraphChart(owner).DataSet.Fields[i].DisplayLabel);

  SelectColumn.Clear;
end;

procedure TFConfig.SelectClick(Sender: TObject);
var
  i, element, numdel: integer;
  SelectItem: array[0..30] of integer;
begin
  element := 0;
  for i := 0 to AvailColumn.Items.Count - 1 do
    if AvailColumn.Selected[i] then
      begin
        SelectColumn.Items.Add(AvailColumn.Items[i]);
        SelectItem[element] := i;
        element := element + 1;
      end;

  if SelectColumn.Items.Count > 0 then
    OnOffButtons(True);

  numdel:= 0;
  for i := 0 to High(SelectItem) do
    if (SelectItem[i] >= 0) and (SelectItem[i] <= High(SelectItem)) then
      begin
        if numdel = 0 then
          begin
            AvailColumn.Items.Delete(SelectItem[i]);
            numdel := 1;
          end
        else
          begin
            AvailColumn.Items.Delete(SelectItem[i] - numdel);
            numdel := numdel + 1;
          end;
      end
    else
      exit;
end;

procedure TFConfig.DeselectClick(Sender: TObject);
var
  i, element, numdel, colpos: integer;
  SelectItem: array[0..30] of integer;
begin
  element := 0;
  for i := 0 to SelectColumn.Items.Count - 1 do
    if SelectColumn.Selected[i] then
      begin
        SelectItem[element] := i;
        element := element + 1;
      end;

  numdel:= 0;
  for i := 0 to High(SelectItem) do
    if (SelectItem[i] >= 0) then
      begin
        if numdel = 0 then
          begin
            SelectColumn.Items.Delete(SelectItem[i]);
            numdel := 1;
          end
        else
          begin
            SelectColumn.Items.Delete(SelectItem[i] - numdel);
            numdel := numdel + 1;
          end;
      end;

  if SelectColumn.Items.Count = 0 then
    OnOffButtons(False);

  AvailColumn.Clear;
  for i := 0 to TIQWebGraphChart(owner).DataSet.FieldCount - 1 do
    AvailColumn.Items.Add(TIQWebGraphChart(owner).DataSet.Fields[i].DisplayLabel);

  numdel := 0;
  for i := 0 to SelectColumn.Items.Count - 1 do
    begin
      colpos := ColumnPos(SelectColumn.Items[i]);
      if colpos >= 0 then
        if numdel = 0 then
          begin
            AvailColumn.Items.Delete(colpos);
            numdel := 1;
          end
        else
          begin
            AvailColumn.Items.Delete(colpos - numdel);
            numdel := numdel + 1;
          end;
    end;
end;

procedure TFConfig.CancelClick(Sender: TObject);
var
  F: TextFile;
begin
  SelectColumn.Clear;
  AvailColumn.Clear;
  ListIni.Clear;
  SectionEdit.Text := '';
  OnOffButtons(False);
  Close;
end;

procedure TFConfig.OKClick(Sender: TObject);
//var
//  GraphWindow1: TGraphWindow;
//  GraphInWindow: TGraphInWindow;
//  Column: TGraphColumn;
//  NumColInGraph: Longint;
//  i: integer;
//  newcolumn: string;
begin
(*
  if SelectColumn.Items.Count > 0 then
    begin
      GraphInWindow := TIQWebGraphChart(owner).Graphwindow1.GraphInWindow;
      NumColInGraph := GraphInWindow.NumColInGraph;
      while ( GraphInWindow.NumColInGraph > 0 ) do
        begin
          Column := GraphInWindow.GetColumnInGraph(1);
          Column.Destroy;
          NumColInGraph := GraphInwindow.NumColInGraph;
        end;

      for i := 0 to SelectColumn.Items.Count - 1 do
        begin
          newcolumn := FieldSearch(SelectColumn.Items.Strings[i],True);
          TIQWebGraphChart(owner).GraphWindow1.GraphInWindow.AddColumn(newcolumn);
          column := TIQWebGraphChart(owner).GraphWinDow1.GraphInWindow.GetColumnInGraph(i+1);
          Column.Title := FieldSearch(newcolumn,False);
        end;

      TIQWebGraphChart(owner).Graphwindow1.GraphInWindow.NumColInView:= SelectColumn.Items.Count;

      TIQWebGraphChart(owner).GraphWindow1.GraphInWindow.InvalidateData;
      TIQWebGraphChart(owner).GraphWindow1.GraphInWindow.Display(True);
      CanCelClick(Sender);
    end;
*)
end;

procedure TFConfig.SaveClick(Sender: TObject);
//var
//  IqWin: TIniFile;
//  IniField: TStrings;
//  i: integer;
//  Overwrite, Blank: Boolean;
//  AllField, FieldName, IniName, Directory: string;
begin
(*
  Overwrite := False;
  Blank := False;
  if SelectColumn.Items.Count > 0 then
    try
      begin
        if ListIni.Items.Count = 0 then
          begin
            ListIni.Items.Add(SectionEdit.Text);
            ListIni.SetFocus;
            ListIni.ItemIndex := 0;
            Blank := True;
          end;

        if SectionEdit.Text <> '' then
          if SectionEdit.Text = ListIni.Items[ListIni.ItemIndex] then
            if MessageDlg('Overwrite ' + SectionEdit.Text +
                          ' with new configuration ?', mtWarning,
                          [mbYes, mbNo], 0) = mrYes then
              begin
                Overwrite := True;
                IniName := SectionEdit.Text;
              end
            else
              Overwrite := False
          else
             if MessageDlg('Save ' + SectionEdit.Text +
                          ' with new configuration ?', mtInformation,
                          [mbYes, mbNo], 0) = mrYes then
               begin
                 OverWrite := True;
                 IniName := SectionEdit.Text;
               end
             else
               begin
                 OverWrite := False;
                 SectionEdit.Text := '';
               end
        else
          if MessageDlg('Overwrite ' +  ListIni.Items[ListIni.ItemIndex] +
                          ' with new configuration ?', mtWarning,
                          [mbYes, mbNo], 0) = mrYes then
            begin
              OverWrite := True;
              IniName := ListIni.Items[ListIni.ItemIndex];
            end
          else
            Overwrite := False;
      end;

      if Overwrite then
        begin
          for i := 0 to SelectColumn.Items.Count - 1 do
            begin
              FieldName := FieldSearch(SelectColumn.Items[i], True);
              AllField := AllField + FieldName + ';';
            end;

          Directory := ExtractFilePath(Application.ExeName) + 'iqwin.ini';
          IqWin := TIniFile.Create(Directory);
          IqWin.WriteString( TIQWebGraphChart(Owner).SectionName,IniName,AllField);
          OKClick(Sender);
        end
      else if Blank then
        ListIni.Clear;

    finally
      if Overwrite then
        IqWin.Free;
    end
  else
    OnActivate(Sender);
*)
end;

function TFConfig.FieldSearch(FieldName: string; SearchType: Boolean): string;
var
  i: integer;
begin
  for i := 0 to High(RealName) do
    if SearchType then
      begin
        if RealName[i,1] = FieldName then
          begin
            Result := RealName[i,0];
            exit;
          end
      end
    else
      begin
        if RealName[i,0] = FieldName then
          begin
            Result := RealName[i,1];
            exit;
          end;
      end;

  result := '';
end;

procedure TFConfig.BlankArray;
var
  i: integer;
begin
  for i := 0 to High(FieldName) do
    if FieldName[i] <> '' then
      FieldName[i] := '';
end;

function TFConfig.ColumnPos(FieldName: string): integer;
var
  i: integer;
begin
  for i := 0 to High(RealName) do
    if RealName[i,1] = FieldName then
      begin
        Result := i;
        exit;
      end;

  result := -1;
end;

procedure TFConfig.AvailColumnDblClick(Sender: TObject);
begin
  SelectClick(Sender);
end;

procedure TFConfig.SelectColumnDblClick(Sender: TObject);
begin
  DeselectClick(Sender);
end;

procedure TFConfig.AvailColumnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    with Sender as TUniListBox do
      begin
        BeginDrag(True);
      end;
end;

procedure TFConfig.SelectColumnDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  KeySend: char;
begin
  Accept := Source is TUniListBox and ( (TUniListBox(Source).Name = 'AvailColumn') or
                                     (TUniListBox(Source).Name = 'ListIni') or
                                     (TUniListBox(Source).Name = 'SelectColumn') );

  if TUniListBox(Source).Name = 'SelectColumn' then
    begin
      if (Y >= 0) and (Y <= 10) then
        begin
          KeySend := 'U';
          SelectColumnKeyPress(Sender,KeySend);
        end
      else if Y >= SelectColumn.Height - 10 then
        begin
          KeySend := 'D';
          SelectColumnKeyPress(Sender,KeySend);
        end;
    end;
end;

procedure TFConfig.SelectColumnDragDrop(Sender, Source: TObject; X,
  Y: Integer);
//var
//  APoint: TPoint;
//  Destination: integer;
begin
  if Source is TUniListBox then
    if TUniListBox(Source).Name = 'AvailColumn' then
      SelectClick(Sender)
    else if TUniListBox(Source).Name = 'ListIni' then
      LoadClick(Sender)
    else if TUniListBox(Source).Name = 'SelectColumn' then
      begin
//        APoint.X := X;
//        APoint.Y := Y;
//        Destination := SelectColumn.ItemAtPos(APoint,True);
//        if (Origin <> Destination) and (Destination <> -1) then
//          begin
//            SelectColumn.Items.Move(Origin,Destination);
//            SelectColumn.ItemIndex := Destination;
//          end;
      end;

end;

procedure TFConfig.SelectColumnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (SelectColumn.Items.Count > 0) then
    with Sender as TUniListBox do
      begin
        origin := SelectColumn.ItemIndex;
        BeginDrag(True);
      end;
end;

procedure TFConfig.SelectColumnKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    'U':
      // while SelectColumn.ItemIndex > 0 do
      if SelectColumn.ItemIndex > 0 then
        selectcolumn.ItemIndex := selectcolumn.ItemIndex - 1;
    'D':
      // while SelectColumn.ItemIndex < SelectColumn.Items.Count - 1 do
      if SelectColumn.ItemIndex < SelectColumn.Items.Count then
        SelectColumn.ItemIndex := SelectColumn.ItemIndex + 1;
  end;
end;

procedure TFConfig.AvailColumnDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TUniListBox and (TUniListBox(Source).Name = 'SelectColumn');
end;

procedure TFConfig.AvailColumnDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if Source is TUniListBox then
    DeselectClick(Sender);
end;

procedure TFConfig.ListIniMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (ListIni.Items.Count > 0) then
    with Sender as TUniListBox do
      begin
        BeginDrag(True);
      end
  else if (button = mbRight) then
    DeleteSection;
end;

procedure TFConfig.SaveDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := ((Source is TUniListBox) and (TUniListBox(Source).Name = 'ListIni')) or
             (Source is TUniEdit);
end;

procedure TFConfig.SaveDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if ((Source is TUniListBox) and (TUniListBox(Source).Name = 'ListIni')) or
      (Source is TUniEdit) then
    SaveClick(Sender);
end;

procedure TFConfig.SectionEditMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (SectionEdit.Text <> '') and
     (SelectColumn.Items.Count > 0) then
    with Sender as TUniEdit do
      begin
        BeginDrag(True);
      end;
end;

procedure TFConfig.OnOffButtons(OnOff: Boolean);
begin
  if OnOff then
    begin
      OK.Enabled := True;
      Save.Enabled := True;
    end
  else
    begin
      OK.Enabled := False;
      Save.Enabled := False;
    end;
end;

procedure TFConfig.LoadClick(Sender: TObject);
var
  IqWin: TIniFile;
  i, counter: integer;
  FieldString: string;
  Directory, Configuration: string;
begin
  SectionEdit.Text := ListIni.Items[ListIni.ItemIndex];;
  SelectColumn.Clear;
  AvailColumn.Clear;
  Configuration := ListIni.Items[ListIni.ItemIndex];
  Directory := ExtractFilePath(Application.ExeName) + 'iqwin.ini';
  IqWin := TIniFile.Create(Directory);
  FieldString := IqWin.ReadString( TIQWebGraphChart(Owner).SectionName,Configuration,'ERROR');
    if Length(FieldString) > 0 then
      BlankArray;
      ParseString(FieldString,FieldName);
      for i := 0 to High(FieldName) do
        if FieldName[i] <> '' then
          SelectColumn.Items.Add(FieldSearch(FieldName[i],False))
        else
          Break;

      for i := 0 to High(RealName) do
        if not SelectColumnSearch(RealName[i,1], SelectColumn) then
          AvailColumn.Items.Add(RealName[i,1]);

      if SelectColumn.Items.Count > 0 then
        OnOffButtons(True);
end;

function TFConfig.SelectColumnSearch(FieldName: string; SelectColumn: TUniListBox): Boolean;
var
  i: integer;
begin
  SelectColumn.SetFocus;
  SelectColumn.ItemIndex := 0;
  for i := 0 to SelectColumn.Items.Count - 1 do
    if FieldName = SelectColumn.Items[i] then
      begin
        Result := True;
        Exit;
      end;

  Result := False;
end;

procedure TFConfig.FormResize(Sender: TObject);
var
  left_edit :integer;
begin
  left_edit:= width - 94 - 1;
  if left_edit > SectionEdit.Width then
     SectionEdit.Width:= left_edit
end;

procedure TFConfig.ListIniClick(Sender: TObject);
begin
  if ListIni.Items.Count > 0 then
    SectionEdit.Text := ListIni.Items[ListIni.ItemIndex];
end;

procedure TFConfig.ListIniDblClick(Sender: TObject);
begin
  if ListIni.Items.Count > 0 then
    LoadClick(Sender);
end;

procedure TFConfig.DeleteSection;
var
  i, IniIndex, EqualSign: integer;
  IqWin: TIniFile;
  Section, SectionValues: TStrings;
  Directory: string;
  F: TextFile;
begin
  if ListIni.Items.Count > 0 then
    if MessageDlg( IQMS.Common.ResStrings.cTXT0000003 {'Delete'} + #34 {space} + ListIni.Items[ListIni.ItemIndex] + '?'
                    ,mtWarning,[mbYes, mbNo]) = mrYes then
      try
        Directory := ExtractFilePath(Application.ExeName);
        IqWin := TIniFile.Create(Directory + 'iqwin.ini');
        Section := TStringList.Create;
        SectionValues := TStringList.Create;
        Iqwin.ReadSection( TIQWebGraphChart(Owner).SectionName,Section);
        Iqwin.ReadSectionValues( TIQWebGraphChart(Owner).SectionName,SectionValues);

        IniIndex := ListIni.ItemIndex;

        Iqwin.EraseSection( TIQWebGraphChart(Owner).SectionName);
        AssignFile(F,Directory + 'iqwin.ini');
        ReWrite(F);
        Writeln(F, '[' +  TIQWebGraphChart(Owner).SectionName + ']');
        for i := 0 to Section.Count - 1 do
          Writeln(F,Section[i]);

        Flush(F);
        CloseFile(F);

        for i := 0 to Section.Count - 1 do
          if i <> IniIndex then
            begin
              EqualSign := Pos('=',SectionValues[i]);
              IqWin.WriteString( TIQWebGraphChart(Owner).SectionName,Section[i],
                 Copy(SectionValues[i],EqualSign+1,Length(SectionValues[i])));
            end;

        ListIni.Items.Delete(IniIndex);
        ListIni.SetFocus;
        if ListIni.Items.Count > 0 then
          ListIni.ItemIndex := 0;

      finally
        IqWin.Free;
        Section.Free;
        SectionValues.Free;
      end;
end;

end.
