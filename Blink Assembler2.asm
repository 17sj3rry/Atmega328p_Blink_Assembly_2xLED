.equ LED = 5		;LED1 an Pin5
.equ LED2 = 3		;LED2 an Pin3

.equ Wert1 = 100	;Werte für den Delaydurchlauf durch die Register
.equ Wert2 = 100
.equ Wert3 = 100

.def delay_0 = r17	;Zuordnung Register zum Delay
.def delay_1 = r18
.def delay_2 = r19

	ldi r16,0xFF	; Zuordnung alle Werte=1 in Register 16
	out DDRB,r16	; Zuordnung DDRB Ausgang Register 16
	out PortB,r16	; Zuordnung PortB AUsgang Register 16

Start:

loop:
			ldi delay_0, Wert1		;Werte in Delay laden
			ldi delay_1, Wert2
			ldi delay_2, Wert3

			sbi PINB, LED			;PINB LED setzen

			rcall delay				; Delay
	
			ldi delay_0, Wert1		;Wrerte in Delay laden
			ldi delay_1, Wert2
			ldi delay_2, Wert3

			cbi PORTB, LED			; PortB LED clear

			rcall delay				; Delay

	ldi delay_0, Wert1
			ldi delay_1, Wert2
			ldi delay_2, Wert3

	sbi PINB, LED2

	rcall delay

	ldi delay_0, Wert1
			ldi delay_1, Wert2
			ldi delay_2, Wert3

	cbi PORTB, LED2
		
	rcall delay

	rjmp Start


delay:

dec delay_0
brne delay
dec delay_1
brne delay
dec delay_2
brne delay

ret