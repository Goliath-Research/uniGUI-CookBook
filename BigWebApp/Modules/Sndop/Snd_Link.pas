unit Snd_Link;

interface

uses
  System.SysUtils, Vcl.Forms, Vcl.Controls, System.Classes, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, uniGUIApplication,

  FireDAC.Phys;

type
  TModalState = (msModel, msModeless);

procedure ShowSndOper(cClass: string; nID: Real);
procedure ShowSndOperModaless(nID: Real; cClass: string);

implementation

uses
  IQMS.Data.Lib,
  IQMS.Common.StringUtils,
  {TODO -ombaral -cWebIQ : Check dependecies
    Snd_AS,
  }
  Snd_Base,
  Snd_BL,
  Snd_IN,
  Snd_Op,
  Snd_OV,
  Snd_PK,
  Snd_PR,
  sndop_rscstr;

type
  TSndOperClass = class of TSndBase;

procedure ShowSndOper(cClass: string; nID: Real);
var
  o: TSndBase;
  Ref: TSndOperClass;
begin
  repeat
    if cClass = 'OP' then
      Ref := TSndOperClass(TSndOP)
    else if cClass = 'OV' then
      Ref := TSndOperClass(TSndOV)

    else if cClass = 'IN' then
      Ref := TSndOperClass(TSndIN)
    else if cClass = 'PK' then
      Ref := TSndOperClass(TSndPK)
    else if cClass = 'BL' then
      Ref := TSndOperClass(TSndBL)
    else if cClass = 'PR' then
      EXIT { get out for now }
    else
      raise Exception.Create
        (sndop_rscstr.
        cTXT0000002 { 'Unknown Operation Class.  Cannot open window.' } );

    try
      o := Ref.Create(uniGUIApplication.UniApplication);
      o.ModalState := msModel;

      if nID > 0 then
        o.LocateSndOp(nID);

      if o.ShowModal = mrOK then
      begin
        cClass := TSndBase(o).NextSndOp;
        nID := TSndBase(o).GetNextID;
      end
      else
        cClass := '';
    finally
      if (o <> NIL) and o.HandleAllocated then
        o.Release;
    end;
  until Trim(cClass) = '' end;

  procedure ShowSndOperModaless(nID: Real; cClass: string);
  // procedure ShowSndOperModaless( cClass:string; nID:Real);
  var
    o: TSndBase;
    Ref: TSndOperClass;
    S,s1: string;
  begin
    S := cClass;
    if nID > 0 then
    begin
      s1:=Format('select op_class from sndop where id = %f', [nID]);
      S := SelectValue(s1);

      if S = '' then
        S := cClass;
    end;
    if S = '' then
      S := 'OP';

    if S = 'OP' then
      Ref := TSndOperClass(TSndOP)
    else if S = 'OV' then
      Ref := TSndOperClass(TSndOV)
    else if S = 'IN' then
      Ref := TSndOperClass(TSndIN)
    else if S = 'PK' then
      Ref := TSndOperClass(TSndPK)
    else if S = 'BL' then
      Ref := TSndOperClass(TSndBL)
    else if S = 'FB' then
      o := TSnd_Process.Create(uniGUIApplication.UniApplication)
      { TODO -ombaral -cWebIQ : Check dependecies Snd_As
        else if S = 'AS' then
        o:= TSnd_Assembly.Create( AOwner, nID )
      }
    else
      raise Exception.Create
        (sndop_rscstr.
        cTXT0000002 { 'Unknown Operation Class.  Cannot open window.' } );

    { every class but FB }
    if not StrInList(S, ['FB', 'AS']) then
    begin
      o := Ref.Create(uniGUIApplication.UniApplication);

      o.ModalState := msModeless;

      if nID > 0 then
        o.LocateSndOp(nID)
      else
        try
          o.sbtnSearch.Click;
        except
          on E: EAbort do
          begin
            o.Close;
            EXIT;
          end;
        end;
    end;

    o.Show;
  end;

end.
