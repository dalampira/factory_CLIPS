;Dalampira-Kiprigli Osia 2744
;Papadopoulos Theodoros 2795

;�������������� ��� ���������� ���� ��� �� elearning
;��������� � ������� ��� ������� ��� ��� ������������

(defclass chemical
	(is-a USER)
	(role concrete)
	(multislot colour
		(type SYMBOL)
		(allowed-values clear red white)
		(default clear)
		(create-accessor read-write))
	(multislot specific_gravity
		(type SYMBOL)
		(allowed-values equal_to_1 above_1 below_1)
		(default equal_to_1)
		(create-accessor read-write))
	(multislot radioactivity
		(type SYMBOL)
		(allowed-values no yes)
		(default no)
		(create-accessor read-write))
	(multislot pH-high
		(type INTEGER)
		(range 0 14)
		(create-accessor read-write))
	(multislot pH-low
		(type INTEGER)
		(range 0 14)
		(create-accessor read-write))
	(multislot solubility
		(type SYMBOL)
		(allowed-values soluble insoluble)
		(default soluble)
		(create-accessor read-write))
	(multislot smell
		(type SYMBOL)
		(allowed-values none vinegar choking)
		(default none)
		(create-accessor read-write))
	(multislot hazards
		(type SYMBOL)
		(allowed-values asphyxiation burns_skin explosive highly_toxic_PCBs)
		(create-accessor read-write))
	(multislot spectrometry
		(type SYMBOL)
		(allowed-values none sulphur carbon sodium metal)
		(default none)
		(create-accessor read-write))
	(slot suspect 
		(type SYMBOL) 
		(allowed-symbols yes no)
		(default yes)
		(create-accessor read-write))
)

(defclass acid
	(is-a chemical)
	(role concrete)
	(multislot pH-high
		(type INTEGER)
		(range 0 14)
		(default 6)
		(create-accessor read-write))
	(multislot pH-low
		(type INTEGER)
		(range 0 14)
		(default 0)
		(create-accessor read-write)))

(defclass strong_acid
	(is-a acid)
	(role concrete)
	(multislot pH-high
		(type INTEGER)
		(range 0 14)
		(default 3)
		(create-accessor read-write))
	(multislot hazards
		(type SYMBOL)
		(allowed-values asphyxiation burns_skin explosive highly_toxic_PCBs)
		(default burns_skin)
		(create-accessor read-write)))

(defclass weak_acid
	(is-a acid)
	(role concrete)
	(multislot pH-low
		(type INTEGER)
		(range 0 14)
		(default 3)
		(create-accessor read-write)))

(defclass base
	(is-a chemical)
	(role concrete)
	(multislot pH-high
		(type INTEGER)
		(range 0 14)
		(default 14)
		(create-accessor read-write))
	(multislot pH-low
		(type INTEGER)
		(range 0 14)
		(default 8)
		(create-accessor read-write)))

(defclass strong_base
	(is-a base)
	(role concrete)
	(multislot pH-low
		(type INTEGER)
		(range 0 14)
		(default 11)
		(create-accessor read-write))
	(multislot hazards
		(type SYMBOL)
		(allowed-values asphyxiation burns_skin explosive highly_toxic_PCBs)
		(default burns_skin)
		(create-accessor read-write)))

(defclass weak_base
	(is-a base)
	(role concrete)
	(multislot pH-high
		(type INTEGER)
		(range 0 14)
		(default 11)
		(create-accessor read-write)))

(defclass oil
	(is-a chemical)
	(role concrete)
	(multislot pH-high
		(type INTEGER)
		(range 0 14)
		(default 8)
		(create-accessor read-write))
	(multislot pH-low
		(type INTEGER)
		(range 0 14)
		(default 6)
		(create-accessor read-write))
	(multislot solubility
		(type SYMBOL)
		(allowed-values soluble insoluble)
		(default insoluble)
		(create-accessor read-write))
	(multislot spectrometry
		(type SYMBOL)
		(allowed-values none sulphur carbon sodium metal)
		(default carbon)
		(create-accessor read-write)))

(defclass node
	(is-a USER)
	(role concrete)
	(multislot downstream
		(type INSTANCE)
		(allowed-classes node)
		(create-accessor read-write))
	(slot suspect 
		(type SYMBOL) 
		(allowed-symbols yes no)
		(default no)
		(create-accessor read-write)))

(defclass store
	(is-a node)
	(role concrete)
	(multislot contents
		(type INSTANCE)
		(allowed-classes chemical)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass manhole
	(is-a node)
	(role concrete))

;--------------------------------------------------------------------

(definstances facts

([acetic_acid] of  weak_acid

	(smell vinegar))

([aluminium_hydroxide] of  weak_base

	(colour white)
	(specific_gravity above_1)
	(spectrometry metal))

([carbonic_acid] of  weak_acid

	(spectrometry carbon))

([chromogen_23] of  weak_base

	(colour red)
	(specific_gravity below_1))

([hydrochloric_acid] of  strong_acid

	(hazards asphyxiation burns_skin)
	(smell choking))

([manhole_1] of  manhole

	(downstream [manhole_9]))

([manhole_10] of  manhole

	(downstream [manhole_12]))

([manhole_11] of  manhole

	(downstream [manhole_13]))

([manhole_12] of  manhole

	(downstream [monitoring_station]))

([manhole_13] of  manhole

	(downstream [monitoring_station]))

([manhole_2] of  manhole

	(downstream [manhole_9]))

([manhole_3] of  manhole

	(downstream [manhole_9]))

([manhole_4] of  manhole

	(downstream [manhole_10]))

([manhole_5] of  manhole

	(downstream [manhole_10]))

([manhole_6] of  manhole

	(downstream [manhole_11]))

([manhole_7] of  manhole

	(downstream [manhole_11]))

([manhole_8] of  manhole

	(downstream [manhole_13]))

([manhole_9] of  manhole

	(downstream [manhole_12]))

([monitoring_station] of  node)

([petrol] of  oil

	(hazards explosive)
	(specific_gravity below_1))

([rubidium_hydroxide] of  weak_base

	(radioactivity yes)
	(specific_gravity above_1)
	(spectrometry metal))

([sodium_hydroxide] of  strong_base

	(spectrometry sodium))

([store_1] of  store

	(contents
		[sulphuric_acid]
		[petrol])
	(downstream [manhole_1]))

([store_2] of  store

	(contents
		[hydrochloric_acid]
		[acetic_acid])
	(downstream [manhole_2]))

([store_3] of  store

	(contents
		[rubidium_hydroxide]
		[transformer_oil])
	(downstream [manhole_3]))

([store_4] of  store

	(contents
		[carbonic_acid]
		[acetic_acid]
		[petrol])
	(downstream [manhole_4]))

([store_5] of  store

	(contents
		[chromogen_23]
		[sulphuric_acid]
		[petrol])
	(downstream [manhole_5]))

([store_6] of  store

	(contents
		[aluminium_hydroxide]
		[transformer_oil]
		[carbonic_acid])
	(downstream [manhole_6]))

([store_7] of  store

	(contents
		[hydrochloric_acid]
		[sulphuric_acid])
	(downstream [manhole_7]))

([store_8] of  store

	(contents
		[acetic_acid]
		[carbonic_acid]
		[sodium_hydroxide])
	(downstream [manhole_8]))

([sulphuric_acid] of  strong_acid

	(spectrometry sulphur))

([transformer_oil] of  oil

	(hazards highly_toxic_PCBs))
)


;----------------------------------------------------------------------------------

;�������������� ��� ����������� ask-question ��� ask-number ���� ����� ������������ ��� ��� ������
;� ����� ��������� ��� ������� ��� ������� ����� ���� ������ ��� ������� ��� �������� ���� �� ����� ����
;�� ��� ��������� ������ �����. �� ���� ������� ��� ��� ��� ������� ��������� ���� �� �������� ���� 
;��� �������� �� ����� ��� �����.

(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)


(deffunction ask-number (?question ?min ?max)
   (printout t ?question)
   (bind ?answer (read))
   (while (not (and (numberp ?answer) (>= ?answer ?min) (<= ?answer ?max))) do
      (printout t ?question)
      (printout t " (range " ?min "-" ?max ") ")
      (bind ?answer (read))
   )
  (return ?answer)
)


   
;----------------------------------------------------------------------------------

;����� ����� � ������ ������� ��� ������������ ��� �� ������ �������. �������� ��� ���������� �� ����� mea
;��� ������ ��� ������ ����� ����� ��������� �� ��� �����. ����� ��� ��������� ��� ������� ��� ��������� ��� ���
;������� ��� �� ����������� ���� �������� ��� �������� ��������� ��� �� ������� ��� ������.
(defrule initial-question
	?x <- (initial-fact)
  =>
	(retract ?x)
	(set-strategy mea)
	(printout t "Gia poies metriseis tha dothoyn times? (pH solubility spectrometry colour smell specific_gravity radioactivity) ")
	(bind $?answer (explode$ (readline)))
	(assert (discrepancy $?answer))
	(assert (goal ask-questions))
	
)

;� ������� ��� ����� ���� ��� ��������� ��� �� ������ ��� ������ ��� ��� ��������� ��� ���� �����. ���� ��������,
;��������� ��� ������� ���� �� �������� ���� �������� �� ����������� �� �����.
(defrule ask-basic-questions
	(goal ask-questions)
	(discrepancy $? ?s $?)
	
  =>
	(if  (eq ?s pH)
	    	then
	    		(bind ?pH (ask-number "Poio einai to pH ths molinsis? (0 - 14) " 0 14))
	
	    		(assert (pH ?pH))
	    		
	    )
	   (if (eq ?s solubility)
	       	then
	       		(bind ?solubility (ask-question "Poia einai h dialytothta ths molinsis? (soluble, insoluble) " soluble insoluble))
	       		
	       		(assert (solubility ?solubility))
	   )
	   (if  (eq ?s spectrometry)
	       	then
	       		(bind ?spectrometry(ask-question "Ti deixnei h fasmatoskopia gia th molinsh? (none, sulphur, carbon, sodium, metal) " none sulphur carbon sodium metal))
	       		
	       		(assert (spectrometry ?spectrometry))
	   )
	   (if  (eq ?s colour)
	       	then
	       		(bind ?colour(ask-question "Poio einai to xrwma ths molinsis? (clear red white) " clear red white))
	       		
	       		(assert (colour ?colour))
	   )
	   (if  (eq ?s smell)
	       	then
	       		(bind ?smell(ask-question "Poia einai h osmh ths molinsis? (none vinegar chocking) " none vinegar chocking))
	       		
	       		(assert (smell ?smell))
	   )
	   (if  (eq ?s specific_gravity)
	       	then
	       		(bind ?specific_gravity(ask-number "Poio einai to eidiko baros ths molinsis? (0.9 - 1.1) " 0.9 1.1))
	       		
	       		(assert (specific_gravity ?specific_gravity))
	   )
	   (if   (eq ?s radioactivity)
	       	then
	       		(bind ?radioactivity(ask-question "Einai radienergos h molinsh? (yes, no) " yes no))
	       		
	       		(assert (radioactivity ?radioactivity))
   	   )
   	  
)

;������� ��� �������� ��� ����� �����������, ���� ������� ��� ������� ��� ��������� ��� ���� ��� �����
;��� ���������� ������� ��� ��� ����������� �� �� �������, ���� ���� ���� ��� �� ������ ����� �����
(defrule check-slots-continue
	?x <- (goal ask-questions)
  =>
	(retract ?x)
	(assert (goal initial-suspects))
)

;������� ��� ������� �� ������ ����, ���� ���� ����� ���� pH ��� ����� �������� �� ��� ���� ����
(defrule check-pH-strong-acid
	(goal initial-suspects)
	(object (is-a strong_acid) (name ?x) (suspect yes))
	(pH ?pH)
	(test(>= ?pH 3))
  =>
  	
	(modify-instance ?x (suspect no))
  	
)
;������� ��� ������� �� ������ ����, ���� ���� ����� ���� pH ��� ����� �������� �� ��� ���� ����
(defrule check-pH-weak-acid
	(goal initial-suspects)
	(object (is-a weak_acid) (name ?x) (suspect yes))
	(pH ?pH)
	(or(test(< ?pH 3))(test(>= ?pH 6)))
  =>
	(modify-instance ?x (suspect no))
  	
)

;������� ��� ������� ��� �������� ������, ���� ���� ����� ���� pH ��� ����� �������� �� ��� ���� ����
(defrule check-pH-weak-base
	(goal initial-suspects)
	(object (is-a weak_base) (name ?x) (suspect yes))
	(pH ?pH)
	(or(test(< ?pH 8))(test(>= ?pH 11)))
  =>
  	
  	(modify-instance ?x (suspect no))
)

;������� ��� ������� ��� ������� ������, ���� ���� ����� ���� pH ��� ����� �������� �� ��� ���� ����
(defrule check-pH-strong-base
	(goal initial-suspects)
	(object (is-a strong_base) (name ?x) (suspect yes))
	(pH ?pH)
	(test(< ?pH 11))
  =>
  	
	(modify-instance ?x (suspect no))
  	
  	
)

;������� ��� ������� �� �����, ���� ���� ����� ���� pH ��� ����� �������� �� ��� ���� ����
(defrule check-pH-oil
	(goal initial-suspects)
	(object (is-a oil) (name ?x) (suspect yes))
	(pH ?pH)
	(or(test(< ?pH 6))(test(>= ?pH 8)))
  =>
  	
	(modify-instance ?x (suspect no))

)


;������� ��� ������� ��� ������ ����� ����������� ���� solubility ��� �� ������� ��� ���������� ����
(defrule check-solubility
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (solubility ?y))
	(solubility ?solubility)
	(test (neq ?solubility ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;������� ��� ������� ��� ������ ����� ����������� ���� spectrometry ��� �� ������� ��� ���������� ����
(defrule check-spectrometry
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (spectrometry ?y))
	(spectrometry ?spectrometry)
	(test (neq ?spectrometry ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;������� ��� ������� ��� ������ ����� ����������� ���� colour ��� �� ������� ��� ���������� ����
(defrule check-colour
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (colour ?y))
	(colour ?colour)
	(test (neq ?colour ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;������� ��� ������� ��� ������ ����� ����������� ���� smell ��� �� ������� ��� ���������� ����
(defrule check-smell
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (smell ?y))
	(smell ?smell)
	(test (neq ?smell ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;������� ��� ������� ��� ������ ����� ����������� ���� specific_gravity ��� ������� ��� ���������� ���� ��� ���� ��� �� 1
(defrule check-specific_gravity-equal
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (specific_gravity equal_to_1))
	(specific_gravity ?specific_gravity)
	(test (<> ?specific_gravity 1))
  =>
  	(modify-instance ?x (suspect no))
)

;������� ��� ������� ��� ������ ����� ����������� ���� specific_gravity ��� ������� ��� ���������� ���� ��� ���� < 1
(defrule check-specific_gravity-below
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (specific_gravity below_1))
	(specific_gravity ?specific_gravity)
	(test (>= ?specific_gravity 1))
  =>
  	(modify-instance ?x (suspect no))
)

;������� ��� ������� ��� ������ ����� ����������� ���� specific_gravity ��� ������� ��� ���������� ���� ��� ���� > 1
(defrule check-specific_gravity-above
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (specific_gravity above_1))
	(specific_gravity ?specific_gravity)
	(test (<= ?specific_gravity 1))
  =>
  	(modify-instance ?x (suspect no))
)

;������� ��� ������� ��� ������ ����� ����������� ���� radioactivity ��� ������� ��� ���������� ����
(defrule check-radioactivity
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (radioactivity ?y))
	(radioactivity ?radioactivity)
	(test (neq ?radioactivity ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;���� ���������� ��� ������ ��� ����� �����, ��������� �� �������(goal initial-suspects) ��� ��������� �� ������� 
;��� �� ����������� ���� ���������� ������� ��� ������� ��� �� ������ ������
(defrule make-suspects-first
	?x <- (goal initial-suspects)
  =>
	(retract ?x)
	(assert (goal make-suspects))
)

;������������ ��� �������� ��� ��������� �� ����� ������
(defrule store-suspects
	(goal make-suspects)
	(object (is-a chemical) (name ?c) (suspect yes))
	(object (is-a node) (name ?c1) (contents $? ?c $?) (suspect no))
  =>
	(modify-instance ?c1 (suspect yes))
)

;������������ �� ������� ��� ���������� �� ����� ������� � ��������
(defrule make-suspects
	(goal make-suspects)
	(object (is-a node) (name ?c) (suspect yes) (downstream $? ?c1 $?))
	(object (is-a node) (name ?c1)(suspect no))
  =>
	(modify-instance ?c1 (suspect yes))	
)

;����������� ���������� �������� ��� ���������� �� ��� ���������� ���� ��� ������������
;���������� ������� ��� ���������� ��� ���������� �� ���� ����
(defrule make-suspects-continue
	?x <- (goal make-suspects)
  =>
	(retract ?x)
	(assert (goal exonerate-components))
	(assert (goal exonerate-components-station))

)

;��������� ��� �������� ��� ���������� �� ������� ��� ����� ���� ��� ������ ������� ��� ��� ��� ������� �� ����� ������
(defrule exonerate-components-stores
	(goal exonerate-components)
	(object (is-a store) (name ?c1)(suspect yes) (downstream $? ?c2 $?))
	(object (is-a node) (name ?c2) (suspect no))

  =>
	(modify-instance ?c1 (suspect no))

)

;��������� ������� ��� ���������� �� ���� ������� ��� ��� ��� ������� ���� ��� ������ �� ����� �����
(defrule exonerate-components-manholes
	(goal exonerate-components)
	(object (is-a node) (name ?c1)(suspect yes) (downstream $? ?c2 $?))
	(object (is-a node) (name ?c2) (suspect no))
  =>
	(modify-instance ?c1 (suspect no))
)


;������ ��������� �������� � ������� ������� ��� ������� �� �� ���������� ���������.
;���� � ������� ������� ��������� �� ��� ������� ��� ����� ��� �� ��� �����, ������ �� ������ �� ���
;��� �� ���� ��� �� ��� ����������� ��� �������, ���� � ����� ������ �� ������� �������.
(defrule exonerate-components-station-special
	?x <-(goal exonerate-components-station)
	(object (is-a node) (name [monitoring_station]) (suspect yes) )
	
	(object (is-a node) (name ?s1) (suspect yes)(downstream $? [monitoring_station] $?))
	(object (is-a node) (name ?s2) (suspect yes)(downstream $? [monitoring_station] $?))
	(test (neq ?s1 ?s2))
  =>
  	(printout t "Yparxei molynsh sto freatio "(instance-name-to-symbol ?s1))
	(bind ?answer (ask-question " ?(yes/no) " yes no))
	(if (eq ?answer yes)
		then
		    (modify-instance ?s2 (suspect no))
	)
	(if (eq ?answer no)
		then
		    (modify-instance ?s1 (suspect no))
	)
	(retract ?x)	
)

;�������� �� ��� �������� ��������� �������� ��� ����, ���� ��� ����� ������� ���������� ��� ���� ����� 
;��� ������ ������ ��� ������ �� ��� ��� ��� ����� ����� ���������� � �������. � ����� ��� ������� ����� �� ����������
;����� ������ � �������� ��������� ����� ��� ������������� ��� ������ ���������� �� ���������� ���� ����� �����
;�� ��������� �� ��������� '�������' ���� �� ����� ��� ���������. ��' ���� ��� ������� ������ �� ��������� �����
(defrule exonerate-components-special
	(goal exonerate-components)
	(object (is-a node) (name ?c) (suspect yes) )
	
	(object (is-a node) (name ?s1) (suspect yes)(downstream $? ?c $?))
	(object (is-a node) (name ?s2) (suspect yes)(downstream $? ?c $?))
	(test (neq ?s1 ?s2))
  =>
  	(printout t "Yparxei molynsh sto freatio "(instance-name-to-symbol ?s1))
	(bind ?answer (ask-question " ?(yes/no) " yes no))
	(if (eq ?answer yes)
		then
		    (modify-instance ?s2 (suspect no))
	)
	(if (eq ?answer no)
		then
		    (modify-instance ?s1 (suspect no))
	)	
)

;��������������� ��� �� ����������� ���� �� ����������� �� ������ ��� ���������� ��� ������
(defrule exonerate-components-continue
	?x <- (goal exonerate-components)
  =>
	(retract ?x)
	(assert (goal announce-result))
)


;��������� �� ������������ ���� �����
(defrule print-result
   	(goal announce-result)
	(object (is-a chemical) (name ?x) (suspect yes))
	(object (is-a store) (name ?y) (suspect yes))
  =>
  
   (printout t "To xhmiko poy prokalese th molynsh pithanon na einai to " (instance-name-to-symbol ?x) crlf)
   
   ( if (neq(send ?x get-hazards) nil)
   	then
   	   (printout t "Pithanoi kindynoi: " (send ?x get-hazards ) crlf)
   )
   
   (printout t "H phgh ths molynshs einai h apothiki " (instance-name-to-symbol ?y) crlf)
)
