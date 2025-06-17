//*&FROM PANEL52                                                        00001002
//*&FROM PANEL52                                                        00002002
//*&FROM PANEL52                                                        00003002
//*&FROM PANEL52                                                        00004002
//*ABBSGZZD JOB TEST,'TEST',REGION=0M,CLASS=A,                          00010000
//*  MSGCLASS=T,PRTY=01,NOTIFY=&SYSUID                                  00020000
//*                                                                     00030000
//*******************************************************************// 00031002
//* ANYTHING THAT STARTS WITH '&' IS A DYNAMIC VALUE WHICH GETS     *// 00032002
//* SUBSTITUDED DURING RUNTIME                                      *// 00033002
//*******************************************************************// 00034002
//* THE INCLUDE INPUT COMES FROM PANEL52                                00035004
//INCLIB JCLLIB ORDER=&_INCLDSN                                         00036003
//*INCLUDE MEMBER=SCMM@SYM                    (SYMBOLICS INCLUDE)       00037003
//*                                                                     00040000
//********************************************************************* 00050000
//*  BATCH JCL STATEMENTS                                             * 00060000
//********************************************************************* 00070000
//NDVRBAT  EXEC PGM=NDVRC1,DYNAMNBR=1500,REGION=4096K,                  00080000
//  PARM='C1BM3000'                                                     00090000
// INCLUDE MEMBER=SCMM@LIB                    (STEPLIB/CONLIB INCLUDES) 00091001
//*EN$TRSYM DD SYSOUT=*                                                 00140000
//*EN$TRITE DD DUMMY                                                    00150000
//SYSPRINT DD SYSOUT=*                                                  00160000
//********************************************************************* 00170000
//*             SORT WORK FILES                                       * 00180000
//********************************************************************* 00190000
//SORTWK01 DD UNIT=SYSDA,SPACE=(CYL,(1,2))                              00200000
//SORTWK02 DD UNIT=SYSDA,SPACE=(CYL,(1,2))                              00210000
//SORTWK03 DD UNIT=SYSDA,SPACE=(CYL,(1,2))                              00220000
//C1TPDD01 DD UNIT=SYSDA,SPACE=(CYL,5),                                 00230000
//            DCB=(RECFM=VB,LRECL=260)                                  00240000
//C1TPDD02 DD UNIT=SYSDA,SPACE=(CYL,5),                                 00250000
//            DCB=(RECFM=VB,LRECL=260)                                  00260000
//********************************************************************* 00270000
//*  OUTPUT DATA SETS                                                 * 00280000
//********************************************************************* 00290000
//C1MSGS1  DD SYSOUT=*                                                  00300000
//C1MSGS2  DD SYSOUT=*                                                  00310000
//C1PRINT  DD SYSOUT=*,DCB=(RECFM=FBA,LRECL=133)                        00320000
//SYSUDUMP DD SYSOUT=*                                                  00330000
//SYMDUMP  DD DUMMY                                                     00340000
//SYSOUT   DD SYSOUT=*                                                  00350000
//********************************************************************* 00360000
//*  REQUEST DATA SET                                                 * 00370000
//********************************************************************* 00380000
//BSTIPT01 DD DISP=SHR,                                                 00390000
// DSN=&_SCLDSN(THIS COMES FROM PANEL52)                                00400004
//*                                                                     00410004
