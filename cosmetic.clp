(defrule Lipstick 				;описание помады
	(declare (CF 0.9)) 			
	(and (wax yes) (oil yes) (red yes))	; воск, масло, красна€		
	=> 
	(assert (product Lipstick)))  

(defrule Mascara 			;описание туши
	(declare (CF 0.8)) 
	(and (black yes) (thick yes))	;черна€, густа€
							
	=> 
	(assert (product mascara)))

(defrule Foundation 			;описание тональника 
	(declare (CF 0.7)) 
	(and (beige yes) (creamy yes))	;бежевый, креообразный
	=> 
	(assert (product foundation)))

(defrule Powder 					;описание пудры
	(declare (CF 0.7)) 
	(and (matt yes)	(beige yes) (crumbly yes))	;матова€,бежевый,рассыпчата€
	=> 
	(assert (product powder)))

(defrule Eyeshadow 							;описание теней дл€ век
	(declare (CF 0.5)) 
	(and (shine yes) (crumbly yes) (multicolor yes))		;блест€щие,рассыпчатные,цветные
	=> 
	(assert (product eyeshadow)))

(defrule Highlight 							;описание хайлайтера
	(declare (CF 0.5)) 
	(and (or (crumbly yes) (creamy yes)) (shine yes))		;блест€щий,рассыпчатный/кремообразный
	=> 
	(assert (product highlight)))


(defrule GetWax					;наличие воска 
	(declare (salience 100)) 
	=> 
	(printout t "” продукта в составе есть воск? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (wax yes) CF ?cf))

(defrule GetOil					;наличие масла 
	(declare (salience 100)) 
	=> 
	(printout t "” продукта в составе есть масло? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (oil yes) CF ?cf))

(defrule GetRed 				;наличие красного цвета
	(declare (salience 100)) 
	=>
	(printout t "” продукта в составе есть красный цвет? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (red yes) CF ?cf))

(defrule GetBlack 				;наличие черного цвета  
	(declare (salience 100)) 
	=> 
	(printout t "” продукта в составе есть черный цвет? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (black yes) CF ?cf))

(defrule GetThick 				;наличие густоты 
	(declare (salience 100)) 
	=> 
	(printout t "Ќасколько продукт густой? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (thick yes) CF ?cf))

(defrule GetBeige				;наличие бежевого цвета
	(declare (salience 100)) 
	=> 
	(printout t "” продукта в составе есть бежевый цвет? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (beige yes) CF ?cf))

(defrule GetCreamy				;наличие кремообразности
	(declare (salience 100)) 
	=> 
	(printout t "Ќасколько продукт кремообразный? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (creamy yes) CF ?cf))


(defrule GetMatt				;наличие матового покрыти€
	(declare (salience 100)) 
	=> 
	(printout t "Ќасколько продукт обладает матовым покрытием? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (matt yes) CF ?cf))


(defrule GetCrumbly			;насколько рассыпчатный продукт 
	(declare (salience 100)) 
	=> 
	(printout t "Ќасколько продукт рассыпчатый? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (crumbly yes) CF ?cf))


(defrule GetShine				;насколько блест€щий продукт
	(declare (salience 100)) 
	=> 
	(printout t "Ќасколько продукт блест€щий? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (shine yes) CF ?cf))


(defrule GetMulticolor				;цветова€ палитра
	(declare (salience 100)) 
	=> 
	(printout t "ќбладает ли данный продукт многими цветами? (0 to 1): ") 
	(bind ?cf (read)) 
	(assert (multicolor yes) CF ?cf))


(defrule ShowResults 
	(declare (salience -100)) 
	?f <- (product ?d) 
	=> 
	(printout t ?d " -> с доверием CF=" (get-cf ?f) crlf))