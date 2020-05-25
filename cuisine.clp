(defrule american_cuisine 				;�������� ������������ �����
	(declare (CF 1.0)) 			
	(and (fastfood yes) (bbq yes))			; ����-���, �����	
	=> 
	(assert (cuisine american)))  

(defrule russian_cuisine 				;�������� ������� �����
	(declare (CF 1.0)) 
	(and (soup yes) (porridge yes) (pancakes yes))	;���, ����, �����				
	=> 
	(assert (cuisine russian)))

(defrule japan_cuisine 					;�������� �������� ����� 
	(declare (CF 1.0)) 
	(and (seafood yes) (rise yes) (ginger yes))	;����, ���, ������
	=> 
	(assert (cuisine japan)))

(defrule greek_cuisine						;�������� ��������� �����
	(declare (CF 1.0)) 
	(and (greens yes) (oliveoil yes) (seafood yes))	;�����, ��������� �����, ������������
	=> 
	(assert (cuisine greek)))

(defrule indian_cuisine 					;�������� ��������� �����
	(declare (CF 1.0)) 
	(and (flavoring yes) (bbq yes))				;��������, �����
	=> 
	(assert (cuisine indian)))



(defrule GetFastfood					;������� 
	(declare (salience 100)) 
	=> 
	(printout t "��� ����-���? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (fastfood yes) CF ?cf))

(defrule GetBbq						;�������� 
	(declare (salience 100)) 
	=> 
	(printout t "��������� ������ �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (bbq yes) CF ?cf))

(defrule GetSoup 					;���
	(declare (salience 100)) 
	=>
	(printout t "���� �� ���� � ���� �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (soup yes) CF ?cf))

(defrule GetPorridge 					;����  
	(declare (salience 100)) 
	=> 
	(printout t "���� �� ���� � ���� �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (porridge yes) CF ?cf))

(defrule GetPancakes 					;�����
	(declare (salience 100)) 
	=> 
	(printout t "���� �� ����� � ���� �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (pancakes yes) CF ?cf))

(defrule GetSeafood					;������������
	(declare (salience 100)) 
	=> 
	(printout t "������ �� � ������ ���� ����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (seafood yes) CF ?cf))

(defrule GetRise					;���
	(declare (salience 100)) 
	=> 
	(printout t "������ �� � ������ ���� ���? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (rise yes) CF ?cf))


(defrule GetGinger					;������
	(declare (salience 100)) 
	=> 
	(printout t "������ �� � ������ ���� ������? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (ginger yes) CF ?cf))


(defrule GetGreens					;�����
	(declare (salience 100)) 
	=> 
	(printout t "������ �� � ������ ���� �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (greens yes) CF ?cf))


(defrule GetOliveOil					;��������� �����
	(declare (salience 100)) 
	=> 
	(printout t "���� �� ��������� �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (oliveoil yes) CF ?cf))


(defrule GetFlavoring					;��������
	(declare (salience 100)) 
	=> 
	(printout t "��������� �����? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (flavoring yes) CF ?cf))


(defrule ShowResults 
	(declare (salience -100)) 
	?f <- (cuisine ?d) 
	=> 
	(printout t ?d " -> � �������� CF=" (get-cf ?f) crlf))