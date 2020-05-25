(defrule american_cuisine 				;описание американской кухни
	(declare (CF 1.0)) 			
	(and (fastfood yes) (bbq yes))			; фаст-фуд, гриль	
	=> 
	(assert (cuisine american)))  

(defrule russian_cuisine 				;описание русской кухни
	(declare (CF 1.0)) 
	(and (soup yes) (porridge yes) (pancakes yes))	;суп, каша, блины				
	=> 
	(assert (cuisine russian)))

(defrule japan_cuisine 					;описание японской кухни 
	(declare (CF 1.0)) 
	(and (seafood yes) (rise yes) (ginger yes))	;рыба, рис, имбирь
	=> 
	(assert (cuisine japan)))

(defrule greek_cuisine						;описание греческой кухни
	(declare (CF 1.0)) 
	(and (greens yes) (oliveoil yes) (seafood yes))	;овощи, оливковое масло, морепродукты
	=> 
	(assert (cuisine greek)))

(defrule indian_cuisine 					;описание индийской кухни
	(declare (CF 1.0)) 
	(and (flavoring yes) (bbq yes))				;приправы, гриль
	=> 
	(assert (cuisine indian)))



(defrule GetFastfood					;фастфуд 
	(declare (salience 100)) 
	=> 
	(printout t "Это фаст-фуд? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (fastfood yes) CF ?cf))

(defrule GetBbq						;жирность 
	(declare (salience 100)) 
	=> 
	(printout t "Насколько жирная кухня? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (bbq yes) CF ?cf))

(defrule GetSoup 					;суп
	(declare (salience 100)) 
	=>
	(printout t "Есть ли супы в этой кухне? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (soup yes) CF ?cf))

(defrule GetPorridge 					;каша  
	(declare (salience 100)) 
	=> 
	(printout t "Есть ли каши в этой кухне? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (porridge yes) CF ?cf))

(defrule GetPancakes 					;блины
	(declare (salience 100)) 
	=> 
	(printout t "Есть ли блины в этой кухне? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (pancakes yes) CF ?cf))

(defrule GetSeafood					;морепродукты
	(declare (salience 100)) 
	=> 
	(printout t "Входят ли в состав блюд рыба? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (seafood yes) CF ?cf))

(defrule GetRise					;рис
	(declare (salience 100)) 
	=> 
	(printout t "Входят ли в состав блюд рис? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (rise yes) CF ?cf))


(defrule GetGinger					;имбирь
	(declare (salience 100)) 
	=> 
	(printout t "Входят ли в состав блюд имбирь? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (ginger yes) CF ?cf))


(defrule GetGreens					;овощи
	(declare (salience 100)) 
	=> 
	(printout t "Входят ли в состав блюд овощи? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (greens yes) CF ?cf))


(defrule GetOliveOil					;оливковое масло
	(declare (salience 100)) 
	=> 
	(printout t "Есть ли оливковое масло? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (oliveoil yes) CF ?cf))


(defrule GetFlavoring					;приправы
	(declare (salience 100)) 
	=> 
	(printout t "Насколько остро? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (flavoring yes) CF ?cf))


(defrule ShowResults 
	(declare (salience -100)) 
	?f <- (cuisine ?d) 
	=> 
	(printout t ?d " -> с доверием CF=" (get-cf ?f) crlf))