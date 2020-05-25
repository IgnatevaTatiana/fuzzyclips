(defrule startup
	=>
	(printout t "Hello ! The problem is" t)
	(printout t "   DETALY" t)
	(printout t " + DETALY" t)
	(printout t "  -------" t)
        (printout t " = IZDELIE" t t)
	(assert (number 0) (number 1) (number 2) (number 3) (number 4) 
            (number 5) (number 6) (number 7) (number 8) (number 9)
		    (letter A) (letter D) (letter E) (letter I) (letter L) 
            (letter T) (letter Y) (letter Z)
	)
)

(defrule generate
    (number ?x)
    (letter ?y)
    =>
    (assert (combination ?y ?x))
)


(defrule find-solution
    	(combination Y ?y)
    	(combination E ?e&~?y)
    	(combination L ?l&~?y&~?e)
    	(combination I ?i&~?y&~?e&~?l)
    	(combination A ?a&~?y&~?e&~?l&~?i)
    	(combination T ?t&~?y&~?e&~?l&~?i&~?a)
	(combination D ?d&~?y&~?e&~?l&~?i&~?a&~?t)
	(combination Z ?z&~?y&~?e&~?l&~?i&~?a&~?t&~?d)


    (test (= (mod (+ ?y ?y) 10) ?e))

    (test (= (mod (+ ?y ?y 
                    (* (+ ?l ?l) 10 ))
                                 100)
                    (+ (* 10 ?i) ?e)))

    (test (= (mod (+ ?y ?y 
                  (* (+ ?l ?l) 10)
                  (* (+ ?a ?a) 100))
                               1000)    
              (+ (* 100 ?l) (* 10 ?i) ?e)))

    (test (= (mod (+ ?y ?y
                  (* (+ ?l ?l) 10)
                  (* (+ ?a ?a) 100)
                  (* (+ ?t ?t) 1000))
                               10000)
            (+ (* 1000 ?e) (* 100 ?l) (* 10 ?i) ?e)))
    
    (test (= (mod (+ ?y ?y
                  (* (+ ?l ?l) 10)
                  (* (+ ?a ?a) 100)
                  (* (+ ?t ?t) 1000)
                  (* (+ ?e ?e) 10000))
                               100000)
            (+ (* 10000 ?d) (* 1000 ?e) (* 100 ?l) (* 10 ?i) ?e)))
    
    (test (= (mod (+ ?y ?y 
                  (* (+ ?l ?l) 10)
                  (* (+ ?a ?a) 100)
                  (* (+ ?t ?t) 1000)
                  (* (+ ?e ?e) 10000)
                  (* (+ ?d ?d) 100000))
                               1000000)
            (+ (* 100000 ?z) (* 10000 ?d) (* 1000 ?e) (* 100 ?l) (* 10 ?i) ?e)))

    (test (= (mod (+ ?y ?y 
                  (* (+ ?l ?l) 10)
                  (* (+ ?a ?a) 100)
                  (* (+ ?t ?t) 1000)
                  (* (+ ?e ?e) 10000)
                  (* (+ ?d ?d) 100000))
                               10000000)
            (+ (* 1000000 ?i) (* 100000 ?z) (* 10000 ?d) (* 1000 ?e) (* 100 ?l) (* 10 ?i) ?e)))


    (test (> ?d 0))
    (test (> ?i 0))
    =>
    (printout t "A Solition is:" t)
    (printout t "Y = " ?y t)
    (printout t "E = " ?e t)
    (printout t "L = " ?l t)
    (printout t "I = " ?i t)
    (printout t "A = " ?a t)
    (printout t "T = " ?t t)
    (printout t "D = " ?d t)
    (printout t "Z = " ?z t)
    (printout t t)
    (printout t "   " ?d ?e ?t ?a ?l ?y t)
    (printout t " + " ?d ?e ?t ?a ?l ?y t)
    (printout t "   " "-------------------" t)
    (printout t " ="?i ?z ?d ?e ?l ?i ?e t)
) 
