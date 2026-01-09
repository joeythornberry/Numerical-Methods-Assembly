       IDENTIFICATION DIVISION.
       PROGRAM-ID.   DECTOBIN.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
              SELECT DECIMAL-FILE ASSIGN TO "in.dec"
                     FILE STATUS IS WS-DECIMAL-CHECK-KEY
                     ORGANIZATION IS LINE SEQUENTIAL.
              SELECT BINARY-FILE  ASSIGN TO "in.bin"
                     FILE STATUS IS WS-BINARY-CHECK-KEY
                     ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       
       FD DECIMAL-FILE.
       01 DECIMAL-RECORD.
              05 XDEC       PIC 9(3)V9(3).
              05 FILLER     PIC X.
              05 YDEC       PIC 9(3)V9(3).

       FD BINARY-FILE.
       01 BINARY-RECORD.
              05 XBIN             COMP-1.
              05 YBIN             COMP-1.

       WORKING-STORAGE SECTION.
       01 WS-DECIMAL-CHECK-KEY     PIC X(2).
       01 WS-BINARY-CHECK-KEY      PIC X(2).

       01 WS-EOF-FLAG       PIC X.

       PROCEDURE DIVISION.

       OPEN INPUT DECIMAL-FILE.
       OPEN OUTPUT BINARY-FILE.
       IF WS-DECIMAL-CHECK-KEY NOT="00"
              DISPLAY "BINARY FILE STATUS " WS-DECIMAL-CHECK-KEY       
       END-IF
       IF WS-BINARY-CHECK-KEY NOT="00"
              DISPLAY "BINARY FILE STATUS " WS-DECIMAL-CHECK-KEY       
       END-IF

       PERFORM 0001-READ-WRITE-LOOP UNTIL WS-EOF-FLAG = 'Y'

       CLOSE BINARY-FILE.
       CLOSE DECIMAL-FILE.

       0001-READ-WRITE-LOOP.
              READ DECIMAL-FILE INTO DECIMAL-RECORD
               AT END
                SET WS-EOF-FLAG TO 'Y'
               NOT AT END
                DISPLAY "X " XDEC " Y " YDEC
                MOVE XDEC TO XBIN
                MOVE YDEC TO YBIN
                DISPLAY "X " XBIN " Y " YBIN
                WRITE BINARY-RECORD
              END-READ.
