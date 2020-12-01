;Dalampira-Kiprigli Osia 2744
;Papadopoulos Theodoros 2795

;Χρησιμοποιούμε την ενδεικτική λύση από το elearning
;Ακολουθεί ο ορισμός των κλάσεων και των στιγμιοτύπων

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

;Χρησιμοποιούμε τις συναρτήσεις ask-question και ask-number όπως αυτές επεξηγήθηκαν και στο μάθημα
;Η πρώτη εμφάνίζει την ερώτηση που γράψαμε εμείς στον χρήστη και ελέγχει την απάντηση ώστε να είναι μέσα
;σε ένα επιθυμητό σύνολο τιμών. Το ίδιο γίνεται και για την επόμενη συνάρτηση αλλά με αριθμούς όπου 
;και ορίζουμε το εύρος των τιμών.

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

;Αυτός είναι ο πρώτος κανόνας που πυροδοτείται από το αρχικό γεγονός. Ορίζουμε την στρατηγική να είναι mea
;και ρωτάμε τον χρήστη ποιες τιμές μετρήσεων θα μας δώσει. Αυτές τις εισάγουμε σαν γεγονός και εισάγουμε και νέο
;γεγονός που θα πυροδοτήσει στην συνέχεια τις επόμενες ερωτήσεις που θα κάνουμε στο χρήστη.
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

;Ο κανόνας που αφορά όλες τις ερωτήσεις που θα γίνουν στο χρήστη για τις μετρήσεις που έχει δώσει. Κάθε απάντηση,
;εισάγεται σαν γεγονός ώστε να μπορούμε στην συνέχεια να αναφερθούμε σε αυτήν.
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

;Κανόνας που ρυθμίζει την σειρά πυροδότησης, αφού αφαιρεί ένα γεγονός και προσθέτει ένα άλλο που αφορά
;την αθωοποίηση χημικών που δεν ταιριάζουμε με τα δοθέντα, αφού στην αρχή όλα τα χημικά είναι ένοχα
(defrule check-slots-continue
	?x <- (goal ask-questions)
  =>
	(retract ?x)
	(assert (goal initial-suspects))
)

;Κανόνας που αθωώνει τα ισχυρά οξέα, όταν έχει δοθεί τιμή pH που είναι ασύμφωνη με την δική τους
(defrule check-pH-strong-acid
	(goal initial-suspects)
	(object (is-a strong_acid) (name ?x) (suspect yes))
	(pH ?pH)
	(test(>= ?pH 3))
  =>
  	
	(modify-instance ?x (suspect no))
  	
)
;Κανόνας που αθωώνει τα ασθενή οξέα, όταν έχει δοθεί τιμή pH που είναι ασύμφωνη με την δική τους
(defrule check-pH-weak-acid
	(goal initial-suspects)
	(object (is-a weak_acid) (name ?x) (suspect yes))
	(pH ?pH)
	(or(test(< ?pH 3))(test(>= ?pH 6)))
  =>
	(modify-instance ?x (suspect no))
  	
)

;Κανόνας που αθωώνει τις ασθενείς βάσεις, όταν έχει δοθεί τιμή pH που είναι ασύμφωνη με την δική τους
(defrule check-pH-weak-base
	(goal initial-suspects)
	(object (is-a weak_base) (name ?x) (suspect yes))
	(pH ?pH)
	(or(test(< ?pH 8))(test(>= ?pH 11)))
  =>
  	
  	(modify-instance ?x (suspect no))
)

;Κανόνας που αθωώνει τις ισχυρές βάσεις, όταν έχει δοθεί τιμή pH που είναι ασύμφωνη με την δική τους
(defrule check-pH-strong-base
	(goal initial-suspects)
	(object (is-a strong_base) (name ?x) (suspect yes))
	(pH ?pH)
	(test(< ?pH 11))
  =>
  	
	(modify-instance ?x (suspect no))
  	
  	
)

;Κανόνας που αθωώνει τα έλαια, όταν έχει δοθεί τιμή pH που είναι ασύμφωνη με την δική τους
(defrule check-pH-oil
	(goal initial-suspects)
	(object (is-a oil) (name ?x) (suspect yes))
	(pH ?pH)
	(or(test(< ?pH 6))(test(>= ?pH 8)))
  =>
  	
	(modify-instance ?x (suspect no))

)


;Κανόνας που αθωώνει όσα χημικά έχουν διαφορετική τιμή solubility από το γεγονός που εισαγάγαμε πριν
(defrule check-solubility
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (solubility ?y))
	(solubility ?solubility)
	(test (neq ?solubility ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;Κανόνας που αθωώνει όσα χημικά έχουν διαφορετική τιμή spectrometry από το γεγονός που εισαγάγαμε πριν
(defrule check-spectrometry
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (spectrometry ?y))
	(spectrometry ?spectrometry)
	(test (neq ?spectrometry ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;Κανόνας που αθωώνει όσα χημικά έχουν διαφορετική τιμή colour από το γεγονός που εισαγάγαμε πριν
(defrule check-colour
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (colour ?y))
	(colour ?colour)
	(test (neq ?colour ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;Κανόνας που αθωώνει όσα χημικά έχουν διαφορετική τιμή smell από το γεγονός που εισαγάγαμε πριν
(defrule check-smell
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (smell ?y))
	(smell ?smell)
	(test (neq ?smell ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;Κανόνας που αθωώνει όσα χημικά έχουν διαφορετική τιμή specific_gravity από γεγονός που εισαγάγαμε πριν για τιμή ίση με 1
(defrule check-specific_gravity-equal
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (specific_gravity equal_to_1))
	(specific_gravity ?specific_gravity)
	(test (<> ?specific_gravity 1))
  =>
  	(modify-instance ?x (suspect no))
)

;Κανόνας που αθωώνει όσα χημικά έχουν διαφορετική τιμή specific_gravity από γεγονός που εισαγάγαμε πριν για τιμή < 1
(defrule check-specific_gravity-below
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (specific_gravity below_1))
	(specific_gravity ?specific_gravity)
	(test (>= ?specific_gravity 1))
  =>
  	(modify-instance ?x (suspect no))
)

;Κανόνας που αθωώνει όσα χημικά έχουν διαφορετική τιμή specific_gravity από γεγονός που εισαγάγαμε πριν για τιμή > 1
(defrule check-specific_gravity-above
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (specific_gravity above_1))
	(specific_gravity ?specific_gravity)
	(test (<= ?specific_gravity 1))
  =>
  	(modify-instance ?x (suspect no))
)

;Κανόνας που αθωώνει όσα χημικά έχουν διαφορετική τιμή radioactivity από γεγονός που εισαγάγαμε πριν
(defrule check-radioactivity
	(goal initial-suspects)
	(object (is-a chemical) (name ?x) (suspect yes) (radioactivity ?y))
	(radioactivity ?radioactivity)
	(test (neq ?radioactivity ?y))
  =>
  	(modify-instance ?x (suspect no))
)

;Αφού καταλήξαμε στα χημικά που είναι ένοχα, αφαιρούμε το γεγονός(goal initial-suspects) και εισάγουμε το επόμενο 
;που θα πυροδοτήσει τους υπόλοιπους κόμβους στο γράφημα που θα γίνουν ένοχοι
(defrule make-suspects-first
	?x <- (goal initial-suspects)
  =>
	(retract ?x)
	(assert (goal make-suspects))
)

;Ενοχοποιούμε τις αποθήκες που φυλάσσουν τα ένοχα χημικά
(defrule store-suspects
	(goal make-suspects)
	(object (is-a chemical) (name ?c) (suspect yes))
	(object (is-a node) (name ?c1) (contents $? ?c $?) (suspect no))
  =>
	(modify-instance ?c1 (suspect yes))
)

;Ενοχοποιούμε τα φρεάτια που συνδέονται με ένοχα φρεάτια ή αποθήκες
(defrule make-suspects
	(goal make-suspects)
	(object (is-a node) (name ?c) (suspect yes) (downstream $? ?c1 $?))
	(object (is-a node) (name ?c1)(suspect no))
  =>
	(modify-instance ?c1 (suspect yes))	
)

;Συνεχίζουμε εισάγοντας γεγονότα που συνεχίζουν με την αντίστροφη φορά από προηγουμένως
;αθωόνοντας κόμβους του γραφήματος που συνδέονται με αθώα μέλη
(defrule make-suspects-continue
	?x <- (goal make-suspects)
  =>
	(retract ?x)
	(assert (goal exonerate-components))
	(assert (goal exonerate-components-station))

)

;Αθωώνουμε τις αποθήκες που συνδέονται με φρεάτια που έγινα αθώα από άλλους κανόνες και άρα δεν μπορούν να είναι ένοχες
(defrule exonerate-components-stores
	(goal exonerate-components)
	(object (is-a store) (name ?c1)(suspect yes) (downstream $? ?c2 $?))
	(object (is-a node) (name ?c2) (suspect no))

  =>
	(modify-instance ?c1 (suspect no))

)

;Αθωώνουμε φρεάτια που συνδέονται με αθώα φρεάτια και άρα δεν μπορούν ούτε και εκείνα να είναι ένοχα
(defrule exonerate-components-manholes
	(goal exonerate-components)
	(object (is-a node) (name ?c1)(suspect yes) (downstream $? ?c2 $?))
	(object (is-a node) (name ?c2) (suspect no))
  =>
	(modify-instance ?c1 (suspect no))
)


;Ειδική περίπτωση αποτελεί ο σταθμός ελέγχου και θέλουμε να το εξετάσουμε ξεχωριστά.
;Όταν ο σταθμός ελέγχου συνδέεται με δύο φρεάτια που είναι και τα δύο ένοχα, ρωτάμε το χρήστη να μας
;πει σε ποιο από τα δύο εντοπίζουμε την μόλυνση, ώστε ο άλλος κλάδος να αθωωθεί τελείως.
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

;Παρόμοια με την παραπάνω περίπτωση αποτελεί και αυτή, όπου δύο ένοχα φρεάτια συνδέονται στο ίδιο ένοχο 
;και επίσης ρωτάμε τον χρήστη να μας πει από ποιον κλάδο προέρχεται η μόλυνση. Ο λόγος που κάνουμε αυτόν το διαχωρισμό
;είναι επειδή η παραπάνω περίπτωση είναι πιο εξειδικευμένη και μπορεί κατευθείαν να αποκλείσει έναν δρόμο χωρίς
;να ασχοληθεί με επιμέρους 'διχάλες' όπως σε αυτήν την περίπτωση. Γι' αύτό και θέλουμε εκείνη να εξεταστεί πρώτη
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

;Χρησιμοποιείται για να καθορίσουμε πότε θα εμφανίζουμε το μήνυμα της ΄διάγνωσης στο χρήστη
(defrule exonerate-components-continue
	?x <- (goal exonerate-components)
  =>
	(retract ?x)
	(assert (goal announce-result))
)


;Τυπώνουμε τα αποτελέσματα στην οθόνη
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
