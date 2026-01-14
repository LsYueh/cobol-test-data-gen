       IDENTIFICATION DIVISION.
       PROGRAM-ID. READ-TEST.

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
           01 WS-END-FLAG    PIC X VALUE "N".

           01 WS-ID-DISPLAY  PIC ZZZZZ.
           01 WS-AMT-DISPLAY PIC -ZZZ,ZZ9.99.

       PROCEDURE DIVISION.
           OPEN INPUT TEST-FILE

           PERFORM UNTIL WS-END-FLAG = "Y"
               READ TEST-FILE
                   AT END
                       MOVE "Y" TO WS-END-FLAG
                   NOT AT END
                       MOVE TEST-AMT TO WS-AMT-DISPLAY
                       MOVE TEST-ID  TO WS-ID-DISPLAY
                       
                       DISPLAY "ID:   " WS-ID-DISPLAY
                       DISPLAY "AMT:  " WS-AMT-DISPLAY
                       DISPLAY "NAME: " TEST-NAME
               END-READ
           END-PERFORM

           CLOSE TEST-FILE
           STOP RUN.
           