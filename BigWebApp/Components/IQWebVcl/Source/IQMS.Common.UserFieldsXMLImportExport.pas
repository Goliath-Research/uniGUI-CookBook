unit IQMS.Common.UserFieldsXMLImportExport;

interface

uses
    System.SysUtils, System.Classes, Vcl.Forms, Vcl.Dialogs,
    IQMS.Common.UserFieldsXMLTypes, Vcl.ExtDlgs, FireDAC.Comp.Client;

type
  {----------------------------------------------------------------------------}
  TUDFormExport = class
    FUD_Tables_ID: Real;
    FTableName: string;
    FSource: string;
    FAttribute: string;
    FXMLFileName: string;
    QryUD_Tables  : TFDQuery;
    QryUD_Cols    : TFDQuery;
    QryUD_Tabsheet: TFDQuery;
    QryUD_Groupbox: TFDQuery;

    FUD_Form: IXMLUd_formType;

  private
    function AssignFileName: Boolean;
    procedure AddUD_Tables;
    procedure AddUD_Cols;
    procedure AddUD_Tabsheet;
  public
    constructor Create( AOwner: TComponent; AUD_Tables_ID: Real; ATableName, ASource, AAttribute: string );
    function Execute: Boolean;
    destructor Destroy;
  end;


  {----------------------------------------------------------------------------}
  TUDFormImport = class
    FUD_Tables_ID: Real;
    FTableName: string;
    FSource: string;
    FAttribute: string;
    FXMLFileName: string;
    FUD_Form: IXMLUd_formType;
  private
    function AssignFileName: Boolean;
    procedure AddUD_Tables;
    procedure AddUD_Tabsheet;
    procedure AddUD_Cols;
    function MapToNewGroupbox_ID(AOldUD_Groupbox_ID: Integer): Integer;
  public
    constructor Create( AOwner: TComponent; AUD_Tables_ID: Real; ATableName, ASource, AAttribute: string );
    function Execute: Boolean;
  end;


implementation

uses Data.DB, IQMS.Common.DataLib, IQMS.Common.NLS, IQMS.Common.StringUtils,
  IQMS.Common.Dialogs, IQMS.Common.usr_stru;

{$REGION 'Generated XML Structure'}
{
<ud_tables>
 <id>123</id>
 etc...

 <ud_tabsheet>
   <row>
     <id>123</id>
     etc...

     <ud_groupbox>
       <row>
          <id>123</id>
          etc...

       </row>

       etc...
     </ud_groupbox>
   </row>

   etc...
 </ud_tabsheet>

 <ud_cols>
   <row>
     <id>123</id>
     etc...
   </row>

   etc...
 </ud_cols>
</ud_table>
}
{$ENDREGION}

{$REGION 'Note: alternative generic method of exporting without using bindings'}
//--
//--  procedure TFrmUsr_Define_Stru.Export1Click(Sender: TObject);
//-- var
//--   XMLDoc   : IXMLDocument;
//--   AFileName: string;
//--   ANode1   : IXMLNode;
//--   ANode2   : IXMLNode;
//--   ANode3   : IXMLNode;
//--
//--   QryUD_Tables  : TFDQuery;
//--   QryUD_Cols    : TFDQuery;
//--   QryUD_Tabsheet: TFDQuery;
//--   QryUD_Groupbox: TFDQuery;
//--
//--   procedure _InitUDStructureQueries;
//--   begin
//--     QryUD_Tables  := TFDQuery.Create(nil);
//--     QryUD_Cols    := TFDQuery.Create(nil);
//--     QryUD_Tabsheet:= TFDQuery.Create(nil);
//--     QryUD_Groupbox:= TFDQuery.Create(nil);
//--
//--     QryUD_Tables.Connection := db_dm.FDConnection;
//--     QryUD_Cols.DataBaseName    := 'IQ';
//--     QryUD_Tabsheet.Connection := db_dm.FDConnection;
//--     QryUD_Groupbox.Connection := db_dm.FDConnection;
//--
//--     QryUD_Tables.SQL.Add(Format('select * from ud_tables where id = %f', [ FUD_Tab_ID ]));
//--     QryUD_Tables.Open;
//--
//--     QryUD_Cols.SQL.Add(Format('select * from ud_cols where ud_tables_id = %f order by id', [ FUD_Tab_ID ]));
//--     QryUD_Cols.Open;
//--
//--     QryUD_Tabsheet.SQL.Add(Format('select * from ud_tabsheet where ud_tables_id = %f order by id', [ FUD_Tab_ID ]));
//--     QryUD_Tabsheet.Open;
//--
//--     QryUD_Groupbox.SQL.Add('select * from ud_groupbox where ud_tabsheet_id = :ud_tabsheet_id');
//--     QryUD_Groupbox.ParamByName('ud_tabsheet_id').DataType:= ftFloat;
//--   end;
//--
//--   procedure _FreeUDStructureQueries;
//--   begin
//--     if Assigned(QryUD_Tables  ) then QryUD_Tables.Free;
//--     if Assigned(QryUD_Cols    ) then QryUD_Cols.Free;
//--     if Assigned(QryUD_Tabsheet) then QryUD_Tabsheet.Free;
//--     if Assigned(QryUD_Groupbox) then QryUD_Groupbox.Free;
//--   end;
//--
//--   function _ExportRecord( AQry: TFDQuery; AParentNode: IXMLNode ): IXMLNode;
//--   var
//--     I: Integer;
//--     ANode: IXMLNode;
//--   begin
//--     // create <row> </row> element
//--     Result:= XMLDoc.CreateNode( 'row', ntElement );
//--     AParentNode.ChildNodes.Add( Result );
//--
//--     // insert columns for that row
//--     for I:= 0 to AQry.FieldCount - 1 do
//--     begin
//--       ANode:= Result.AddChild( LowerCase( AQry.Fields[ I ].FieldName ));
//--       if Trim(AQry.Fields[ I ].asString) > '' then
//--          ANode.Text:= Trim(AQry.Fields[ I ].asString);
//--     end;
//--
//--     // add place holder for next_id (used for import)
//--     if AQry.FindField('id') <> nil then
//--     begin
//--        ANode:= Result.AddChild( 'next_id' );
//--        ANode.Text:= '0';
//--     end;
//--   end;
//--
//-- begin
//--
//--   // save to prompt
//--   with FileSaveDialog1 do
//--   begin
//--     if FileName = '' then
//--        FileName:= Format('ud_%s.xml', [ LowerCase( GetSource_Name )]);
//--     if not Execute then
//--        EXIT;
//--     AFileName:= FileName;
//--   end;
//--
//--   _InitUDStructureQueries;
//--   try
//--     // create XML Document
//--     XMLDoc:= TXMLDocument.Create(nil);  // nil will force delphi to free memory automatically when XMLDoc goes out of scope
//--     XMLDoc.Active:= TRUE;
//--
//--     // root element
//--     XMLDoc.DocumentElement:= XMLDoc.CreateNode( 'ud_tables', ntElement );
//--
//--     // ud_tables
//--     _ExportRecord( QryUD_Tables, XMLDoc.DocumentElement );
//--
//--     // ud_cols
//--     ANode1:= XMLDoc.CreateNode( 'ud_cols', ntElement );
//--     XMLDoc.DocumentElement.ChildNodes.Add( ANode1 );
//--     with QryUD_Cols do while not Eof do
//--     begin
//--       _ExportRecord( QryUD_Cols, ANode1 );
//--       Next;
//--     end;
//--
//--     // ud_tabsheet
//--     ANode1:= XMLDoc.CreateNode( 'ud_tabsheet', ntElement );
//--     XMLDoc.DocumentElement.ChildNodes.Add( ANode1 );
//--     with QryUD_Tabsheet do while not Eof do
//--     begin
//--       ANode2:= _ExportRecord( QryUD_Tabsheet, ANode1 );
//--
//--       // ud_groupbox
//--       QryUD_Groupbox.Close;
//--       QryUD_Groupbox.ParamByName('ud_tabsheet_id').Value := QryUD_Tabsheet.FieldByName('id').asFloat;
//--       QryUD_Groupbox.Open;
//--
//--       ANode3:= XMLDoc.CreateNode( 'ud_groupbox', ntElement );
//--       ANode2.ChildNodes.Add( ANode3 );
//--       while not QryUD_Groupbox.Eof do
//--       begin
//--         _ExportRecord( QryUD_Groupbox, ANode3 );
//--         QryUD_Groupbox.Next;
//--       end;
//--
//--       Next;
//--     end;
//--
//--     XMLDoc.SaveToFile( AFileName );
//--   finally
//--    _FreeUDStructureQueries
//--   end;
//-- end;
//--
{$ENDREGION}


{ TUDFormExport }
{ ---------------------------------------------------------------------------- }
constructor TUDFormExport.Create( AOwner: TComponent; AUD_Tables_ID: Real; ATableName, ASource, AAttribute: string );
begin
  FUD_Tables_ID:= AUD_Tables_ID;
  FTableName   := ATableName;
  FSource      := ASource;
  FAttribute   := AAttribute;
  FXMLFileName := TFrmUsr_Define_Stru.GetXMLFileName( ASource, FTableName, FAttribute );  // usr_stru.pas

  QryUD_Tables               := TFDQuery.Create(nil);
  QryUD_Tables.ConnectionName:='IQFD';
  QryUD_Tables.SQL.Add(IQFormat('select * from ud_tables where id = %f', [ FUD_Tables_ID ]));

  QryUD_Cols                 := TFDQuery.Create(nil);
  QryUD_Cols.ConnectionName:='IQFD';
  QryUD_Cols.SQL.Add(IQFormat('select * from ud_cols where ud_tables_id = %f order by id', [ FUD_Tables_ID ]));

  QryUD_Tabsheet             := TFDQuery.Create(nil);
  QryUD_Tabsheet.ConnectionName:='IQFD';
  QryUD_Tabsheet.SQL.Add(IQFormat('select * from ud_tabsheet where ud_tables_id = %f order by id', [ FUD_Tables_ID ]));

  QryUD_Groupbox             := TFDQuery.Create(nil);
  QryUD_Groupbox.ConnectionName:='IQFD';
  QryUD_Groupbox.SQL.Add('select * from ud_groupbox where ud_tabsheet_id = :ud_tabsheet_id');
  QryUD_Groupbox.ParamByName('ud_tabsheet_id').DataType:= ftFloat;
end;

destructor TUDFormExport.Destroy;
begin
  QryUD_Tables.Free;
  QryUD_Cols.Free;
  QryUD_Tabsheet.Free;
  QryUD_Groupbox.Free;
  inherited;
end;

function TUDFormExport.Execute: Boolean;
begin
  Result:= FALSE;

  // get save to file name
  if not AssignFileName() then
     EXIT;

  // open tables
  QryUD_Tables.Open;
  QryUD_Cols.Open;
  QryUD_Tabsheet.Open;

  // create empty XML
  FUD_Form:= IQMS.Common.UserFieldsXMLTypes.Newud_form();

  // ud_tables
  AddUD_Tables();

  // ud_cols
  AddUD_Cols();

  // ud_tabsheet
  AddUD_Tabsheet();

  FUD_Form.OwnerDocument.SaveToFile( FXMLFileName );

  Result:= TRUE;
end;


function TUDFormExport.AssignFileName: Boolean;
begin
  with TFileSaveDialog.Create(nil) do
  try
    Options:= [fdoOverWritePrompt];
    with FileTypes.Add do
    begin
      DisplayName:='xml';
      FileMask:= '*.xml';
    end;
    with FileTypes.Add do
    begin
      DisplayName:='Any File';
      FileMask:= '*.*';
    end;
    FileName:= FXMLFileName;

    Result:= Execute;

    if Result then
       FXMLFileName:= FileName;
  finally
    Free;
  end;
end;


procedure TUDFormExport.AddUD_Tables;
begin
  with FUD_Form.UD_Tables.UD_Tables_Row do
  begin
    ID              := QryUD_Tables.FieldByName('id').asInteger;
    Table_name      := QryUD_Tables.FieldByName('Table_name').asString;
    Form_caption    := QryUD_Tables.FieldByName('Form_caption').asString;
    Menu_caption    := QryUD_Tables.FieldByName('Menu_caption').asString;
    Source_attribute:= QryUD_Tables.FieldByName('Source_attribute').asString;
    Source          := QryUD_Tables.FieldByName('Source').asString;
    Next_ID         := 0;
  end;
end;


procedure TUDFormExport.AddUD_Cols;
var
  ACol: IXMLUd_cols_rowType;
begin
  with FUD_Form.UD_Cols do
  begin
    while not QryUD_Cols.Eof do
    begin
      ACol:= Add();
      ACol.ID            := QryUD_Cols.FieldByName('ID').asInteger;
      ACol.UD_tables_id  := QryUD_Cols.FieldByName('UD_tables_id').asInteger;
      ACol.Col_name      := QryUD_Cols.FieldByName('Col_name').asString;
      ACol.Col_label     := QryUD_Cols.FieldByName('Col_label').asString;
      ACol.Col_type      := QryUD_Cols.FieldByName('Col_type').asString;
      ACol.Seq           := QryUD_Cols.FieldByName('Seq').asInteger;
      ACol.Use_component := QryUD_Cols.FieldByName('Use_component').asString;
      ACol.Tab_name      := QryUD_Cols.FieldByName('Tab_name').asString;
      ACol.Col_kind      := QryUD_Cols.FieldByName('Col_kind').asString;
      ACol.Linked_Col_Name:= QryUD_Cols.FieldByName('Linked_Col_Name').asString;
      ACol.Sql_text      := QryUD_Cols.FieldByName('Sql_text').asString;
      ACol.Ud_groupbox_id:= QryUD_Cols.FieldByName('Ud_groupbox_id').asInteger;
      ACol.Groupbox_seq  := QryUD_Cols.FieldByName('Groupbox_seq').asInteger;
      ACol.Next_id       := 0;

      QryUD_Cols.Next;
    end;
  end;
end;


procedure TUDFormExport.AddUD_Tabsheet();
var
  ATabsheet: IXMLUd_tabsheet_rowType;
  AGroupbox: IXMLUd_groupbox_rowType;
begin
  with FUD_Form.UD_Tabsheet do
  begin
    while not QryUD_Tabsheet.Eof do
    begin
      ATabsheet:= Add();
      ATabsheet.ID          := QryUD_Tabsheet.FieldByName('ID').asInteger;
      ATabsheet.UD_Tables_id:= QryUD_Tabsheet.FieldByName('UD_tables_id').asInteger;
      ATabsheet.Name        := QryUD_Tabsheet.FieldByName('Name').asString;
      ATabsheet.Caption     := QryUD_Tabsheet.FieldByName('Caption').asString;
      ATabsheet.Seq         := QryUD_Tabsheet.FieldByName('Seq').asInteger;
      ATabsheet.Next_id     := 0;

      // ud_groupbox
      QryUD_Groupbox.Close;
      QryUD_Groupbox.ParamByName('ud_tabsheet_id').Value := QryUD_Tabsheet.FieldByName('id').asFloat;
      QryUD_Groupbox.Open;
      while not QryUD_Groupbox.Eof do
      begin
        AGroupbox:= ATabsheet.UD_Groupbox.Add();
        AGroupbox.ID            := QryUD_Groupbox.FieldByName('ID').asInteger;
        AGroupbox.UD_Tabsheet_id:= QryUD_Groupbox.FieldByName('UD_Tabsheet_ID').asInteger;
        AGroupbox.Name          := QryUD_Groupbox.FieldByName('Name').asString;
        AGroupbox.Caption       := QryUD_Groupbox.FieldByName('Caption').asString;
        AGroupbox.Row_num       := QryUD_Groupbox.FieldByName('Row_num').asInteger;
        AGroupbox.Col_num       := QryUD_Groupbox.FieldByName('Col_num').asInteger;
        AGroupbox.Next_id       := 0;

        QryUD_Groupbox.Next;
      end;

      QryUD_Tabsheet.Next;
    end;
  end;
end;


{ TUDFormImport }
{ ---------------------------------------------------------------------------- }
constructor TUDFormImport.Create( AOwner: TComponent; AUD_Tables_ID: Real; ATableName, ASource, AAttribute: string );
begin
  FUD_Tables_ID:= AUD_Tables_ID;
  FTableName   := ATableName;
  FSource      := ASource;
  FAttribute   := AAttribute;
  FXMLFileName := TFrmUsr_Define_Stru.GetXMLFileName( ASource, FTableName, FAttribute );  // usr_stru.pas
end;

function TUDFormImport.Execute: Boolean;
begin
  Result:= FALSE;
  if not IQWarningYN('This option deletes any existing data for selected user defined form and imports a new user defined structure. Are you sure you want to continue?') then
     EXIT;

  // get save to file name
  if not AssignFileName() then
     EXIT;

  // load XML
  FUD_Form:= IQMS.Common.UserFieldsXMLTypes.LoadUD_Form( FXMLFileName );

  // get rid of the existing data
  ExecuteCommandFmt('delete from ud_tables where id = %f', [  FUD_Tables_ID ]);

  // load ud_tables
  AddUD_Tables;

  // load ud_tabsheet
  AddUD_Tabsheet;

  // load ud_cols
  AddUD_Cols;
end;

function TUDFormImport.AssignFileName: Boolean;
begin
  with TOpenTextFileDialog.Create(nil) do
  try
    Options:= [ofEnableSizing];
    DefaultExt:= '.xml';
    FileName:= FXMLFileName;

    Result:= Execute;

    if Result then
       FXMLFileName:= FileName;
  finally
    Free;
  end;
end;

procedure TUDFormImport.AddUD_Tables;
begin
  with FUD_Form.UD_Tables.UD_Tables_Row do
  begin
    // append ud_tables record
    Next_ID:= Trunc(FUD_Tables_ID);
    ExecuteCommandFmt('insert into ud_tables                                                 '+
              '     ( id, table_name, form_caption, menu_caption, source_attribute, source ) '+
              'values                                                                '+
              '     ( %d, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'' )                   ',
              [ Next_ID,
                FTableName,
                FixStr(Form_caption),
                FixStr(Menu_caption),
                FAttribute,
                FSource ]);
  end;
end;

procedure TUDFormImport.AddUD_Tabsheet;
var
  I, J: Integer;
  ATabsheet: IXMLUd_tabsheet_rowType;
  AGroupbox: IXMLUd_groupbox_rowType;
begin
  // loop over ud_tabsheet nodes
  for I:= 0 to FUD_Form.UD_Tabsheet.Count - 1 do
  begin
    ATabsheet:= FUD_Form.UD_Tabsheet.UD_Tabsheet_Row[ I ];

    // append ud_tabsheet
    ATabsheet.Next_ID:= GetNextID('ud_tabsheet');   // note how we update XML to have a mapping between original id and the new id (next_id)
    ExecuteCommandFmt('insert into ud_tabsheet                       '+
              '     ( id, ud_tables_id, name, caption, seq ) '+
              'values                                        '+
              '     ( %d, %d, ''%s'', ''%s'', %d )           ',
              [ ATabsheet.Next_ID,
                Trunc(FUD_Tables_ID),
                FixStr(ATabsheet.Name),
                FixStr(ATabsheet.Caption),
                ATabsheet.Seq ]);

    // loop over ud_groupbox nodes
    for J:= 0 to ATabsheet.UD_Groupbox.Count - 1 do
    begin
      AGroupbox:= ATabsheet.UD_Groupbox.UD_Groupbox_Row[ J ];

      // append this ud_groupbox
      AGroupbox.Next_ID:= GetNextID('ud_groupbox');   // note how we update XML to have a mapping between original id and the new id (next_id)
      ExecuteCommandFmt('insert into ud_groupbox                                      '+
                '     ( id, ud_tabsheet_id, name, caption, row_num, col_num ) '+
                'values                                                       '+
                '     ( %d, %d, ''%s'', ''%s'', %d, %d )                      ',
                [ AGroupbox.Next_ID,
                  ATabsheet.Next_ID,
                  FixStr(AGroupbox.Name),
                  FixStr(AGroupbox.Caption),
                  AGroupbox.Row_Num,
                  AGroupbox.Col_Num ]);
    end;
  end;
end;


procedure TUDFormImport.AddUD_Cols;
var
  I: Integer;
  ACol: IXMLUd_cols_rowType;
  AMappedUD_Groupbox_ID: Integer;
begin
  // loop over ud_cols nodes
  for I:= 0 to FUD_Form.UD_Cols.Count - 1 do
  begin
    ACol:= FUD_Form.UD_Cols.UD_Cols_Row[ I ];

    ACol.Next_ID         := GetNextID('ud_cols');   // note how we update XML to have a mapping between original id and the new id (next_id)
    AMappedUD_Groupbox_ID:= MapToNewGroupbox_ID( ACol.UD_Groupbox_ID );

    ExecuteCommandFmt('insert into ud_cols                                                                 '+
              '     ( id, ud_tables_id, col_name, col_label, col_type, seq, use_component,         '+
              '       tab_name, col_kind, sql_text, ud_groupbox_id, groupbox_seq, linked_col_name) '+
              'values                                                                              '+
              '     ( %d, %d, ''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s'', ''%s'', %d, %d,  '+
              '       ''%s'' )                                                                     ',
              [ ACol.Next_id,
                Trunc(FUD_Tables_ID),
                ACol.Col_Name,
                ACol.Col_Label,
                ACol.Col_Type,
                ACol.Seq,
                ACol.Use_Component,
                ACol.Tab_Name,          // obsolete!
                ACol.Col_Kind,
                ACol.Sql_Text,
                AMappedUD_Groupbox_ID,  // ud_groupbox_id,
                ACol.groupbox_seq,
                ACol.Linked_Col_name ]);
  end;
end;

function TUDFormImport.MapToNewGroupbox_ID( AOldUD_Groupbox_ID: Integer ): Integer;
var
  I, J     : Integer;
  ATabsheet: IXMLUd_tabsheet_rowType;
  AGroupbox: IXMLUd_groupbox_rowType;
begin
  for I:= 0 to FUD_Form.UD_Tabsheet.Count - 1 do
  begin
    ATabsheet:= FUD_Form.UD_Tabsheet.UD_Tabsheet_Row[ I ];

    for J:= 0 to ATabsheet.UD_Groupbox.Count - 1 do
    begin
      AGroupbox:= ATabsheet.UD_Groupbox.UD_Groupbox_Row[ J ];
      if AGroupbox.ID = AOldUD_Groupbox_ID then
      begin
        Result:= AGroupbox.Next_ID;
        EXIT;
      end;
    end;
  end;
  Result:= 0;  // s/n happen
end;


end.
