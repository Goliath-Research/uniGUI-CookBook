ALTER TABLE IQPickDataSet drop constraint FK_PickDataSet_DataSet;
ALTER TABLE IQPickDataSet drop constraint FK_PickDataSet_Field;
--
DROP TABLE IQPickDataSet;
DROP SEQUENCE S_IQPickDataSet;

ALTER TABLE IQField      drop constraint FK_Field_DataSet;
ALTER TABLE IQDataSet    drop constraint FK_DataSet_DataModule;
ALTER TABLE IQDataSet    drop constraint FK_DataSet_Field_Key;
ALTER TABLE IQDataSet    drop constraint FK_DataSet_Field_Detail;
ALTER TABLE IQDataModule drop constraint FK_DataModule_DataSet;
ALTER TABLE IQForm       drop constraint FK_Form_FormDesign;
 
--
DROP TABLE IQField;
DROP SEQUENCE S_IQField;
--
DROP TABLE IQDataSet;
DROP SEQUENCE S_IQDataSet;

ALTER TABLE IQFormDesign DROP CONSTRAINT FK_FormDesign_Form;
--
DROP TABLE IQFormDesign;
DROP SEQUENCE S_IQFormDesign;
--
DROP TABLE IQForm;
DROP SEQUENCE S_IQForm;

DROP TABLE IQPickListItem;
DROP SEQUENCE S_IQPickListItem;
DROP TABLE IQPickList;
DROP SEQUENCE S_IQPickList;

DROP TABLE IQPickTree;
DROP SEQUENCE S_IQPickTree;
DROP TABLE IQPickTreeNode;
DROP SEQUENCE S_IQPickTreeNode;

DROP TABLE IQDATAMODULE;
DROP SEQUENCE S_IQDATAMODULE;

DROP TABLE IQMODULE;
DROP SEQUENCE S_IQMODULE;
