program IQGL;

uses
  Forms,
  gl in 'gl.pas' {FrmGLMain},
  gl_visu in 'gl_visu.pas' {FrmGLVisual},
  DM_GL in 'DM_GL.pas' {GL_DM: TDataModule},
  budgrp in 'budgrp.pas' {FrmBudGrp},
  GLPeriod in 'GLPeriod.pas' {FrmDefPeriods},
  AcctMask in 'AcctMask.pas' {FrmAcctMask},
  budgcomp in 'budgcomp.pas' {FrmBudgComp},
  subacct in 'subacct.pas' {FrmSubAccts},
  GLCalend in 'GLCalend.pas' {GLCalender},
  Activity in 'Activity.pas' {FrmActivity},
  replicat in 'replicat.pas' {FrmReplicate},
  sys in '\IQWIN\IQSYS\sys.pas' {FrmSys},
  BudgSel in 'BudgSel.pas' {BudgetSelectCriteria},
  DB_DM in '\IQWIN\IQSHARE\Db_dm.pas' {DB_DataModule: TDataModule},
  Unit1 in 'Unit1.pas' {Form1},
  Terms in '\IQWIN\CUSTOMER\Terms.pas' {FrmTerms},
  ActDrill in 'Actdrill.pas' {FrmActDrillDown},
  GLCreAcc in 'Glcreacc.pas',
  DM_AR in '\IQWin\ar\DM_AR.pas' {AR_DM: TDataModule},
  Journal in '\IQWin\gj\Journal.pas' {FrmJournal},
  GJ_DM in '\IQWin\gj\Gj_dm.pas' {GJDM: TDataModule},
  JTemlate in '\IQWin\gj\JTemlate.pas' {FrmTemplate},
  GJDelRec in '\IQWin\gj\Gjdelrec.pas' {FrmDelRecurringLine},
  JPrePost in '\IQWin\gj\JPrePost.pas' {FrmPrePost},
  TaxMain in '\IQWin\taxcodes\Taxmain.pas' {FormTaxMain},
  Tax_DM in '\IQWin\taxcodes\Tax_dm.pas' {DM_Tax: TDataModule},
  IView in '\IQWin\ar\IView.pas',
  V_Basic in '\IQWin\ar\V_Basic.pas' {FrmViewBasic},
  DM_CR in '\IQWin\cr\DM_CR.pas' {CR_DM: TDataModule},
  cView in '\IQWin\cr\cView.pas' {FrmViewCR};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDB_DataModule, DB_DataModule);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
