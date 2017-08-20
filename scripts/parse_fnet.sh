#!/usr/bin/env bash
# please download these dependencies and adjust their locations accordingly
#SRL_MODEL=models/srl-ICCG16-eng.model
SRL_MODEL=models/srl-FN17.model
FN_DATA=framenet/fndata-1.7/

RERANKER="-aibeam 7 -acbeam 3 -alfa 0.75 -reranker -externalNNs -globalFeats"

# java 1.8+ is required
JAVA=java 

# ID FORM LEMMA PLEMMA POS PPOS FEAT PFEAT HEAD PHEAD DEPREL PDEPREL FILLPRED PRED APREDs
# note: the file to be parsed, $1, needs to be a syntactically preprocessed input file in the CoNLL-2009 format 
$JAVA -Xmx60g -Dfile.encoding=UTF-8 -cp target/classes/ se.lth.cs.srl.Parse fnet $1 $SRL_MODEL $RERANKER -framenet $FN_DATA -printXML out.xml
# note: make sure that the compiled class files (run "mvn compile") are located in target/classes/ or adjust class path to include precompiled .jar
