unit iqdbx_const;

interface

uses
  Windows,
  Classes,
  SysUtils,
  Variants;


const
  cIMPORT_ALIAS = 'IQMS Data Load';
  cIMPORT_MDB   = 'iqdbxdb.mdb';
  cIMPORT_LDB   = 'iqdbxdb.ldb';
  cREG_PATH     = '\SOFTWARE\IQMS\Data Load';

  IQDBX_GROUP = 1;
  //IQDBX_PROJECT = 2;

const
  // NOTE: Do not change this value.  It is the
  //       password for the Microsoft Access configuration file.
  DATABASE_PASSWORD = 'GAHOVASOCI7069'; // current as of 06/20/2008
  DATABASE_VERSION: Byte = 3; // last changed 03/17/2010

{
** Prospective Password List **

KAXIJAKIKE9482
KAHOHIWIME2182
HIMEWANAYE1036
BEVAYOGECA1089
LISAFAKETE9431
GEPOWIXOHI1391
DADOTEROKA8420
RINIXIJEFA3748
PEDOGABEDI8310
RILILOCODO4721
XOJAFADEJI1557
MAJIDOLABA3404
XIKIPASIGE7589
BOFAWAKIMI8926
HODOREBEJE4188
YOVAGOHIDA9764
HADIHOCIJI8883
TIREPAJAXI3202
XEBANEYOVE1060

}

  // This is a list of the old passwords
  // If you change the current password (above), add it first to this list.
  // When a database is opened, these passwords are checked.
  OLD_PASSWORDS: array[0..1] of String =
   ('',
    'B06B0D49F448F6AE6730'); // initial test password

implementation

end.
