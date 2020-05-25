(defrule Measles 			;диагностика кори
	(declare (CF 0.5)) 
	(fever yes)  			;лихорадка
	(spots yes)  			;сыпь
	=> 
	(assert (diagnosis measles)))  

(defrule Flu 						;диагностика гриппа
	(declare (CF 0.8)) 
	(or (fever yes)  (sorethroat yes))		;лихорадка / горло
	=> 
	(assert (diagnosis flu)))

(defrule Allergy1 			;диагностика аллергии 
	(declare (CF 0.9)) 
	(spots yes) 			;пятна 
	=> 
	(assert (diagnosis allergy)))

(defrule Allergy2 			;диагностика аллергии 
	(declare (CF 0.9)) 
	(rash yes) 			;пятна 
	=> 
	(assert (diagnosis allergy)))

(defrule GetFever 				;наличие лихорадки 
	(declare (salience 100)) 
	=> 
	(printout t "У пациента есть лихорадка? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (fever yes) CF ?cf))

(defrule GetSpots 				;наличие пятен 
	(declare (salience 100)) 
	=> 
	(printout t "У пациента есть пятна? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (spots yes) CF ?cf))

(defrule GetSore 				;наличие боли горла 
	(declare (salience 100)) 
	=>
	(printout t "У пациента болит горло? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (sorethroat yes) CF ?cf))

(defrule GetRash 				;наличие сыпи 
	(declare (salience 100)) 
	=> 
	(printout t "У пациента есть сыпь? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (rash yes) CF ?cf))
(defrule ShowResults 
	(declare (salience -100)) 
	?f <- (diagnosis ?d) 
	=> 
	(printout t ?d " -> с доверием CF=" (get-cf ?f) crlf))