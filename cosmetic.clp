(defrule Lipstick 				;�������� ������
	(declare (CF 0.9)) 			
	(and (wax yes) (oil yes) (red yes))	; ����, �����, �������		
	=> 
	(assert (product Lipstick)))  

(defrule Mascara 			;�������� ����
	(declare (CF 0.8)) 
	(and (black yes) (thick yes))	;������, ������
							
	=> 
	(assert (product mascara)))

(defrule Foundation 			;�������� ���������� 
	(declare (CF 0.7)) 
	(and (beige yes) (creamy yes))	;�������, ������������
	=> 
	(assert (product foundation)))

(defrule Powder 					;�������� �����
	(declare (CF 0.7)) 
	(and (matt yes)	(beige yes) (crumbly yes))	;�������,�������,�����������
	=> 
	(assert (product powder)))

(defrule Eyeshadow 							;�������� ����� ��� ���
	(declare (CF 0.5)) 
	(and (shine yes) (crumbly yes) (multicolor yes))		;���������,������������,�������
	=> 
	(assert (product eyeshadow)))

(defrule Highlight 							;�������� ����������
	(declare (CF 0.5)) 
	(and (or (crumbly yes) (creamy yes)) (shine yes))		;���������,������������/�������������
	=> 
	(assert (product highlight)))


(defrule GetWax					;������� ����� 
	(declare (salience 100)) 
	=> 
	(printout t "� �������� � ������� ���� ����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (wax yes) CF ?cf))

(defrule GetOil					;������� ����� 
	(declare (salience 100)) 
	=> 
	(printout t "� �������� � ������� ���� �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (oil yes) CF ?cf))

(defrule GetRed 				;������� �������� �����
	(declare (salience 100)) 
	=>
	(printout t "� �������� � ������� ���� ������� ����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (red yes) CF ?cf))

(defrule GetBlack 				;������� ������� �����  
	(declare (salience 100)) 
	=> 
	(printout t "� �������� � ������� ���� ������ ����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (black yes) CF ?cf))

(defrule GetThick 				;������� ������� 
	(declare (salience 100)) 
	=> 
	(printout t "��������� ������� ������? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (thick yes) CF ?cf))

(defrule GetBeige				;������� �������� �����
	(declare (salience 100)) 
	=> 
	(printout t "� �������� � ������� ���� ������� ����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (beige yes) CF ?cf))

(defrule GetCreamy				;������� ���������������
	(declare (salience 100)) 
	=> 
	(printout t "��������� ������� �������������? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (creamy yes) CF ?cf))


(defrule GetMatt				;������� �������� ��������
	(declare (salience 100)) 
	=> 
	(printout t "��������� ������� �������� ������� ���������? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (matt yes) CF ?cf))


(defrule GetCrumbly			;��������� ������������ ������� 
	(declare (salience 100)) 
	=> 
	(printout t "��������� ������� �����������? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (crumbly yes) CF ?cf))


(defrule GetShine				;��������� ��������� �������
	(declare (salience 100)) 
	=> 
	(printout t "��������� ������� ���������? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (shine yes) CF ?cf))


(defrule GetMulticolor				;�������� �������
	(declare (salience 100)) 
	=> 
	(printout t "�������� �� ������ ������� ������� �������? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (multicolor yes) CF ?cf))


(defrule ShowResults 
	(declare (salience -100)) 
	?f <- (product ?d) 
	=> 
	(printout t ?d " -> � �������� CF=" (get-cf ?f) crlf))