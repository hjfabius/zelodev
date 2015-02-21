st7/

;*********************************************************** 
; TITOLO:   pwm01  Semplice programma di esempio
;           		Esempio di generazione di un segnale PWM
;					Premendo P1 il Duty cicle Aumenta
;                   Premendo P2 il Duty cicle Diminuisce
;           
; 			In questo esempio non viene gestito il Watchdog                   
; AUTORE:          Nuova Elettronica 
; DATA:            30/01/2003
; DESCRIPTION:     ST72FLITE09B 
;      
;***********************************************************
        TITLE    "SIM200.ASM"	   	        ;010 Titolo del programma
		INTEL                            	;020 Formato linguaggio
		#INCLUDE "ST72FL09.INC"	         	;030 Inserimento Copy standard
                                            
;****************************************
; *****  D E F I N E ********************
;****************************************
; a questo punto noi possiamo inserite le
; DEFINE, EQU e SET  che vengono utilizzate
; dal Compilatore
;  	
 	#DEFINE  D_R00 1  				;mettendo D_R00 =1 e D_R01 = 50 FUNZ1=480                                                                ;per 
    #DEFINE  D_R01 50            	;si simula una velocita'di circa 1000mt/min 
                                    ;D_R00=3 e D_R01=100 circa 100mt/min     
    #DEFINE  D_R02 255             
    #DEFINE  D_R03 255  
    #DEFINE  D_R04 39			   ;ATTENZIONE QUESTI VALORI SONO UGUALI
    #DEFINE  D_R05 254	    	   ;PER TUTTI I MICRO BASTA CHE VENGANO
                                   ;TARATI CON PROCEDURA DELLA RIVISTA  N° 225
;*************************************
;*****  VARIABILI ********************
;*************************************
; in questa area vengono definite le
; variabili utilizzate da programma
;*************************************

   	BYTES                			;8 bit 
   	segment 'ram0'         			;Data Ram 

PUN1TH		DS.B	1				;
PUN1TL		DS.B	1				;
PUN2TH		DS.B	1				;
PUN2TL		DS.B	1				;                  
DELAY0 		DS.B    1           	;Per fare ritardo
DELAY1 	    DS.B    1       		;Per fare ritardo      
DELAY2   	DS.B    1   			;Per fare ritardo
DELAY3	    DS.B    1		  		;Per fare ritardo
DELAY4   	DS.B    1   			;Per fare ritardo
DELAY5	    DS.B    1		  		;Per fare ritardo  
FLAG		DS.B	1
TEST_OK     DS.B	1
MEMADC		DS.B	1               ;confronto per seconda lettura ADC
S1_START 	DS.B    1		       	;inizio S1	
S1_END		DS.B	1				;fine S1            
VELOCITA	DS.B	1				;VELOCITA MACCHINA
IMPULSI	    DS.B    2 		        ;N°impulsi encoder   
STEP0       EQU	   {IMPULSI+0}
STEP1	    EQU	   {IMPULSI+1} 	
CILINDRO	DS.B    2		        ;sviluppo cilindro in decimi   
CILIN0	    EQU	   {CILINDRO+0}                                                                           
CILIN1	    EQU	   {CILINDRO+1}				                                                                           
DIGIT		DS.B	6			    ;DIGITS usati nella trasmissione                                                               
DIG1		EQU	   {DIGIT+0}
DIG2		EQU	   {DIGIT+1}
DIG3		EQU	   {DIGIT+2}
DIG4		EQU	   {DIGIT+3}
DIG5		EQU	   {DIGIT+4}
DIG6		EQU	   {DIGIT+5} 
MDIGIT		DS.B	6
MDIG1		EQU	   {MDIGIT+0}
MDIG2		EQU	   {MDIGIT+1}
MDIG3		EQU	   {MDIGIT+2}
MDIG4		EQU	   {MDIGIT+3}
MDIG5		EQU	   {MDIGIT+4}
MDIG6		EQU	   {MDIGIT+5}
	                                                                           

;****************************************
;*****  PROGRAMMA  ********************
;****************************************
; in questa area vengono inserite 
; le istruzioni del programma
;****************************************
    WORDS           	        	;16 bit 
    segment 'rom'               	;Program Area          


;***********************************************************
;   	Routine Gestione Vettori di interrupt 
;***********************************************************
; Questo programma non prevede interrupt mascherabili
; Solo St7_main e' indirizzato da RESET all'accensione

dummy	    iret					; 
Spi_int     iret					;014 Serial Perif.Interface(SPI)               
Ltrtc_int   iret					;015 Lite Timer RTC interrupt  
Ltic_int    iret					;016 Lite Timer Input Capture
Atovl_int   iret    				;017 ARTimer Overflow
Atouc_int   iret					;018 ARTimer Output Compare  
Avd_int     iret				    	;019 AVD interrupt               
Ext3_int    iret					;020 (EI3) PB_0 
Ext2_int    iret					;021 (EI2) PB_3                       
           
Ext1_int   				    		;022 (EI1) PA_7        


;+----------------------------------------------+
;|				GESTIONE INTERRUPT  DA  PA7     |
;+----------------------------------------------+	
										
			ld			a,#1           ;segnalo alla conversione
			ld			FLAG,a         ;che sono in intrrupt
			call        out_test_1     ;per eseguirla piu velocemente
			ld			a,#0
			ld			FLAG,a
			ld      	a,ADCDR 	   ;Carica in a il valore di AD  
            cp	        a,#63h         ;valore 57h
            jrult		meno_cil       ;uscita meno formato
            cp  	    a,#79h 	       ;valore 72h
            jrult	    piu_cil 	   ;uscita piu' formato
            jra			fine_int
piu_cil 	call		inc_form			
            jra			fine_int
meno_cil	call		dec_form  
fine_int	iret
 
Ext0_int    iret					   ;023 (EI0) PA_0
Sw_int      iret					   ;024 Software (TRAP)
 
St7_main  		        			   ;----------------------------------------
									   ; Inizializzazione periferiche
      	    rsp             	       ; resetto Stack Pointer
                            	       ;-------------------
            ld	a,1000h                ;1000h Posizione dimemeoria EPROM dove si
            ld	RCCR,a                 ;trova il valore di taratura della frc (freq.CLK )
           		    				   ; --    MCCSR 
                					   ; Main Clock Control 
                					   ;  Status Register
		    ld    	  	a,#00000000b   ; B7-2 = 0 Riservati
            ld    	  	MCCSR,a        ; B1 = 0 MCO Mai Clock Out    
                		               ; B0 = 0 SMS Slow Mode Select
									   ;---------------------
 			               			   ; --    EICR 
  			              			   ; External Interrupt 
 			               			   ;  Control Register
            ld 		  	a,#00000000b   ; B7-6=ei3  00
            ld     	  	EICR,a         ; B5-4=ei2  00 
                	                   ; B3-2=ei1  00
                					   ; B1-0=ei0  00
									   ; Disabilito irq sulle 
									   ;     porte      
									   ;---------------------
									   ; --    LTCSR
									   ; Lite Timer Control
									   ;  Status Register
            ld  	  	a,#00000000b   ; Disabilito Lite Timer
            ld   	  	LTCSR,a        ;  e WatchDog
									   ;---------------------
									   ; --    EECSR
									   ; EEprom Control Status		
									   ;   Register
            ld    		a,#00000000b   ; Abilito solo in lettura  
            ld    		EECSR,a        ; per proteggere da scritture
                					   ;  anomale in POR la EEprom
									   ;---------------------
								       ; --    ATCSR
									   ; Auto Reload Control
									   ;  Status Register
		    ld			a,#00000000b   ; Disabilito Auto-Reload 
		    ld			ATCSR,a		   ;    Timer  
									   ;---------------------
									   ; --    ADCCSR
								       ; A/D Converter Control
									   ;  Status Register
		    ld			a,#00000000b   ; Disabilito A/D 
		    ld			ADCCSR,a	   ;     
									   ;---------------------
									   ; --    SPICR
									   ; Serial Peripheral Interface
									   ;  Control Register
		    ld			a,#00000000b   ; Disabilito SPI 
		    ld			SPICR,a		   ;     
                                       ;-------------------
                					   ; --    SICSR 
                				       ; System Integrity Contr. 
               					       ;  Status Register
            ld    		a,#00000000b   ; B3=LOCKED (hw)
            ld  	    SICSR,a        ; B2=LVDRF   0 
                	                   ; B1=AVDF   (hw)
                					   ; B0=AVDIE   0                
									   ;---------------------
									   ; Porte
									   ;---------------------
                		               ; Porta A PA0 - PA7
								       ;---------------------   
                             	       ;---------------------
 		    ld       	a,#01111011b   ; PA0 = Out P-Pull progr a,#01111011b \debag a,#00011011b 
 	        ld       	PDIR_A,a       ; PA1 = Out P-Pull 
    	    ld       	a,#11111011b; PA2 = float	  progr	a,#11111011b \debag a,#10011011b
  	        ld      	POPT_A,a       ; PA3 = Out P-Pull 
                               	       ; PA4 = Out P-Pull
                               	       ; PA5 = Out P-Pull
                               	   	   ; PA6 = Out P-Pull
                               	       ; PA7 = In Pull-Up interrupt   
                               	       ;-------------------
                               	       ; Porta B PB0 - PB4
                               	       ;---------------------
	        ld       	a,#00011100b   ; PB0 = float  progr  a,#00011100b \ debag a,#00001100b 
	        ld       	PDIR_B,a       ; PB1 = float  progr  a,#00011100b \ debag a,#00001100b
	        ld       	a,#00011100b   ; PB2 = Out P-Pull
	        ld       	POPT_B,a       ; PB3 = Out P-Pull
                                       ; PB4 = Out P-PULL
   	        rim		                   ;-------------------    


   	        
;+----------------------------------------------------+
;|				INIZIALIZZAZIONI                      |
;+----------------------------------------------------+   
	        						
	        ld       	a,#00h    	   ;---------------- 
            ld       	STEP0,a   	   ;azzero L_STEP
            ld       	STEP1,a        ;azzero	H_STEP	
            ld       	a,#7ch         ;partenza generezione S1
            ld       	S1_START,a    
            ld			a,#84h         ;fine S1
            ld			S1_END,a    
            ld			a,#30  
            ld			VELOCITA,a
            
		    ld			a,#1		   ;inizio il programma
		    ld			DIG1,a		   ;con un  cilindro	  
		    ld			a,#0           ;di sviluppo 480,0
		    ld			DIG2,a  
		    ld			a,#4
   		    ld			DIG3,a  
   		    ld			MDIG3,a
   		    ld			a,#8
   		    ld			DIG4,a 
   		    ld			MDIG4,a 
   		    ld			a,#0
		    ld			DIG5,a 
		    ld			MDIG5,a
		    ld			a,#0
		    ld			DIG6,a 
		    ld			MDIG6,a
		    call		tx_dati		       
                                   

;+--------------------------------------------------------------------+
;| Questa soubroutine serve per impostare L'Artimer	                  |
;| Viene "puntata" la tabella dei 10 valori di Duty Cycle
;| da 2096 a 4096 - 10 valori di duty cycle con step 200
;+--------------------------------------------------------------------+
;
art_set
			ld			x,#0			    ;  0
			ld			a,#TB1PWMH.h  	    ;  Punto Tabella MSB
			ld			PUN1TH,a      	    ;  carico indirizzo 
			ld			a,#TB1PWMH.l 	    ;  Punto Tabella MSB
			ld			PUN1TL,a 	   	    ;  carico indirizzo
									 		;-----
			ld			a,#TB1PWML.h 	    ;  Punto Tabella LSB
			ld			PUN2TH,a    	    ;  carico indirizzo
			ld			a,#TB1PWML.l	    ;  Punto Tabella LSB
			ld			PUN2TL,a 	        ;  carico indirizzo
                        ;-----
			ld			a,#0				; Pwm Control Status
       	    ld			PWM0CSR,a			;   Register
							  					; B1=0 POLARITA'
                                   		 	; B0=0 Compare Flag
											;-- PWMCR
       		ld			PWMCR,a		  		;   Register
			bset		PWMCR,#0 	 		; ON PWM
											;-- ATR
                             		       	; Auto Reload Register
			ld			a,([PUN1TH.W],x)	; carico il duty=ATR
			ld			ATRH,a  	  	    ;
			ld			DCR0H,a 	        ;
			ld			a,([PUN2TH.W],x)	; 
			ld			ATRL,a				;
			ld			DCR0L,a 	        ;
											;-- ATCSR
			ld			a,ATCSR				;
 	        ld			a,#00010000b		; ARTimer Control Status
	        ld			ATCSR,a				;   Register
				               		     	; B4-3 Counter Clock = 10 F/cpu
                         					; B2=0 Overflow Flag
				             		   		; B1=0 Ovrl Irq Disable
				             		   		; B0=0 cmp Irq Disable
			jp			main				;-------------------
 
  									
;***********************************************************
;       Subroutine  
;***********************************************************

;+--------------------------------------------------------------------+
;|Prima routine per fare un ritardo                                   |
;+--------------------------------------------------------------------+
;                                       
ritardo_1   ld			a,#D_R00      		;025 Carica in a il valore D_R00
		    ld			DELAY0,a       		;026 Carica in DELAY0 il valore in a
rit1_01     ld			a,VELOCITA     		;027 Carica in a il valore D_R01
		    ld			DELAY1,a       		;028 Carica in DELAY1 il valore in a
rit1_02	    dec			DELAY1         		;029 Decrementa di 1 il valore in DELAY1
		    jrne		rit1_02      		;030 salta a rit_02 se non 0
            dec			DELAY0         		;031 per 0 decrementa di 1 il val in DELAY0
            jreq		f_rit_1       		;032 se arrivato a 0 salta a f_rit
            jra			rit1_01     		;033 altrimenti salta a rit_01
f_rit_1     ret		       				;-------


;+--------------------------------------------------------------------+
;|Seconda routine per fare un ritardo                                 |
;+--------------------------------------------------------------------+
;                                      
ritardo_2   ld			a,#D_R02      		;vedi sopra
		    ld			DELAY2,a       		
rit2_01     ld			a,#D_R03       		
		    ld			DELAY3,a       		
rit2_02	    dec			DELAY3         		
		    jrne		rit2_02      		
            dec			DELAY2         		
            jreq	    f_rit_2       	
            jra			rit2_01     	
f_rit_2     ret		       			


;+--------------------------------------------------------------------+
;|Routine per fare un ritardo intrasmissione                          |
;+--------------------------------------------------------------------+
;                                       
rit_tx      ld			a,#D_R04      	   ;vedi sopra
		    ld			DELAY4,a       		
rit3_01     ld		    a,#D_R05       		
		    ld		    DELAY5,a       		
rit3_02	    dec		    DELAY5         		
		    jrne		rit3_02      		
            dec	   		DELAY4         		
            jreq		f_rit_3       	
            jra		    rit3_01     	
f_rit_3     ret		       			
                                      
;+------------------------------------------------------+
;| Generazione onda quadra su canale A					|               
;+------------------------------------------------------+
 
can_A       call 		ritardo_1 		   ;Eseguo un ritardo  
            btjf 	  	PORT_A,#3,on_A     ;Salta a accendi se PA3=0
off_A       bres	   	PORT_A,#3          ;altrimenti se PA3=1  
            jra	    	f_can_A            ;vai a f_can_A
on_A        bset 	  	PORT_A,#3    		;
f_can_A     ret                    	   ;Ritorna al programma principale
                                      
;+------------------------------------------------------+
;| Generazione onda quadra su canale B					|               
;+------------------------------------------------------+
 
can_B       call	   	ritardo_1 		   ;Eseguo un ritardo  
            btjf	   	PORT_A,#4,on_B     ;Salta a accendi se PA4=0
off_B       bres	   	PORT_A,#4          ;altrimenti se PA4=1 
            jra 	   	f_can_B            ;vai a f_can_B
on_B        bset	   	PORT_A,#4    		;
f_can_B     ret                   	   ;Ritorna al programma principale    

;+-------------------------------------------------------+
;| Generazione impulso su canale Z                       |
;+-------------------------------------------------------+
 
 
can_Z  	    bres	    PORT_B,#3 		   ;resetto impulso di zero 
		    rcf 	   
		    ld			a,#01h             ;STEP0 se supero 255 inccremento
	        add			a,STEP0            ;STEP1 di uno
	        jrnc		can_Z1    
	        ld			STEP0,a            ;salvo in STEP0 l'incremento
	        inc			STEP1
            ld   	    a,STEP1            ;vedo se supera 1024
            cp     	    a,#08h
            jrne 	    f_can_Z	  
            bset 	    PORT_B,#3  	       ;setto impulso di zero  
            ld  	    a,#0
            ld  	    STEP1,a
            jra			f_can_Z              	        
can_Z1 	    ld			STEP0,a            ;salvo in STEP0 l'incremento
f_can_Z	    ret							                           

 

;+--------------------------------------------------------+
;| Generazione senale S1                                  |
;+--------------------------------------------------------+   
                                   
                            
mark        ld          a,STEP1  		    ;vedo se sono nei primi 255
		    cp  	    a,#00h 		        ;impulsi di encoder se non
     	    jrne	    f_mark	            ;lo sono salto  
            ld		    a,STEP0
            cp		    a,S1_START      
            jrne	 	mark_1
            bset	    PORT_B,#2 
            jra 	   	f_mark
mark_1      ld  	  	a,STEP0
            cp		  	a,S1_END      
            jrne	  	f_mark
            bres	   	PORT_B,#2		    ;resetto impulso per S1 	        
f_mark      ret      
                                           
                                           
                                           
;+--------------------------------------------------------+
;| Trasmissioni dati                                      |
;+--------------------------------------------------------+  

tx_dati     ld			x,#DIG1			;Carico in x L'Indirizzo di DIG1
	        dec		    x				;sottraggo 1 (per il loop)
m_1		    inc		    x               ;Incremento x  
		    sll		    (x)				;sposto a sinistra di 4
		    sll			(x)				;posizioni prima di
	        sll			(x)				;iniziare la trasmissione
		    sll			(x)				
		    ld			y,#4			;4 sono i bit da trasmettere per DIGIT
	        rcf				            ;resetto il Carry flag
m_2	        sll			(x)             ;Shifto a sinistra il valore contenuto nel 
			     						;dato indirizzato da x (prima volta DIG1)
		    jrc			m_3             ;se c'e Carry salto
		    bres		PORT_A,#0		;altrimenti data low
 		    jra			m_4				;salta a m_4
m_3	        bset		PORT_A,#0		;data hig  
m_4		    call		ritardo_1
		    bset		PORT_A,#1		;clock  | 
            call		rit_tx
	        bres		PORT_A,#1   
	        call		rit_tx	    
    	    dec			y				;loop per 4
	        jrne		m_2				;per diverso da 0 salto
   		    cp			x,#DIG6			;loop per 6
		    jrne		m_1             ;per diverso da 0 salto     
		    bres		PORT_A,#0
	   	    ret


                                       
;+--------------------------------------------------------+
;| Gestione tastiera                                      |
;+--------------------------------------------------------+  
                                       
key         ld			a,#00000000b    
;                                 |
;                                 +-------- attivo AIN0
		    ld			ADCCSR,a	       

			bres     	ADCCSR,#5  	    	;metto in OFF AD
		    ld   	    a,#00110000b 	    ;A/D senza amplificatore 
;   					     ||	   			
;	                         |+------------ B2 AMPSEL=0 Amplificatore OFF		
;   					     +------------- B3 SLOW=0   A/D in FCpu
            ld       	ADCCAMP,a         	
            bset    	ADCCSR,#5    	    ;AD On inizio conversione
            ld       	a,ADCDR  		    ;pulisco lettura A/D
            btjf     	ADCCSR,#7,$ 	    ;attendo fine conversione  
            ld      	a,ADCDR 		    ;Carica in a il valore di AD   
            cp			a,#0c0h             ;se non pigiato nessun tasto
            jruge		f_key               ;esci  
            ld			MEMADC,a			;salva la lettura    
            call		ritardo_2           ;ritardo antirimbalzo
        	bset    	ADCCSR,#5    	    ;AD On inizio conversione
            ld       	a,ADCDR  		    ;pulisco lettura A/D
            btjf     	ADCCSR,#7,$ 	    ;attendo fine conversione             
    		ld      	a,ADCDR 		    ;Carica in a il valore di AD 
 	    	cp			a,MEMADC
    		jrne		f_key              
            
            cp	        a,#10h 	      		;valore 00h
            jrult	    t_manual 	        ;tasto manuale
            cp	        a,#30h  	        ;valore 1fh
            jrult	    t_auto  	        ;tasto auto
            cp	        a,#50h              ;valore 3eh
            jrult		t_piu               ;tasto piu'
            cp  	    a,#70h              ;valore 5dh
            jrult	    t_meno              ;tasto meno
            cp	        a,#90h              ;valore 7ch
            jrult	    t_fre_su            ;tasto freccia in su'
            cp   	    a,#0b0h             ;valore 9bh
            jrult	    t_fre_giu           ;tasto freccia in giu'
f_key		ret    

     
t_meno	    call		extra_rit
			btjt		PORT_A,#5,appog1
			btjt		PORT_A,#6,vel_meno
			call	 	meno  
			ret   
			
t_piu	    call		extra_rit
            btjt		PORT_A,#5,appog2 
            btjt		PORT_A,#6,vel_piu
			call		piu  
			ret     
			
t_fre_su    call        extra_rit  
			ld			a,#00h              ;azzero memoria TEST_OK
			ld			TEST_OK,a           ;spengo il led pericolo
            bres        PORT_B,#4
		    btjf		PORT_A,#5,su_on
            bres        PORT_A,#5   
            ret
su_on		bset        PORT_A,#5			;accendi led freccia in su' 
			bres		PORT_A,#6
	        ret
	        
t_fre_giu   call        extra_rit  
			ld			a,#00h              ;azzero memoria TEST_OK
			ld			TEST_OK,a           ;spengo il led pericolo
            bres        PORT_B,#4
		    btjf		PORT_A,#6,giu_on
            bres        PORT_A,#6   
            ret
giu_on		bset        PORT_A,#6 			;accendi led freccia in giu'
			bres		PORT_A,#5
	        ret
t_auto	    call		extra_rit
			btjt		PORT_A,#5,test_T3
			btjt		PORT_A,#6,test_F4
			call	 	automat  
			ret   
t_manual    call		extra_rit
			btjt		PORT_A,#5,test_F6
;			btjt		PORT_A,#6,non utilizzato SCORTA
			call	 	manuale  
			ret   
		
appog1		jp			dec_form			
appog2		jp			inc_form	

				 	
;+-------------------------------------------------------+
;|         VARIAZIONE VELOCITA                           |
;+-------------------------------------------------------+

   							    
vel_meno    ld			a,VELOCITA         ;decremento la
            inc			a                  ;velocita
            cp			a,#254             
            jreq		fin_vel
            ld			VELOCITA,a
            jra			fin_vel

vel_piu		ld			a,VELOCITA         ;incremento la
            dec			a                  ;velocita   
            cp			a,#1               
            jreq		fin_vel
            ld			VELOCITA,a
            jra			fin_vel
fin_vel		ret            
            		
piu			ld			a,S1_START   
			dec			a
			ld			S1_START,a
			ld			a,S1_END
			dec			a
			ld			S1_END,a     
			ret				   		       
                                     
           		
meno		ld			a,S1_START   
			inc			a
			ld			S1_START,a
			ld			a,S1_END
			inc			a
			ld			S1_END,a     
			ret				   		       
	                                               
test_T3	    ld			a,#2		        ;test dell uscite
		    ld			DIG1,a			  
		    ld			a,#0
		    ld			DIG2,a 
   		    ld			DIG3,a
   		    ld			DIG4,a 
		    ld			DIG5,a
		    ld			a,#1
		    ld			DIG6,a
		    call		tx_dati	 
			ld			a,#00h             ;azzero memoria TEST_OK
			ld			TEST_OK,a
		  	call		out_test
			ld			a,TEST_OK
			cp			a,#06h             ;controllo se ha contato
			jreq		T3_fine	           ;tutte le uscite se non
           	bset        PORT_B,#4	       ;arrivato a 6led pericolo on
T3_fine     ret  
 

test_F4	    ld			a,#2				;trasmissione comando		   
		    ld			DIG1,a			    ;fasatura automatica
		    ld			a,#0
		    ld			DIG2,a  
		    ld			DIG3,a
   		    ld			DIG4,a
   		    ld			DIG5,a   
			ld			a,#4
		    ld			DIG6,a
		    call		tx_dati		       
            ret                       

 
test_F6	    ld			a,#2				;test correzzione veloce		   
		    ld			DIG1,a			    ;in cambio di bobina automatico
		    ld			a,#0
		    ld			DIG2,a  
		    ld			DIG3,a
   		    ld			DIG4,a
   		    ld			DIG5,a 
		    ld			DIG6,a
		    call		tx_dati		       
            ret   

automat	    ld			a,#2				;trasmissione comando		   
		    ld			DIG1,a			    ;automatico
		    ld			a,#0
		    ld			DIG2,a  
		    ld			DIG3,a
   		    ld			DIG4,a
   		    ld			DIG5,a   
			ld			a,#3
		    ld			DIG6,a
		    call		tx_dati		       
            ret   
 
manuale	    ld			a,#2				;trasmissione comando		   
		    ld			DIG1,a			    ;manuale
		    ld			a,#0
		    ld			DIG2,a  
		    ld			DIG3,a
   		    ld			DIG4,a
   		    ld			DIG5,a   
			ld			a,#2
		    ld			DIG6,a
		    call		tx_dati		       
            ret   
 
         

;+---------------------------------------------------+
;|           VARIAZIONE FOMATO					     |
;+---------------------------------------------------+
 
inc_form	ld			a,MDIG6				;quando l'icremento	
			inc			a                   ;arriva a 10 metto
			cp			a,#10               ;zero e incremento
            jreq		in_dig5             ;la cella successiva
            ld			MDIG6,a
            jra			fin_form
in_dig5		ld			a,#0
			ld			MDIG6,a 
            ld			a,MDIG5
            inc			a
            cp			a,#10
            jreq		in_dig4 
            ld			MDIG5,a
            jra			fin_form
in_dig4		ld			a,#0
			ld			MDIG5,a 
            ld			a,MDIG4
            inc			a
            cp			a,#10
            jreq		in_dig3  
            ld			MDIG4,a
            jra			fin_form
in_dig3		ld			a,#0
			ld			MDIG4,a 
            ld			a,MDIG3
            inc			a
            cp			a,#10
            jreq		in_dig2 
            ld			MDIG3,a
            jra			fin_form
in_dig2		ld			a,#9
			ld			MDIG3,a
            jra			fin_form       
                                  
dec_form    ld			a,MDIG6	            ;quando il decremento arriva
			dec			a                   ;a 255 metto 9 e decremento
			cp			a,#255              ;la cella successiva
            jreq		de_dig5  
            ld			MDIG6,a
            jra			fin_form
de_dig5	    ld			a,#9
			ld			MDIG6,a 
            ld			a,MDIG5
            dec			a
            cp			a,#255
            jreq		de_dig4 
            ld			MDIG5,a
            jra			fin_form
de_dig4 	ld			a,#9
			ld			MDIG5,a 
            ld			a,MDIG4
            dec			a
            cp			a,#255
            jreq		de_dig3  
            ld			MDIG4,a
            jra			fin_form
de_dig3		ld			a,#9
			ld			MDIG4,a 
            ld			a,MDIG3
            dec			a
            cp			a,#255
            jreq		de_dig2 
            ld			MDIG3,a
            jra			fin_form
de_dig2	    ld			a,#9
			ld			MDIG3,a

 
fin_form	ld			a,MDIG6             ;scambio tra memoria
			ld			DIG6,a		        ;temporanea e quella
			ld			a,MDIG5             ;di trasmissione
			ld			DIG5,a											
			ld			a,MDIG4
			ld			DIG4,a		
			ld			a,MDIG3
			ld			DIG3,a	
			ld			a,#1
			ld			DIG1,a
			ld			a,#0
			ld			DIG2,a
			call		tx_dati	
										
			ret                  
			
			
			
                                      
;+--------------------------------------------------------+
;|			Lettura test uscite                           |
;+--------------------------------------------------------+  
                                       
out_test    call		extra_rit      

			sim                             ;durante out_test disabilito interrupt

out_test_1	ld			a,#00000001b 
;                                 |
;                                 +-------- attivo AIN1  
			ld			ADCCSR,a	       
			bres     	ADCCSR,#5  	    	;metto in OFF AD
		    ld   	    a,#00110000b 	    ;A/D senza amplificatore  
;   					     ||	  		
;	                         |+------------ B2 AMPSEL=0 Amplificatore OFF		
;   					     +------------- B3 SLOW=0   A/D in FCpu
            ld       	ADCCAMP,a       
            bset    	ADCCSR,#5    	    ;AD On inizio conversione
            ld       	a,ADCDR  		    ;pulisco lettura A/D
            btjf     	ADCCSR,#7,$ 	    ;attendo fine conversione 
            
            ld			a,FLAG              ;se sono in interrup
            cp			a,#1                ;velocizzo la procedura
            jreq		fin_out_1
             
            ld      	a,ADCDR 		    ;Carica in a il valore di AD   
            cp			a,#0c0h             ;se nessuna uscita  
            jruge		fin_out             ;esci  
                 		          
			cp	        a,#28h 	      		;valore 21h   24
            jrult	    fase_vel 	        ;uscita fase veloce
            cp	        a,#45h  	        ;valore 3ch   3d
            jrult	    allarme  	        ;uscita allarme
            cp	        a,#64h            	;valore 57h    59
            jrult		meno_form           ;uscita meno formato
            cp  	    a,#79h              ;valore 72h    75
            jrult	    piu_form            ;uscita piu' formato
            cp	        a,#95h              ;valore 8dh    8f
            jrult	    ritardo             ;uscita ritardo
            cp   	    a,#0b0h             ;valore a8h     aa
            jrult	    avanti		        ;uscita avanti   

fin_out     ld			x,#0
			call		pwm           
			
			rim                             ;alla fine di out_test abilito l'interrupt
			
fin_out_1	ret 

   
			
fase_vel	ld			x,#12
			call		pwm			
			ld			a,TEST_OK
			cp			a,#05h
			jrne		fase_vel_1
			inc			TEST_OK     
fase_vel_1  jp			out_test
 

allarme		ld			x,#10			
            call		pwm
   			ld			a,TEST_OK
			cp			a,#04h
			jrne		allarme_1
			inc			TEST_OK     
allarme_1   jp			out_test
 
meno_form	ld			x,#8	
			call		pwm		
			ld			a,TEST_OK
			cp			a,#03h
			jrne		meno_form_1
			inc			TEST_OK     
meno_form_1 jp			out_test

piu_form	ld			x,#6  
			call		pwm	
			ld			a,TEST_OK
			cp			a,#02h
			jrne		piu_form_1
			inc			TEST_OK     
piu_form_1  jp			out_test
		
ritardo		ld			x,#4	
            call		pwm	  
			ld			a,TEST_OK
			cp			a,#01h   
           	jrne		ritard_1
			inc			TEST_OK			     
ritard_1    jp			out_test
			
avanti		ld			x,#2
			call		pwm    
			ld			a,TEST_OK
			cp			a,#00h
			jrne		avanti_1
			inc			TEST_OK     
avanti_1    jp			out_test

pwm   		btjt	ATCSR,#2,overf      ;
       	    jp		pwm 				;	                
overf		ld		a,PWM0CSR			; reset ovl
			ld		a,ATCSR				; reset ovl
			ld		a,([PUN1TH.W],x)	; ricarico il duty
			ld		DCR0H,a             ;
			ld		a,([PUN2TH.W],x)	; ricarico il duty
			ld		DCR0L,a             ;
            ret
 
;+--------------------------------------------------+ 
;|			SUPER RITARDO							| 
;+--------------------------------------------------+  


extra_rit	call	ritardo_2
			call	ritardo_2
			call	ritardo_2    
			ret
;============================================================
;= I  N  I  Z  I  O      P  R  O  G  R  A  M  M  A  =========    
;============================================================

                              
main  	    call	    can_A             ;1^ routine onda quadra 
       	    call     	can_B             ;2^ routine onda quadra
       	    call	    can_Z 
         	call 	    mark              ;generazione S1  
          	call 	    key               ;gestione tastiera   
       		jp     		main       
                
TB1PWMH	DC.B	08h                     ; 2095
TB1PWML	DC.B	2fh                     ;   "                    
		DC.W	2195,2295,2395,2495,2595,2695,2795,3695,3895,4095

                             
            end
  