       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITE-TEST.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TEST-FILE ASSIGN TO "data/OUT.DAT"
               ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD   TEST-FILE.
           COPY TEST.CPY.

       WORKING-STORAGE SECTION.
           01 WS-ID    PIC 9(5).
           01 WS-AMT   PIC S9(5)V99 COMP-3.
           01 WS-NAME  PIC X(10).

       PROCEDURE DIVISION.
           OPEN OUTPUT TEST-FILE

           MOVE 12345        TO TEST-ID
           MOVE 100.50       TO TEST-AMT
           MOVE "JOHN SMITH" TO TEST-NAME
           WRITE TEST-REC

           MOVE 67890        TO TEST-ID
           MOVE -50.25       TO TEST-AMT
           MOVE "JANE DOE"   TO TEST-NAME
           WRITE TEST-REC

           CLOSE TEST-FILE
           STOP RUN.
           