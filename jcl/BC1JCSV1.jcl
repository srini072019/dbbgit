//ABBSGZZB JOB TEST,'TEST',REGION=0M,CLASS=A,                           00011003
//  MSGCLASS=T,PRTY=07,NOTIFY=&SYSUID                                   00012000
//INCLIB JCLLIB ORDER=NDVR.ADMIN.ENDADMIN.S2.SKELS                      00013001
//*INCLUDE MEMBER=SCMM@SYM                    (SYMBOLICS INCLUDE)       00020001
//*-------------------------------------------------------------------  00030000
//*                                                                     00040000
//* COPYRIGHT (C) 1986-2013 CA. ALL RIGHTS RESERVED.                    00050000
//*                                                                     00060000
//* NAME: BC1JCSVU                                                      00070000
//*                                                                     00080000
//*    PURPOSE  - THIS IS SAMPLE JCL TO INVOKE THE COMMA SEPARATED      00090000
//*               VALUES UTILITY PROGRAM                                00100000
//*                                                                     00110000
//*    THE FOLLOWING UPDATES MUST BE MADE TO THIS JCL BEFORE            00120000
//*    IT CAN BE EXECUTED:                                              00130000
//*                                                                     00140000
//*    1. UPDATE THE JOBCARD TO REFLECT CORRECT SITE INFORMATION        00150000
//*    2. THE STEPLIB AND CONLIB DD STATEMENT LIBRARY CONCATENATIONS    00160000
//*       ARE INCLUDED FROM THE SCMM@LIB MEMBER THAT WAS TAILORED AS    00170000
//*       A STEP IN THE INSTALLATION PROCESS.                           00180000
//*    3. BC1PCSV0 RESIDES IN CSIQLOAD. THIS JOB IS SETUP TO            00190000
//*       EXECUTE THE BC1PCSV0 CSV MODULE FROM THE UNAUTHORIZED         00200000
//*       CONLIB LIBRARY VIA THE CONCALL PARAMETER.                     00210000
//*-------------------------------------------------------------------  00220000
//*   STEP 1 -- EXECUTE CSV UTILITY                                     00230000
//*-------------------------------------------------------------------  00240000
//STEP1    EXEC PGM=NDVRC1,REGION=4M,                                   00250000
//         PARM='CONCALL,DDN:CONLIB,BC1PCSV0' (EXEC FROM NON-AUTH LIB)  00260000
// INCLUDE MEMBER=SCMM@LIB                    (STEPLIB/CONLIB INCLUDES) 00270000
//*   INPUT -- SCL FOR CSV UTILITY                                      00280000
//CSVIPT01 DD *                                                         00290000
    LIST ELE * TO FILE 'APIEXTR'                                        00302003
        FROM ENV 'ADMIN' SYS '*' STA NUM '2'.                           00303003
        DATA BASIC                                                      00304003
//*                                                                     00310000
//*   CSV LIST FILE DD STATEMENT              (DEFAULT IS APIEXTR)      00320000
//APIEXTR  DD DSN=ABBSGZZ.TEST3.CSVFILE,                                00330003
//         DCB=(DSORG=PS,RECFM=VB,LRECL=4092),                          00340000
//         DISP=(NEW,CATLG,DELETE),                                     00350000
//         SPACE=(TRK,(5,1),RLSE),                                      00360000
//         UNIT=SYSDA                                                   00370001
//*   EXECUTION MESSAGES (CSV LOG MESSAGES)                             00380000
//CSVMSGS1 DD SYSOUT=*                                                  00390000
//*   EXECUTION MESSAGES (API LOG MESSAGES)                             00400000
//C1MSGSA  DD SYSOUT=*                                                  00410000
//*   ERROR FILE                                                        00420000
//BSTERR   DD SYSOUT=*                                                  00430000
//SYMDUMP  DD DUMMY                                                     00440000
//SYSUDUMP DD SYSOUT=*                                                  00450000
//                                                                      00460000
