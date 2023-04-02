**1. Determine the highest normal form of this relation scheme.**
**The relation scheme student Performance (StudentName, CourseNo, EnrollmentNo, Grade) has**  
**the following functional dependencies:**  
**StudentName, courseNo → grade**  
**EnrollNo, courseNo → grade**  
**StudentName →EnrollmentNo**  
**EnrollmentNo →StudentName**    
  
**ans.**  
    **candidate keys are :**StudentName, courseNo and EnrollNo, courseNo  
    **prime attributes :** StudentName, courseNo,EnrollNo  
    The table in BCNF why beacouse there is no multy valued atributes and there no   partial dependencys ,there is no transitive dependencys   
    in this we don`t have any relation like non super key idendifying non prime attribute  

**2.Suppose you are given a relation R= (A, B, C, D, E ) with the following functional**  
**dependencies:{CE →D, D→B, C →A}**  
**a. Find all candidate keys.**  
**b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).**  
**c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a**  
**new relation, decompose and re-compute the keys and the normal forms they satisfy.**  

**ans.**  
   a. $$CE^{+} :{C,E,D,B,A}$$  
      hence candidate key is CE  
   b.it is in 1NF there is a partial dependency C-->A  
   c.To convert 2NF decompose table as  
   R1(B,C,D,E) dependencies:{CE-->D,D-->B} and  
   R2(A,c) dependencies:{c-->A}  
   To convert into 3NF we need to decompose the table as follows:  
    R1(C,E,D) dependencies:{ce-->d} and  
    R2(D,B) dependencies:{D-->B} and  
    R3(CA) dependencies:{C-->A}  
    finally it become into BCNF also.  

**3. You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F):**  
**F={ABC →D, ABD→E,CD→F,CDF →B,BF →D}**  
**a. Find all keys of R based on these functional dependencies.**  
**b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers**
**ans.**  
 a. candidate keys are:ACD,ABC  
    prime attributes are {A,B,C,D}  
    non-prime attributes are: {E,F}  
b.here CD-->F means a part of candidate key uniqly identifying Non-prime attribute F hence the relation not in 2NF there for the relation mustbe not in 3NF and the BCNF  

**4.Write the advantages and disadvantages of normalization**  
**Advantages**  
*Reduce data redundancy  
*Reduce update anomalies  
*Simplify data base design   
*Improve data consistency  
**Disadvantages**  
*performence will reduse  
*Making quarys become defficult  
*It is not that much sutable for evry data  


**5.Determine the decomposition.**  
**Consider the schema R = (S T U V) and the dependencies S → T, T → U, U → V, and V → S.**  
**Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅.**  
**ans.**  
$$S^{+} :S,T,U,V $$  
$$T^{+} :T,U,V,S $$  
$$U^{+} :U,V,S,T $$  
$$V^{+} :V,S,T,U $$  
 All attributes are candidate keys  
 We can perform lossless decomposition of the relation R into R1(S, T, U)    
and R2(U, V). Clearly, R1 ∩ R2 ≠ ∅ because U is the common attribute.  
Further, the decomposed relations are in BCNF.  