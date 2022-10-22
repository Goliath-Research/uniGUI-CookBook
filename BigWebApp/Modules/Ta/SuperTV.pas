unit SuperTV;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ImgList,
  ComCtrls,
  StdCtrls,
  ExtCtrls,
  Buttons,
  IQMS.WebVcl.SecurityRegister,
  DB,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniTreeView,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TTVCargo = class
    Pr_Emp_Id :Real;
    Supervisor_Id:Real;
    Has_Supervised_Employees :Boolean;
    First_Name:String;
    Middle_Name:String;
    Last_Name:String;
    EmpNo:String;
    constructor Create(APr_Emp_Id :Real; ASupervisor_Id: Real; AHas_Supervised_Employees :boolean; AFirst_Name:String; ALast_Name:String; AEmpNo:String; AMiddle_Name:String);

  end;


type
  TFrmSuperTV = class(TUniForm)
    PnlToolbarMain: TUniPanel;
    sbtnExpand: TUniSpeedButton;
    sbtnCollapse: TUniSpeedButton;
    Bevel1: TUniPanel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    TreeView1: TUniTreeView;
    ImageList1: TUniImageList;
    SR: TIQWebSecurityRegister;
    SbHROverride: TUniSpeedButton;
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SbHROverrideClick(Sender: TObject);
    procedure sbtnExpandClick(Sender: TObject);
    procedure sbtnCollapseClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FId:Real;
    FEmpId:Real;
    procedure LoadTreeViewFromQuery;
    procedure ClearTreeView;
    procedure BuildNodes( APrentNode: TUniTreeNode; ASql:String);
    procedure LoadSubTreeViewFromQuery( AEmpId:Real );
    function AddTVChild(AParent:TUniTreeNode; AQry:TFDQuery): TUniTreeNode;
  public
    { Public declarations }
  end;

function DoEmpSuper():Real;



implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns,
  IQMS.Common.NLS;
{$R *.dfm}

constructor TTVCargo.Create(APr_Emp_Id :Real; ASupervisor_Id:Real; AHas_Supervised_Employees :boolean;  AFirst_Name:String; ALast_Name:String; AEmpNo:String; AMiddle_Name:String);
begin
  Pr_Emp_Id            := APr_Emp_Id           ;
  Supervisor_Id        := ASupervisor_Id       ;
  Has_Supervised_Employees := AHas_Supervised_Employees;
  First_Name           := AFirst_Name          ;
  Last_Name            := ALast_Name           ;
  Middle_Name          := AMiddle_Name           ;
  EmpNo                := AEmpNo               ;
end;


function DoEmpSuper():Real;
var
  FrmSuperTV: TFrmSuperTV;
begin
  FrmSuperTV := TFrmSuperTV.Create(uniGUIApplication.uniApplication);
  with FrmSuperTV do
  try
    ShowModal;
    Result := FId;
  finally
    //Free;
  end;
end;

procedure TFrmSuperTV.UniFormCreate(Sender: TObject);
var
  AuserName:String;
begin
  IQRegFormRead( self, [ self ]);

  AuserName := SelectValueAsString('select ta_misc.getusername from dual');
  FempId := SelectValueFmtAsFloat('select pr_emp_id from s_user_general where user_name = ''%s''', [AuserName]);
  if (FempId <> 0) or ( (FempId = 0) and (SelectValueAsFloat('select ta_misc.GetHrOverride from dual') = 1) ) then
    LoadTreeViewFromQuery;
end;

procedure TFrmSuperTV.LoadTreeViewFromQuery;
begin
  ClearTreeView;
  LoadSubTreeViewFromQuery( FEmpId );
end;

procedure TFrmSuperTV.ClearTreeView;
var
  ANode    : TUniTreeNode;
  AOnChange: TTVChangedEvent;
begin
  with TreeView1 do
  try
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] SuperTV.pas(151): E2010 Incompatible types: 'TTreeNode' and 'TUniTreeNode'}
    //AOnChange:= OnChange;
    OnChange := NIL;
    Items.BeginUpdate;
    ANode:= Items.GetFirstNode;
    while Assigned( ANode ) do
    begin
      if Assigned(ANode.Data) then
         TObject(ANode.Data).Free;
      { TODO -oSanketG -cWebConvert : Need to find alternative for GetNext in TUniTreeNode ,
      [dcc32 Error] SuperTV.pas(159): E2003 Undeclared identifier: 'GetNext'}
      //ANode:= ANode.GetNext;
    end;
    Items.Clear;
  finally
     {TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] SuperTV.pas(167): E2010 Incompatible types: 'TUniTreeNode' and 'TTreeNode'}
    //OnChange:= AOnChange;
    Items.EndUpdate;
  end;
end;

procedure TFrmSuperTV.LoadSubTreeViewFromQuery( AEmpId:Real );
var
  AQry:TFDQuery;
  CurrentNode: TUniTreeNode;
  AHasSupervisedEmps:boolean;
begin
  if AEmpId = 0 then
  begin
    AQry := TFDQuery.Create(self);
    with AQry do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add('select p.* from pr_emp p where p.supervisor_id is null and NVL(p.PK_HIDE, ''N'') = ''N'' and exists (select 1 from pr_emp where supervisor_id = p.id) order by id');
      open;
      if not (eof and bof) then
      begin
        while not eof do
        begin
          AHasSupervisedEmps := SelectValueFmtAsFloat('select count(id) from pr_emp where supervisor_id = %f and NVL(PK_HIDE, ''N'') = ''N''', [FieldByName('id').asFloat]) <> 0;
          CurrentNode := AddTVChild(nil, AQry);
          if AHasSupervisedEmps then
            BuildNodes(CurrentNode, IqFormat('select * from pr_emp where supervisor_id = %f and NVL(PK_HIDE, ''N'') = ''N''', [FieldByName('id').asFloat]));
          Next;
        end;
      end;
    finally
      Free;
    end;

    if SelectValueAsFloat('select count(p.id) from pr_emp p where  p.supervisor_id is null and NVL(p.PK_HIDE, ''N'') = ''N'' and not exists (select 1 from pr_emp where supervisor_id = p.id)') <> 0 then
    begin
      { TODO -oSanketG -cWebConvert : Need to find alternative for GetNext in TUniTreeNode ,
      [dcc32 Error] SuperTV.pas(199): E2003 Undeclared identifier: 'AddChildObject'}
      //CurrentNode := TreeView1.Items.AddChildObject( nil, 'UnSupervised', nil);
      AQry := TFDQuery.Create(self);
      with AQry do
      try
        Connection := UniMainModule.FDConnection1;
        Sql.Add('select p.* from pr_emp p where p.supervisor_id is null and NVL(p.PK_HIDE, ''N'') = ''N'' and not exists (select 1 from pr_emp where supervisor_id = p.id) order by id');
        open;
        if not (eof and bof) then
        begin
          while not eof do
          begin
            { TODO -oSanketG -cWebConvert : Need to find alternative for GetNext in TUniTreeNode ,
             [dcc32 Error] SuperTV.pas(210): E2003 Undeclared identifier: 'AddChildObject'}
            {TreeView1.Items.AddChildObject( CurrentNode,
                                            AQry.FieldByName('First_name').asString + ' ' + Trim(AQry.FieldByName('Middle_name').asString + ' ' + AQry.FieldByName('Last_name').asString) + ' ('
                                            + AQry.FieldByName('empno').asString + ')',
                                            TTVCargo.Create( AQry.FieldByName('id').asFloat,
                                                             0,
                                                             false,
                                                             AQry.FieldByName('First_name').asString,
                                                             AQry.FieldByName('Last_name').asString,
                                                             AQry.FieldByName('empno').asString, AQry.FieldByName('Middle_name').asString )); }
            Next;
          end;
        end;
      finally
        Free;
      end;
    end;
  end
  else
  begin
    AQry := TFDQuery.Create(self);
    with AQry do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add(IqFormat('select * from pr_emp where id = %f', [AEmpId]));
      open;
      if not (eof and bof) then
      begin
        AHasSupervisedEmps := SelectValueFmtAsFloat('select count(id) from pr_emp where supervisor_id = %f and NVL(PK_HIDE, ''N'') = ''N''', [AEmpId]) <> 0;
        CurrentNode := AddTVChild(nil, AQry);
        if AHasSupervisedEmps then
          BuildNodes(CurrentNode, IqFormat('select * from pr_emp where supervisor_id = %f and NVL(PK_HIDE, ''N'') = ''N''', [AEmpId]));
      end;
    finally
      Free;
    end;
  end;
end;


procedure TFrmSuperTV.BuildNodes( APrentNode: TUniTreeNode; ASql:String);
var
  AQry:TFDQuery;
  AId        : Real;
  ASupervisorId  : Real;
  CurrentNode: TUniTreeNode;

  QryLevel_field   : TField;
  AHasSupervisedEmps:boolean;
begin
  AQry := TFDQuery.Create(self);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(ASql);
    open;
    while not eof do
    begin
      AId         := FieldByName('id').asFloat;
      ASupervisorId   := FieldByName('Supervisor_id').asFloat;
      AHasSupervisedEmps := SelectValueFmtAsFloat('select count(id) from pr_emp where supervisor_id = %f and NVL(PK_HIDE, ''N'') = ''N''', [AId]) <> 0;

      CurrentNode := AddTVChild(APrentNode, AQry);
      if AHasSupervisedEmps then
        BuildNodes(CurrentNode, IqFormat('select * from pr_emp where supervisor_id = %f and NVL(PK_HIDE, ''N'') = ''N''', [FieldByName('id').asFloat]));
      next;
    end;
  finally
    free;
  end;

end;

function TFrmSuperTV.AddTVChild(AParent:TUniTreeNode; AQry:TFDQuery): TUniTreeNode;
var
  AId, ASupervisorId:Real;
  AHasSupervisedEmps:boolean;
begin
  AId           := AQry.FieldByName('id').asFloat;
  ASupervisorId := AQry.FieldByName('Supervisor_id').asFloat;
  AHasSupervisedEmps := SelectValueFmtAsFloat('select count(id) from pr_emp where supervisor_id = %f and NVL(PK_HIDE, ''N'') = ''N''', [AId]) <> 0;

  { TODO -oSanketG -cWebConvert : Need to find alternative for GetNext in TUniTreeNode ,
   [dcc32 Error] SuperTV.pas(301): E2003 Undeclared identifier: 'AddChildObject'}
  {Result := TreeView1.Items.AddChildObject( AParent,
                                            AQry.FieldByName('First_name').asString + ' ' + Trim(AQry.FieldByName('Middle_name').asString + ' ' + AQry.FieldByName('Last_name').asString) + ' (' + AQry.FieldByName('empno').asString + ')',
                                            TTVCargo.Create( AId,
                                                             ASupervisorId,
                                                             AHasSupervisedEmps,
                                                             AQry.FieldByName('First_name').asString,
                                                             AQry.FieldByName('Last_name').asString,
                                                             AQry.FieldByName('empno').asString, AQry.FieldByName('Middle_name').asString )); }
end;



procedure TFrmSuperTV.btnCancelClick(Sender: TObject);
begin
  FId := 0;
  Close;
end;

procedure TFrmSuperTV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmSuperTV.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit , dependent on IQSecIns}
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmSuperTV.SbHROverrideClick(Sender: TObject);
var
  AId:Real;
begin
  ClearTreeView;
  ExecuteCommand('begin ta_misc.hr_override ::= 1; end;');
  LoadSubTreeViewFromQuery( 0 );
end;

procedure TFrmSuperTV.sbtnExpandClick(Sender: TObject);
begin
  with TreeView1 do
  begin
    FullExpand;
    Selected:= Items.GetFirstNode;
    { TODO -oSanketG -cWebConvert : Need to find alternative for TopItem in TUniTreeView,
    [dcc32 Error] SuperTV.pas(345): E2003 Undeclared identifier: 'TopItem'}
    //TopItem := Selected;
  end;
end;

procedure TFrmSuperTV.sbtnCollapseClick(Sender: TObject);
begin
  TreeView1.FullCollapse;
end;

procedure TFrmSuperTV.btnOKClick(Sender: TObject);
var
  AUsername:String;
begin
  if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data <> nil) then
  begin
    FId := TTVCargo(TreeView1.Selected.Data).Pr_Emp_Id;
    AUsername := SelectValueFmtAsString('select user_name from s_user_general where pr_emp_id = %f', [FId]);
    if AUserName <> '' then
      ExecuteCommandFmt('begin ta_misc.user_name ::= ''%s''; end;', [AUsername]);
  end
  else if (TreeView1.Selected <> nil) and (TreeView1.Selected.Data = nil) then {Unsupervised}
  begin
    FId := -1;
    AuserName := SelectValueAsString('select misc.getusername from dual');
    if AUserName <> '' then
      ExecuteCommandFmt('begin ta_misc.user_name ::= ''%s''; end;', [AUsername]);
  end;

  Close;
end;

end.



