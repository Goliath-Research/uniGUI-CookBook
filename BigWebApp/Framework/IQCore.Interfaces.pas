unit IQCore.Interfaces;

interface

uses
  Classes,
  Vcl.Menus,
  Vcl.ActnList,
  UniGUIAbstractClasses,
  UniTreeView,
  DB,
  Spring,
  Spring.Collections;

type

  IIQObj                = interface;

  IIQForm               = interface;
  IIQFormDesign         = interface;

  IIQDataModule         = interface;
  IIQControllerLinkTrio = interface;

  IIQDataSet            = interface;

  IIQFilter             = interface;
  IIQFilterNode         = interface;
  IIQOrderBy            = interface;

  IIQField              = interface;
  IIQEditor             = interface;

  IIQPickTree           = interface;
  IIQPickTreeNode       = interface;

  IIQPickList           = interface;
  IIQPickListItem       = interface;

  IIQPickDataSet        = interface;

  IIQWidget             = interface;

  TAssignFieldValuesProc = reference to procedure;

  IIQObj = interface
    ['{DB4250D2-A7AB-438C-A0B7-BF2F74A0B52D}']

    function  GetID   : integer;
    procedure SetID   (val : integer);

    procedure Load  (aDataSet : TDataSet = nil);
    procedure Save  (aDataSet : TDataSet; aProc : TAssignFieldValuesProc = nil);
    procedure Delete(aDataSet : TDataSet = nil);

    property ID   : integer read GetID   write SetID;
  end;

  IIQNamedObj = interface(IIQObj)
    ['{F3A06CD5-0DC5-4A6F-8EBE-DD1ED59176A8}']

    function  GetName : string;
    procedure SetName (val : string);

    property Name : string  read GetName write SetName;
  end;

  //
  // Several framework core objects can be represented as flat tables with some
  // dependencies / relationships between them.
  // One Module has one or more Forms and DataModules.
  // One DataModule contains one or more DataSets.
  // All the DataSets in the application could be loaded at once and filter them
  // according to our needs.
  // In this case, we could have interfaces like IIQForm, implemented by a class
  // like TIQForm with persistence to an Oracle table IQForm.
  // We could just register TIQForm implementing IIQForm with Spring4D and use
  // a singleton factory for returning IIQObjs<IIQForm> (giving access to all
  // forms by ID or Name, and providing access to the constructor and all the
  // methods implemented in it)
  //

  IIQObjs<I : IIQNamedObj> = interface

    function  GetObjs     : IList<I>;
    function  GetNewObj   : I;
    function  GetObjByID  (aID   : integer) : I;
    function  GetObjByName(aName : string ) : I;

    property  NewObj          : I             read GetNewObj;
    property  ObjByID  [aID   : integer] : I  read GetObjByID; default;
    property  ObjByName[aName : string ] : I  read GetObjByName;
  end;

  IIQModule = interface(IIQNamedObj)
    ['{3BDA618F-3874-43F6-942E-9AF6280F8601}']

    function  GetForms        : IList<IIQForm>;

    property  Forms           : IList<IIQForm>        read GetForms;
  end;

  IIQModules = IIQObjs<IIQModule>;

  IIQForm = interface(IIQNamedObj)
    ['{3BDA618F-3874-43F6-942E-9AF6280F8601}']

    function  GetModule         : IIQModule;
    procedure SetModule         (val : IIQModule);
    function  GetSingleton      : boolean;
    procedure SetSingleton      (val : boolean);
    function  GetDataModule     : IIQDataModule;
    procedure SetDataModule     (val : IIQDataModule);
    function  GetDesigns        : IList<IIQFormDesign>;
    function  GetDefaultDesign  : IIQFormDesign;
    procedure SetDefaultDesign  (val : IIQFormDesign);
    function  GetParent         : IIQForm;
    procedure SetParent         (val : IIQForm);

    property Module         : IIQModule             read GetModule        write SetModule;
    property Singleton      : boolean               read GetSingleton     write SetSingleton;
    property DataModule     : IIQDataModule         read GetDataModule    write SetDataModule;
    property Designs        : IList<IIQFormDesign>  read GetDesigns;
    property DefaultDesign  : IIQFormDesign         read GetDefaultDesign write SetDefaultDesign;
    property Parent         : IIQForm               read GetParent        write SetParent;
  end;

  IIQForms = IIQObjs<IIQForm>;

  IIQFormDesign = interface(IIQNamedObj)
    ['{B204FCE8-763F-4D4B-AC3C-27B883BFFC26}']

    function  GetForm : IIQForm;
    procedure SetForm (val : IIQForm);
    function  GetDFM  : string;
    procedure SetDFM  (val : string);

    property Form : IIQForm read GetForm write SetForm;
    property DFM  : string  read GetDFM  write SetDFM;
  end;

  IIQFormDesigns = IIQObjs<IIQFormDesign>;

  IIQDataModuleFrameEventHandler = interface
    ['{AB40E56E-80BA-4427-B336-5B54C6593D46}']

    procedure DoOnFrameCreate (Sender: TObject);
    procedure DoOnFrameDestroy(Sender: TObject);
  end;

  IIQDataModule = interface(IIQNamedObj)
    ['{F5CDE3B4-D809-4317-8BD9-75C6854BD971}']

    function  GetMainMenu     : string;
    procedure SetMainMenu     (val : string);
    function  GetDataSets     : IList<IIQDataSet>;
    function  GetMainDataSet  : IIQDataSet;
    procedure SetMainDataSet  (val : IIQDataSet);

    function  GetControllerLinkTrios : IList<IIQControllerLinkTrio>;

    function  GetNewDataSet   : IIQDataSet;
    function  GetDataSetByID  (aID   : integer) : IIQDataSet;
    function  GetDataSetByName(aName : string ) : IIQDataSet;

    property  MainMenu                : string            read GetMainMenu    write SetMainMenu;
    property  DataSets                : IList<IIQDataSet> read GetDataSets;
    property  MainDataSet             : IIQDataSet        read GetMainDataSet write SetMainDataSet;
    property  ControllerLinkTrios     : IList<IIQControllerLinkTrio> read GetControllerLinkTrios;
    
    property  NewDataSet              : IIQDataSet        read GetNewDataSet;
    property  DataSet[aID : integer]  : IIQDataSet        read GetDataSetByID;
  end;

  IIQDataModules = IIQObjs<IIQDataModule>;

  IIQControllerLinkTrio = interface(IIQObj)
    ['{2E1C2290-FE33-4F08-9F2F-7FCA2A5A3CE7}']

    function  GetDataModule : IIQDataModule;
    procedure SetDataModule (val : IIQDataModule);
    function  GetDataSet    : IIQDataSet;
    procedure SetDataSet    (val : IIQDataSet);
    function  GetActionList : string;
    procedure SetActionList (val : string);
    function  GetWidgets    : IList<IIQWidget>;

    property  DataModule : IIQDataModule     read GetDataModule  write SetDataModule;
    property  DataSet    : IIQDataSet        read GetDataSet     write SetDataSet;
    property  ActionList : string            read GetActionList  write SetActionList;
    property  Widgets    : IList<IIQWidget>  read GetWidgets;
  end;

  IIQDataSet = interface(IIQNamedObj)
    ['{EC08F1FC-8D58-4FB9-A9F4-84A3A6A5883F}']

    function  GetDataModule  : IIQDataModule;
    procedure SetDataModule  (val : IIQDataModule);
    function  GetFields      : IList<IIQField>;
    function  GetSQL         : string;
    procedure SetSQL         (val : string);
    function  GetTableName   : string;
    procedure SetTableName   (val : string);
    function  GetMaster      : IIQDataSet;
    procedure SetMaster      (val : IIQDataSet);
    function  GetKeyField    : IIQField;
    procedure SetKeyField    (val : IIQField);
    function  GetDetailField : IIQField;
    procedure SetDetailField (val : IIQField);

    property DataModule   : IIQDataModule   read GetDataModule  write SetDataModule;
    property Fields       : IList<IIQField> read GetFields;
    property SQL          : string          read GetSQL         write SetSQL;
    property TableName    : string          read GetTableName   write SetTableName;
    property Master       : IIQDataSet      read GetMaster      write SetMaster;
    property KeyField     : IIQField        read GetKeyField    write SetKeyField;
    property DetailField  : IIQField        read GetDetailField write SetDetailField;
  end;

  IIQDataSets = IIQObjs<IIQDataSet>;

  IIQWidget = interface(IIQNamedObj)
    ['{08395649-4DAF-4EBC-8D78-48144996D586}']

    function  GetDetailField : IIQField;
    function  GetMaster      : IIQDataSet;
    procedure SetDetailField (val : IIQField);
    procedure SetMaster      (val : IIQDataSet);

    property  Master      : IIQDataSet read GetMaster      write SetMaster;
    property  DetailField : IIQField   read GetDetailField write SetDetailField;
  end;

  IIQWidgets = IIQObjs<IIQWidget>;

  IIQFilter = interface(IIQNamedObj)
    ['{16A40F33-CC3F-42D6-BA86-D15320A8E3BF}']

    function  GetDataSet  : IIQDataSet;
    procedure SetDataSet  (val : IIQDataSet);
    function  GetRootNode : IIQFilterNode;
    procedure SetRootNode (val : IIQFilterNode);

    property DataSet  : IIQDataSet    read GetDataSet  write SetDataSet;
    property RootNode : IIQFilterNode read GetRootNode write SetRootNode;
  end;

  TIQFilterNodeType =
  (
    fntOperator,
    fntLiteral,
    fntVariable
  );

  IIQFilterNode = interface(IIQObj)
    ['{3A8B2EED-1F74-47B7-83E1-03BA287A2513}']

    function  GetID       : integer;
    function  GetNodeType : TIQFilterNodeType;
    function  GetValue    : string;
    function  GetChild1   : IIQFilterNode;
    function  GetChild2   : IIQFilterNode;
    procedure SetID       (val : integer);
    procedure SetNodeType (val : TIQFilterNodeType);
    procedure SetValue    (val : string);
    procedure SetChild1   (val : IIQFilterNode);
    procedure SetChild2   (val : IIQFilterNode);

    property ID       : integer           read GetID       write SetID;
    property NodeType : TIQFilterNodeType read GetNodeType write SetNodeType;
    property Value    : string            read GetValue    write SetValue;
    property Child1   : IIQFilterNode     read GetChild1   write SetChild1;
    property Child2   : IIQFilterNode     read GetChild2   write SetChild2;
  end;

  //
  // IIQOrderBy.Fields.Values[FieldName] = 'AN'; // Order By FieldName Ascending Non-CaseSensitive
  // Iterate over the list to get the sort order
  //

  IIQOrderBy = interface(IIQNamedObj)
    ['{D20CF161-094A-4182-8C1E-E404AF66EEF5}']

    function  GetDataSet : IIQDataSet;
    procedure SetDataSet (val : IIQDataSet);
    function  GetFields  : TStrings;
    procedure SetFields  (val : TStrings);

    property DataSet : IIQDataSet read GetDataSet write SetDataSet;
    property Fields  : TStrings   read GetFields  write SetFields;
  end;

  TIQDataType =
    (
      dtBoolean,
      dtNumber,
      dtString,
      dtMemo,
      dtImage,
      dtBlob
    );

  TIQFieldType =
    (
      ftData,
      ftLookupFromDataSet,
      ftLookupFromQuery,
      ftLookupFromList,
      ftLookupFromTree,
      ftCalcSql,
      ftCalcScript
    );

  IIQField = interface(IIQNamedObj)
    ['{190A2F75-B9A2-4A72-8671-DA66D63FC184}']

    function  GetDisplayLabel : string;
    function  GetDisplayWidth : integer;
    function  GetSize         : integer;
    function  GetPrecision    : integer;
    function  GetFixedChar    : boolean;
    function  GetDataType     : TIQDataType;
    function  GetFieldType    : TIQFieldType;
    function  GetFieldTypeID  : integer;
    function  GetEditor       : IIQEditor;
    function  GetOwner        : IIQDataSet;
    procedure SetDisplayLabel (val : string);
    procedure SetDisplayWidth (val : integer);
    procedure SetSize         (val : integer);
    procedure SetPrecision    (val : integer);
    procedure SetFixedChar    (val : boolean);
    procedure SetDataType     (val : TIQDataType);
    procedure SetFieldType    (val : TIQFieldType);
    procedure SetFieldTypeID  (val : integer);
    procedure SetEditor       (val : IIQEditor);
    procedure SetOwner        (val : IIQDataSet);

    property DisplayLabel : string       read GetDisplayLabel write SetDisplayLabel;
    property DisplayWidth : integer      read GetDisplayWidth write SetDisplayWidth;
    property Size         : integer      read GetSize         write SetSize;
    property Precision    : integer      read GetPrecision    write SetPrecision;
    property FixedChar    : boolean      read GetFixedChar    write SetFixedChar;
    property DataType     : TIQDataType  read GetDataType     write SetDataType;
    property FieldType    : TIQFieldType read GetFieldType    write SetFieldType;
    property FieldTypeID  : integer      read GetFieldTypeID  write SetFieldTypeID;
    property Editor       : IIQEditor    read GetEditor       write SetEditor;
    property Owner        : IIQDataSet   read GetOwner        write SetOwner;
  end;

  IIQFields = IIQObjs<IIQField>;

  IIQEditor = interface(IIQNamedObj)
    ['{0FC7D8E2-84E6-4141-B5B7-5E123CD329F1}']

  end;

  IIQPickTree = interface(IIQEditor)
    ['{46C63675-EB00-44FF-96BC-ACBE769DC1E2}']

    function  GetLevels     : integer;
    procedure SetLevels     (val : integer);
    function  GetRootNode   : IIQPickTreeNode;

    procedure LoadTreeNodes (aOwner : TUniTreeView);
    function  AddTreeNode   (aParentID   : integer; aText : string) : integer;
    procedure DelTreeNode   (aTreeNodeID : integer);
    procedure UpdTreeNode   (aTreeNodeID : integer; aText : string);

    property  Levels   : integer          read GetLevels    write SetLevels;
    property  RootNode : IIQPickTreeNode  read GetRootNode;
  end;

  IIQPickTrees = IIQObjs<IIQPickTree>;

  IIQPickTreeNode = interface(IIQObj)
    ['{DC543C02-6377-4E4B-8D3F-9045AAF5329F}']

    function  GetText     : string;
    procedure SetText     (val : string);
    function  GetSeq      : integer;
    procedure SetSeq      (val : integer);
    function  GetParentID : integer;
    procedure SetParentID (val : integer);
    function  GetParent   : IIQPickTreeNode;
    procedure SetParent   (val : IIQPickTreeNode);

    property Text     : string          read GetText     write SetText;
    property Seq      : integer         read GetSeq      write SetSeq;
    property ParentID : integer         read GetParentID write SetParentID;
    property Parent   : IIQPickTreeNode read GetParent   write SetParent;
  end;

  IIQPickList = interface(IIQEditor)
    ['{138E3AE5-2609-4C0C-A2C3-1CE8AA91BA11}']

    function  GetAsStrings  : TStrings;
    function  AddListItem   (aParentID   : integer; aText : string) : integer;
    procedure DelListItem   (aTreeNodeID : integer);
    procedure UpdListItem   (aListItemID : integer; aText : string; aSeq : integer);
    procedure SetListItemPos(aListItemID : integer; aPos, aDelta : integer);

    function  GetListItems  : IList<IIQPickListItem>;

    property  ListItems : IList<IIQPickListItem>  read GetListItems;
    property  AsStrings : TStrings                read GetAsStrings;
  end;

  IIQPickLists = IIQObjs<IIQPickList>;

  IIQPickListItem = interface(IIQObj)
    ['{DC543C02-6377-4E4B-8D3F-9045AAF5329F}']

    function  GetID       : integer;
    procedure SetID       (val   : integer);
    function  GetText     : string;
    procedure SetText     (val : string);
    function  GetSeq      : integer;
    procedure SetSeq      (val : integer);
    function  GetParentID : integer;
    procedure SetParentID (val : integer);
    function  GetParent   : IIQPickList;
    procedure SetParent   (val : IIQPickList);

    property ID       : integer     read GetID       write SetID;
    property Text     : string      read GetText     write SetText;
    property Seq      : integer     read GetSeq      write SetSeq;
    property ParentID : integer     read GetParentID write SetParentID;
    property Parent   : IIQPickList read GetParent   write SetParent;
  end;

  IIQPickDataSet = interface(IIQEditor)
    ['{62284D94-DD07-4145-9863-8358CB36C325}']

    function  GetDataSet   : IIQDataSet;
    procedure SetDataSet   (val : IIQDataSet);
    function  GetListField : IIQField;
    procedure SetListField (val : IIQField);

    property DataSet    : IIQDataSet read GetDataSet   write SetDataSet;
    property ListField  : IIQField   read GetListField write SetListField;
  end;

  IIQPickDataSets = IIQObjs<IIQPickDataSet>;

implementation

end.
