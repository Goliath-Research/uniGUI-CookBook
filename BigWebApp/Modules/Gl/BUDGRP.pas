unit budgrp;

interface

uses
  Vcl.Forms,
  Vcl.DBGrids,
  Mask,
  Data.DB,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniBasicGrid,
  uniDBGrid,
  uniMultiItem,
  uniComboBox;

type
  TFrmBudGrp = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    DBNavigator2: TUniDBNavigator;
    DBGrid5: TUniDBGrid;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    DBGrid2: TUniDBGrid;
    ComboBox1: TUniComboBox;
    Splitter1: TUniSplitter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FrmBudGrp: TFrmBudGrp;

implementation

{$R *.DFM}

end.
