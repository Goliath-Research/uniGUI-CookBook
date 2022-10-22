(*
  02-04-2010 - originally we created a substitute BOM for ALL workorders sharing that BOM. But based on the email from Nancy
               "Workorder - cannot delete due to sub-bom  #417741" I changed it to create a substitute BOM for EVERY workorder using that material.
  FBomList is a TStringList of unique standard_ids. Each FBomList[i] points to another TStringList representing workorders
  standard_id 1 ---> points to WO1, WO2, WO3 etc
  standard_id 2 --->           WO4, WO5 ...
  ...
*)
unit mat_xcpt_alternate;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Phys,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  IQUniGrid,
  uniGUIFrame,
  Vcl.Grids;

type
  TFrmMatXcptAlternate = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    SrcArinvtAlt: TDataSource;
    IQSearch1: TIQUniGridControl;
    QryArinvtAlt: TFDQuery;
    QryArinvtAltID: TBCDField;
    QryArinvtAltALT_ITEMNO: TStringField;
    QryArinvtAltORIG_ITEMNO: TStringField;
    QryArinvtAltARINVT_ID: TBCDField;
    QryArinvtAltPARENT_ARINVT_ID: TBCDField;
    SrcWO: TDataSource;
    QryWO: TFDQuery;
    QryWOWORKORDER_ID: TBCDField;
    QryWOTOT_MAT_QTY: TFMTBCDField;
    QryWOORIGIN: TStringField;
    QryWOHARD_ALLOC_QTY: TFMTBCDField;
    QryWOSTANDARD_ID: TBCDField;
    QryWOMFGNO: TStringField;
    procedure QryArinvtAltBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryWOBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_Alternate_ID: Real;
    FFirstMustArriveDate: TDateTime;
    FDivision_ID        : Real;
    FCost_Object_ID     : Real;
    FCost_Object_Source : string;

    FBomList: TStringList;
    FACost_Object_Source: String;
    function CheckAddToListStandard_ID(AStandard_ID: Real): Integer;
    procedure ClearList;
    procedure PrepareListOfWorkorders;
    procedure CheckAddToListWorkorder_ID( AWorkorder_ID: Real; ABomListIndex: Integer );
    procedure SubstituteWorkordersBOM( AExist_Standard_ID: Real; AWO_List: TStringList );
    procedure SetArinvt_Alternate_ID(const Value: Real);
    procedure SetDivision_ID(const Value: Real);
    procedure SetCost_Object_ID(const Value: Real);
    procedure SetCost_Object_Source(const Value: String);
  public
    { Public declarations }
    class function DoShowModal(AArinvt_Alternate_ID, ADivision_ID, ACost_Object_ID: Real; ACost_Object_Source: string): Boolean;
    class procedure DoSubstituteWorkordersBOM(AExist_Standard_ID, AWorkorder_ID, AArinvt_Alternate_ID: Real; AMustArriveDate: TDateTime); static;
    class function CloneBOMUsingAlternate(AExist_Standard_ID, AArinvt_Alternate_ID: Real): Real;

    property Arinvt_Alternate_ID : Real write SetArinvt_Alternate_ID;
    property Division_ID : Real write SetDivision_ID;
    property Cost_Object_ID :Real write SetCost_Object_ID;
    property Cost_Object_Source: String write SetCost_Object_Source;
  end;
implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers;
  { TODO -oGPatil -cWebConvert : Dependency on File wo_misc.pas File
  wo_misc; }

class function TFrmMatXcptAlternate.DoShowModal(AArinvt_Alternate_ID, ADivision_ID, ACost_Object_ID: Real; ACost_Object_Source: string ): Boolean;
var
   LFrmMatXcptAlternate : TFrmMatXcptAlternate;
begin
  LFrmMatXcptAlternate := TFrmMatXcptAlternate.Create(UniGUIApplication.UniApplication);
  LFrmMatXcptAlternate.Arinvt_Alternate_ID := AArinvt_Alternate_ID;
  LFrmMatXcptAlternate.Division_ID := ADivision_ID;
  LFrmMatXcptAlternate.Cost_Object_ID := ACost_Object_ID;
  LFrmMatXcptAlternate.Cost_Object_Source := ACost_Object_Source;
  Result := LFrmMatXcptAlternate.ShowModal = mrOK;
end;

procedure TFrmMatXcptAlternate.FormDestroy(Sender: TObject);
begin
  ClearList;
  FBomList.Free;
end;

procedure TFrmMatXcptAlternate.ClearList;
var
  I: Integer;
begin
  for I:= 0 to FBomList.Count -1 do
    FBomList.Objects[ I ].Free;
  FBomList.Clear;
end;

procedure TFrmMatXcptAlternate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmMatXcptAlternate.QryArinvtAltBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('arinvt_alternate_id').asFloat:= FArinvt_Alternate_ID
  AssignQueryParamValue(DataSet, 'arinvt_alternate_id', FArinvt_Alternate_ID);
end;

procedure TFrmMatXcptAlternate.QryWOBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('arinvt_id').asFloat          := QryArinvtAltPARENT_ARINVT_ID.asFloat;
  //   ParamByName('division_id').asFloat        := FDivision_ID;
  //   ParamByName('cost_object_id').asFloat     := FCost_Object_ID;
  //   ParamByName('cost_object_source').asString:= FCost_Object_Source;
  //   ParamByName('must_arrive').asDateTime     := FFirstMustArriveDate;
  // end;
  AssignQueryParamValue(DataSet, 'arinvt_id',         QryArinvtAltPARENT_ARINVT_ID.asFloat);
  AssignQueryParamValue(DataSet, 'division_id',       FDivision_ID );
  AssignQueryParamValue(DataSet, 'cost_object_id',    FCost_Object_ID);
  AssignQueryParamValue(DataSet, 'cost_object_source',FCost_Object_Source);
  AssignQueryParamValue(DataSet, 'must_arrive',       FFirstMustArriveDate);
end;

procedure TFrmMatXcptAlternate.btnOKClick(Sender: TObject);
var
  I: Integer;
begin
  with IQSearch1 do IQAssert( not (DataSource.DataSet.Eof and DataSource.DataSet.Bof), 'Nothing is selected - operation aborted.');

  UniMainModule.FDConnection1.StartTransaction;
  try
    PrepareListOfWorkorders;

    for I:= 0 to FBomList.Count - 1 do
      SubstituteWorkordersBOM( StrToFloat(FBomList[ I ]), TStringList(FBomList.Objects[ I ]));

    UniMainModule.FDConnection1.Commit;
  finally
    if UniMainModule.FDConnection1.InTransaction then UniMainModule.FDConnection1.RollBack;
  end;
  ModalResult:= mrOK;
end;


function TFrmMatXcptAlternate.CheckAddToListStandard_ID( AStandard_ID: Real ): Integer;
var
  I: Integer;
begin
  // attempt to find this standard_id, if not found then add one
  for I:= 0 to FBomList.Count - 1 do
    if FBomList[ I ] = FloatToStr( AStandard_ID ) then
    begin
      Result:= I;
      EXIT;
    end;

  // append to list
  Result:= FBomList.Add( FloatToStr( AStandard_ID ));
end;

procedure TFrmMatXcptAlternate.CheckAddToListWorkorder_ID( AWorkorder_ID: Real; ABomListIndex: Integer );
var
  I: Integer;
  AWOList: TStringList;
begin
  // do we have tstringlist for workorders associated with this standard_id - if not then create one
  if not Assigned(FBomList.Objects[ ABomListIndex ]) then
     FBomList.Objects[ ABomListIndex ]:= TStringList.Create;

  // attempt to find the WO in the tstringlist
  AWOList:= TStringList(FBomList.Objects[ ABomListIndex ]);
  for I:= 0 to AWOList.Count - 1 do
    if AWOList[ I ] = FloatToStr( AWorkorder_ID ) then
       EXIT;

  // append to list
  AWOList.Add( FloatToStr( AWorkorder_ID ));
end;


procedure TFrmMatXcptAlternate.PrepareListOfWorkorders;
var
  I:Integer;
  ABomListIndex: Integer;
begin
  ClearList;
{ TODO -oGPatil -cWebConvert : All properties of DataSet and dbgrid not present
  with IQSearch1 do
  try
     DataSet.DisableControls;
     if Wwdbgrid.SelectedList.Count > 0 then
        for I:= 0 to Wwdbgrid.SelectedList.Count - 1 do
        begin
          DataSet.GotoBookmark( Wwdbgrid.SelectedList.Items[ I ]);
          ABomListIndex:= CheckAddToListStandard_ID( DataSet.FieldByName('standard_id').asFloat);
          CheckAddToListWorkorder_ID( DataSet.FieldByName('workorder_id').asFloat, ABomListIndex );
        end
     else
        begin
          ABomListIndex:= CheckAddToListStandard_ID( DataSet.FieldByName('standard_id').asFloat);
          CheckAddToListWorkorder_ID( DataSet.FieldByName('workorder_id').asFloat, ABomListIndex );
        end;

  finally
     DataSet.EnableControls;
  end;
}
end;


class function TFrmMatXcptAlternate.CloneBOMUsingAlternate(AExist_Standard_ID, AArinvt_Alternate_ID: Real): Real;
var
  ANew_MfgNo: string;
  AParentArinvt_ID: Real;
  AArinvt_ID: Real;
begin
  Result:= GetNextID('standard');
  ANew_MfgNo      := Format('SUB-%.0f', [ Result ]);

  // clone
  ExecuteCommandFmt('declare                                                         '+
            '  v_new_standard_id   number::=%f;                              '+
            '  v_exist_standard_id number::=%f;                              '+
            'begin                                                           '+
               // create new bom place holder
            '  insert into standard(id, mfgno, pk_hide)                      '+
            '  values(v_new_standard_id, ''%s'', ''Y'');                     '+

               // clone existing original bom
            '  bom_clone_standard( v_exist_standard_id, v_new_standard_id ); '+

            'end;                                                            ',
            [ Result,
              AExist_Standard_ID,
              ANew_MfgNo ]);

  // substitute material
  AParentArinvt_ID:= SelectValueByID('parent_arinvt_id', 'arinvt_alternate', AArinvt_Alternate_ID);
  AArinvt_ID      := SelectValueByID('arinvt_id', 'arinvt_alternate', AArinvt_Alternate_ID);

  ExecuteCommandFmt('begin bom_misc.substitute_alternate_item( %f, %f, %f ); end;',
            [ Result,
              AParentArinvt_ID,
              AArinvt_ID ]);
end;



procedure TFrmMatXcptAlternate.SetArinvt_Alternate_ID(const Value: Real);
begin
  FArinvt_Alternate_ID:= Value;
end;

procedure TFrmMatXcptAlternate.SetCost_Object_ID(const Value: Real);
begin
  FCost_Object_ID := Value;
end;

procedure TFrmMatXcptAlternate.SetCost_Object_Source(const Value: String);
begin
    FACost_Object_Source := Value;
end;

procedure TFrmMatXcptAlternate.SetDivision_ID(const Value: Real);
begin
  FDivision_ID := Value;
end;

procedure TFrmMatXcptAlternate.SubstituteWorkordersBOM( AExist_Standard_ID: Real; AWO_List: TStringList );
var
  AOrig_Standard_ID: Real;
  I                : Integer;
  ANew_Standard_ID : Real;
begin
  for I:= 0 to AWO_List.Count - 1 do
    DoSubstituteWorkordersBOM( AExist_Standard_ID, StrToFloat( AWO_List[ I ]), FArinvt_Alternate_ID, FFirstMustArriveDate );
end;

procedure TFrmMatXcptAlternate.UniFormCreate(Sender: TObject);
begin
  FBomList:= TStringList.Create;
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmMatXcptAlternate.UniFormShow(Sender: TObject);
begin
  FFirstMustArriveDate:= SelectValueFmtAsFloat('select min(x.must_arrive ) from xcpt_mat_req x where x.arinvt_id = %f                       '+
                                   '   and mat_po_xcpt.filter_cost_object( ''%s'', %f, cost_object_source, cost_object_id ) = 1 '+
                                   '   and NVL(division_id,0) = NVL(%f,0)',
                                   [ DtoF(SelectValueByID( 'parent_arinvt_id', 'arinvt_alternate', FArinvt_Alternate_ID)),
                                     FCost_Object_Source,
                                     FCost_Object_ID,
                                     FDivision_ID ]);
  Reopen(QryArinvtAlt);
  Reopen(QryWO);
end;

class procedure TFrmMatXcptAlternate.DoSubstituteWorkordersBOM(AExist_Standard_ID, AWorkorder_ID, AArinvt_Alternate_ID: Real; AMustArriveDate: TDateTime);
var
  AOrig_Standard_ID: Real;
  I                : Integer;
  ANew_Standard_ID : Real;
begin
  AOrig_Standard_ID:= SelectValueByID('standard_id_orig', 'workorder', AWorkorder_ID);

  // clone BOM
  ANew_Standard_ID:= CloneBOMUsingAlternate( AExist_Standard_ID, AArinvt_Alternate_ID );

  // substitute in the workorder
  ExecuteCommandFmt('declare                                                         '+
            '  v_new_standard_id   number::=%f;                              '+
            '  v_exist_standard_id number::=%f;                              '+
            '  v_orig_standard_id  number::=%f;                              '+
            '  v_workorder_id      number::=%f;                              '+
            'begin                                                           '+
              // replace standard_id
            '  update workorder set standard_id = v_new_standard_id          '+
            '   where id = v_workorder_id;                                   '+

               // replace partno in ptorder
            '  for v in (select a.id, b.arinvt_id from ptorder a, partno b   '+
            '             where a.workorder_id = v_workorder_id              '+
            '               and a.partno_id = b.id)                          '+
            '  loop                                                          '+
            '    update ptorder                                              '+
            '       set partno_id = (select id from partno                   '+
            '                         where standard_id = v_new_standard_id  '+
            '                           and arinvt_id = v.arinvt_id)         '+
            '     where id = v.id;                                           '+
            '  end loop;                                                     '+
            '                                                                '+
              // delete previoulsy substituted bom if any
            '  workorder_misc.check_delete_substituted_bom( v_exist_standard_id, v_orig_standard_id, v_workorder_id ); '+

              // convert WO to firm
            '  IRV32.Convert_To_Firm( v_workorder_id );                      '+

            'end;                                                            ',
            [ ANew_Standard_ID,
              AExist_Standard_ID,
              AOrig_Standard_ID,
              AWorkorder_ID ]);

  { TODO -oGPatil -cWebConvert : Dependency on File wo_misc.pas File
  UpdateDayUseAlternateItem( AWorkorder_ID, AArinvt_Alternate_ID, AMustArriveDate );
  }
end;



end.
