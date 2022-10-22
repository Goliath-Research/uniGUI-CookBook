unit IQMS.Common.RecordCount;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Data.DB,
  IQMS.WebVcl.DBExpress, Data.SqlExpr, Data.Win.ADODB, FireDAC.Phys,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

function GetRecordCount(ADataSet: TDataSet): Integer;

implementation

uses
  IQMS.Common.StringUtils, IQMS.Common.ResStrings;

function GetRecordCount(ADataSet: TDataSet): Integer;
var
  i: Integer;
  ASQLText: string;
  ATableName: string;
  AExt: string;
begin
  Result := 0; // Initialization
  if not Assigned(ADataSet) then
    Exit;

  if (ADataSet is TSQLQuery) then
    try
      with TSQLQuery.Create(nil) do
        try
          SQLConnection := TSQLQuery(ADataSet).SQLConnection;
          ASQLText := TSQLQuery(ADataSet).SQL.Text;
          SQL.Add('SELECT COUNT(*) AS n_count FROM');
          SQL.Add('(');
          SQL.Add(TSQLQuery(ADataSet).SQL.Text);
          SQL.Add(')');

          // Assign parameters
          if (Params.Count > 0) and
            (Params.Count = TSQLQuery(ADataSet).Params.Count) then
            for i := 0 to Params.Count - 1 do
              begin
                Params[i].DataType := TSQLQuery(ADataSet).Params[i].DataType;
                Params[i].ParamType := TSQLQuery(ADataSet).Params[i].ParamType;
              end;

          BeforeOpen := TSQLQuery(ADataSet).BeforeOpen;
          DataSource := TSQLQuery(ADataSet).DataSource;
          Open;
          Result := Fields[0].AsInteger;
        finally
          Free;
        end;
    except
      on E: Exception do
        // 'Encountered error while retrieving record count [GetRecordCount()]:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000162, [E.Message]);
    end

    // TSQLTable
  else if (ADataSet is TSQLTable) then
    try
      ATableName := TSQLTable(ADataSet).TableName;
      if (ATableName = '') then
        Exit;

      // Is this a physical file?
      AExt := Trim(UpperCase(ExtractFileExt(ATableName)));
      // Only these database files support SQL.  For example, .CSV, does
      // not support SQL.
      if (AExt > '') and not IQMS.Common.StringUtils.StrInList(AExt, ['.DB', '.DBF']) then
        begin
          Result := TSQLTable(ADataSet).RecordCount;
          Exit;
        end;

      with TSQLQuery.Create(nil) do
        try
          SQLConnection := TSQLTable(ADataSet).SQLConnection;
          SQL.Add('SELECT COUNT(*) AS n_count FROM');

          // 01/21/2008 If the table name has spaces, such as a DBF file name,
          // then wrap it in quotation marks.
          if (Pos(' ', ATableName) > 0) then
            SQL.Add('"' + ATableName + '"')
          else
            SQL.Add(ATableName);

          if TSQLTable(ADataSet).Filtered and
            (Trim(TSQLTable(ADataSet).Filter) > '') then
            SQL.Add(Format('WHERE %s', [TSQLTable(ADataSet).Filter]));
          Open;
          Result := Fields[0].AsInteger;
        finally
          Free; // free TFDQuery
        end;

    except
      on E: Exception do
        // 'Encountered error while retrieving record count [GetRecordCount()]:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000162, [E.Message]);
    end

    // TDbxQuery
  else if (ADataSet is TIQWebDbxQuery) then
    try
      with TSQLQuery.Create(nil) do
        try
          SQLConnection := TIQWebDbxQuery(ADataSet).SQLConnection;
          ASQLText := TIQWebDbxQuery(ADataSet).SQL.Text;
          SQL.Add('SELECT COUNT(*) AS n_count FROM');
          SQL.Add('(');
          SQL.Add(TIQWebDbxQuery(ADataSet).SQL.Text);
          SQL.Add(')');

          // Assign parameters
          if (Params.Count > 0) and
            (Params.Count = TIQWebDbxQuery(ADataSet).Params.Count) then
            for i := 0 to Params.Count - 1 do
              begin
                Params[i].DataType := TIQWebDbxQuery(ADataSet).Params[i].DataType;
                Params[i].ParamType := TIQWebDbxQuery(ADataSet).Params[i].ParamType;
              end;
          BeforeOpen := TIQWebDbxQuery(ADataSet).BeforeOpen;
          DataSource := TIQWebDbxQuery(ADataSet).DataSource;
          Open;
          Result := Fields[0].AsInteger;
        finally
          Free;
        end;
    except
      on E: Exception do
        // 'Encountered error while retrieving record count [GetRecordCount()]:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000162, [E.Message]);
    end

    // TADOQuery
  else if (ADataSet is TADOQuery) then
    try
      with TADOQuery.Create(nil) do
        try
          Connection := TADOQuery(ADataSet).Connection;
          ASQLText := TADOQuery(ADataSet).SQL.Text;
          SQL.Add('SELECT COUNT(*) AS n_count FROM');
          SQL.Add('(');
          SQL.Add(TADOQuery(ADataSet).SQL.Text);
          SQL.Add(')');
          // Assign parameters
          if (Parameters.Count > 0) and
            (Parameters.Count = TADOQuery(ADataSet).Parameters.Count) then
            for i := 0 to Parameters.Count - 1 do
              begin
                Parameters[i].DataType := TADOQuery(ADataSet).Parameters
                  [i].DataType;
                Parameters[i].Direction := TADOQuery(ADataSet).Parameters[i]
                  .Direction;
              end;
          BeforeOpen := TADOQuery(ADataSet).BeforeOpen;
          DataSource := TADOQuery(ADataSet).DataSource;
          Open;
          Result := Fields[0].AsInteger;
        finally
          Free;
        end;
    except
      on E: Exception do
        // 'Encountered error while retrieving record count [GetRecordCount()]:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000162, [E.Message]);
    end

    // TADOTable
  else if (ADataSet is TADOTable) then
    try
      ATableName := TADOTable(ADataSet).TableName;
      if (ATableName = '') then
        Exit;

      // Is this a physical file?
      AExt := Trim(UpperCase(ExtractFileExt(ATableName)));
      // Only these database files support SQL.  For example, .CSV, does
      // not support SQL.
      if (AExt > '') and not IQMS.Common.StringUtils.StrInList(AExt, ['.DB', '.DBF']) then
        begin
          Result := TADOTable(ADataSet).RecordCount;
          Exit;
        end;

      with TADOQuery.Create(nil) do
        try
          Connection := TADOTable(ADataSet).Connection;
          SQL.Add('SELECT COUNT(*) AS n_count FROM');
          // 01/21/2008 If the table name has spaces, such as a DBF file name,
          // then wrap it in quotation marks.
          if (Pos(' ', ATableName) > 0) then
            SQL.Add('"' + ATableName + '"')
          else
            SQL.Add(ATableName);
          if TADOTable(ADataSet).Filtered and
            (Trim(TADOTable(ADataSet).Filter) > '') then
            begin
              SQL.Add(Format('WHERE %s', [TADOTable(ADataSet).Filter]));
            end;
          Open;
          Result := Fields[0].AsInteger;
        finally
          Free; // free TFDQuery
        end;
    except
      on E: Exception do
        // 'Encountered error while retrieving record count [GetRecordCount()]:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000162, [E.Message]);
    end

    // TFDTable
  else if (ADataSet is TFDTable) then
    try
      ATableName := TFDTable(ADataSet).TableName;
      if (ATableName = '') then
        Exit;

      with TFDQuery.Create(nil) do
        try
          Connection := TFDTable(ADataSet).Connection;
          SQL.Add('SELECT COUNT(*) AS n_count FROM');
          // 01/21/2008 If the table name has spaces, such as a DBF file name,
          // then wrap it in quotation marks.
          if (Pos(' ', ATableName) > 0) then
            SQL.Add('"' + ATableName + '"')
          else
            SQL.Add(ATableName);
          if TFDTable(ADataSet).Filtered and
            (Trim(TFDTable(ADataSet).Filter) > '') then
            begin
              SQL.Add(Format('WHERE %s', [TFDTable(ADataSet).Filter]));
            end;
          Open;
          Result := Fields[0].AsInteger;
        finally
          Free; // free TFDQuery
        end;
    except
      on E: Exception do
        // 'Encountered error while retrieving record count [GetRecordCount()]:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000162, [E.Message]);
    end
    // TFDQuery
  else if (ADataSet is TFDQuery) then
    try
      with TFDQuery.Create(nil) do
        try
          Connection := TFDQuery(ADataSet).Connection;
          ASQLText := TFDQuery(ADataSet).SQL.Text;
          SQL.Add('SELECT COUNT(*) AS n_count FROM');
          SQL.Add('(');
          SQL.Add(TFDQuery(ADataSet).SQL.Text);
          SQL.Add(')');
          // Assign parameters
          if (Params.Count > 0) and
            (Params.Count = TFDQuery(ADataSet).Params.Count) then
            for i := 0 to Params.Count - 1 do
              begin
                Params[i].DataType := TFDQuery(ADataSet).Params[i].DataType;
                Params[i].ParamType := TFDQuery(ADataSet).Params[i].ParamType;
              end;
          BeforeOpen := TFDQuery(ADataSet).BeforeOpen;
          DataSource := TFDQuery(ADataSet).DataSource;
          Open;
          Result := Fields[0].AsInteger;
        finally
          Free;
        end;
    except
      on E: Exception do
        // 'Encountered error while retrieving record count [GetRecordCount()]:'#13#13'%s'
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000162, [E.Message]);
    end;
end;

end.
