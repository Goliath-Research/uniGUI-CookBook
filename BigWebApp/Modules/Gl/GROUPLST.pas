unit grouplst;

interface

uses
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniBasicGrid,
  uniDBGrid;

type
  TFrmGroups = class(TUniForm)
    PnlToolbar: TUniPanel;
    Panel2: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    Bevel1: TUniPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGroups: TFrmGroups;

implementation

uses
  budgrp;

{$R *.DFM}

end.
