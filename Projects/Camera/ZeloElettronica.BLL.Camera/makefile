OBJECTS=utility.o communication.o versioning.o pointAnalyzer.o pccamera.o FrameBuffer.o analysis.o Marks.o MarksManager.o AnalysisManager.o main.o 

CFLAGS=-O2 -mmmx -g -Wall 
LIBS=-lm -lpthread
CC=g++

PROGRAM_NAME=Test01

$(PROGRAM_NAME):$(OBJECTS)
	$(CC) $(CFLAGS) -o $(PROGRAM_NAME) $(OBJECTS) $(LIBS)
	@echo " "
	@echo "Compilazione completata!"
	@echo " "

soft1:
	$(CC) $(CFLAGS) -o $(PROGRAM_NAME) pccamera.o main.o $(LIBS)
	@echo " "
	@echo "Compilazione Soft1 completata!"
	@echo " "


clean:
	rm -f $(PROGRAM_NAME)
	rm -f *.o
	rm -f core