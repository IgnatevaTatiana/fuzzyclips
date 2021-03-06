(defrule Measles 			;����������� ����
	(declare (CF 0.5)) 
	(fever yes)  			;���������
	(spots yes)  			;����
	=> 
	(assert (diagnosis measles)))  

(defrule Flu 						;����������� ������
	(declare (CF 0.8)) 
	(or (fever yes)  (sorethroat yes))		;��������� / �����
	=> 
	(assert (diagnosis flu)))

(defrule Allergy1 			;����������� �������� 
	(declare (CF 0.9)) 
	(spots yes) 			;����� 
	=> 
	(assert (diagnosis allergy)))

(defrule Allergy2 			;����������� �������� 
	(declare (CF 0.9)) 
	(rash yes) 			;����� 
	=> 
	(assert (diagnosis allergy)))

(defrule GetFever 				;������� ��������� 
	(declare (salience 100)) 
	=> 
	(printout t "� �������� ���� ���������? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (fever yes) CF ?cf))

(defrule GetSpots 				;������� ����� 
	(declare (salience 100)) 
	=> 
	(printout t "� �������� ���� �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (spots yes) CF ?cf))

(defrule GetSore 				;������� ���� ����� 
	(declare (salience 100)) 
	=>
	(printout t "� �������� ����� �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (sorethroat yes) CF ?cf))

(defrule GetRash 				;������� ���� 
	(declare (salience 100)) 
	=> 
	(printout t "� �������� ���� ����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (rash yes) CF ?cf))
(defrule ShowResults 
	(declare (salience -100)) 
	?f <- (diagnosis ?d) 
	=> 
	(printout t ?d " -> � �������� CF=" (get-cf ?f) crlf))