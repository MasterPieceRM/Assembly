SIMPLE.ASM:

Acest algoritm de criptare presupune shiftarea la dreapta in cadrul alfabetului a 
fiecarui caracter de un anumit numar de ori. 

De exemplu, textul "ANABANANA" se transforma in "BOBCBOBOB" cand pasul este 1.

Astfel, o criptare cu pas 26 nu modifica litera intrucat alfabetul englez are 26 de caractere.

Pentru acest task, va trebui să implementați în fișierul `simple.asm` funcția `simple()`
care criptează un string în clar folosind metoda descrisă mai sus. 

Antetul funcției este:

```
void simple(int n, char* plain, char* enc_string, int step);
```

Semnificatia argumentelor este:
- **n** dimensiunea textului
- **plain** string-ul care trebuie criptat
- **enc_string** adresa la care se va scrie textul criptat
- **step** cu cat se shifteaza fiecare caracter

Restrictii:
- se vor folosi toate **majusculele** alfabetului englez
- shiftarea se realizeaza **strict** in cadrul alfabetului

RUN_PROCS.ASM + SORT_PROCS.ASM:

Prin intermediul acestui task se doreste aprofundarea lucrului cu structuri.

Se da structura simplificata a unui proces:

```c
    struct proc{
        short pid;
        char prio;
        short time;
    };
```

---

## Exercitiul 1

Pentru aceasta parte a task-ului aveti de implementat functia `sort_procs()`
in fisierul *sort-procs.asm* care va simula sortarea tuturor proceselor active in momentul curent.

Pentru a intelege mai bine cum functioneaza un proces, vom explica mai jos ce inseamna fiecare field al structurii `proc`:

- Field-ul `pid` reprezinta id-ul unui proces care este prezent in sistem, fie el activ sau inactiv la momentul curent, acest id este unic fiecarui proces
- Field-ul `prio` reprezinta prioritatea pe care o are un proces atunci cand acesta ruleaza pe procesor. Fiecare proces are o astfel de prioritate, de la 1 la 5, 1 reprezentand prioritate maxima de rulare, iar 5 reprezentand prioritate minima de rulare. In functie de aceasta prioritate, procesele ajung sa ruleze mai devreme sau mai tarziu pe procesor
- Field-ul `time` reprezinta cuanta de timp acordata fiecarui proces in parte de a rula pe procesor. Desi veti intalni valori destul de mari in acest field pentru testare, in realitate nu exista cuante atat de mari de rulare, deoarece ar deveni unfair pentru restul proceselor sa astepte atat timp dupa un altul

Pentru a sorta procesele, stabilim urmatoarele reguli:

- Procesele trebuie sa apara in ordine crescatoare procesele in functie de prioritate
- Pentru procesele cu aceeasi prioritate, acestea se vor ordona crescator in functie de cuanta de timp
- Pentru procese cu aceeasi prioritate si cu aceeasi cuanta de timp, acestea vor fi ordonate crescator dupa id

Sortarea se va face **in place**, adica vectorul `procs` prezentat mai jos va trebui, in urma apelului functiei, sa fie sortat. Antetul functiei este:

```
void sort_procs(struct proc *procs, int len);
```

Semnificatia argumentelor este:

- **procs** adresa de inceput a vectorului de procese
- **len** numarul de procese aflate in sistem

**Atentie!** Nu puteti folosi functii externe pentru a sorta vectorul.

---

## Exercitiul 2

In continuarea exercitiului 1, acum trebuie sa implementati functia `run_procs()` in
fisierul *run_procs.asm* care va calcula intr-un mod simplificat timpul mediu de rulare pentru fiecare prioritate, adica va trebui sa calculati suma cuantelor de timp pentru o prioritate si apoi sa o impartiti la numarul de procese care au acea prioritate.

Pentru acest task va trebui sa declarati o structura `avg`, care va stoca catul impartirii sumei cuantelor de timp la numarul de procese, iar `remain` va stoca restul acestei impartiri:

```
    struct avg{
        short quo;
        short remain;
    };
```

Va trebui sa puneti valorile obtinute in vectorul `avg_out` prezentat mai jos, pe prima pozitie aflandu-se rezultatul pentru prioritatea 1, iar pe ultima rezultatul pentru prioritatea 5. Antetul functiei este:

```
void run_procs(struct proc* procs, int len, struct avg *avg_out);
```

Semnificatia argumentelor este:

- **procs** adresa de inceput a vectorului de procese
- **len** numarul de procese aflate in sistem
- **avg_out** adresa de inceput a vectorului de structuri `avg`

**Se garanteaza ca toate valorile raman in limitele tipurilor de date date in structura, adica `quo` si `remain` nu vor fi numere mai mari de 16 biti.**

## **Observatie**

Pentru exercitiul 2 se va folosi acelasi vector folosit si la exercitiul 1. Daca anumite valori se modifica in urma exercitiului 1, atunci exercitiul 2 nu va putea fi rezolvat corect. Exercitiile sunt independente totusi, puteti alege sa nu faceti primul exercitiu, dar veti primi doar jumatate din punctajul aferent acestui task.

---

CHECKERS.ASM:

Vrem sa simulam jocul de checkers (dame).

Avem o matrice de 8x8 ce reprezinta suprafata de joc.

Dandu-se pozitie unei dame pe suprafata de joc, dorim sa calculam noi pozitii pe care poate ajunge aceasta.

Argumentele primite sunt:

`x - linia pe care se afla piesa a carei pozitii vrem sa o calculam`

`y - coloana pe care se afla piesa a carei pozitii vrem sa o calculam`

`table - tabla de joc unde se vor pune pozitiile pe care poate ajunge piesa de joc`



# ATENTIE:

Nu vor exista coliziuni intre piesele de joc. Presupunem ca pe tabla de joc se afla o singura piesa.

Piesele nu pot sa iasa din suprafata de joc.


BONUS.ASM:

Dorim sa optimizam reprezentarea suprafetei de joc de la Task 4 astfel incat sa ocupam mai putina memorie si calculele pozitiilor sa se faca mai rapid.

O posibila optimizare este reprezentata de notiunea de "Bitboard". "Bitboard" reprezinta o structura de date binara in care fiecare bit reprezinta prezenta sau absenta unei piese pe o anumita pozitie a tablei de joc. De obicei, in C, pentru a reprezenta un bitboard, se foloseste o variabila de tip 'unsigned long long'.
'unsigned long long' este un tip de date ce contine 64 biti (8 octeti). O table de joc de dimensiunea 8x8 poate fi reprezentata intuitiv cu o singura variabila de acest tip, grupand, la nivel logic, cate 8 biti pentru fiecare linie din suprafata. Din pacate insa, noi nu avem acces la registri pe 64 biti in cadrul cursului, astfel incat trebuie folositi 2 registri pentru reprezentarea suprafetei de joc.

`x - coloana pe care se afla piesa a carei pozitii vrem sa o calculam`

`y - linia pe care se afla piesa a carei pozitii vrem sa o calculam`

`board - doua numere intregi ce reprezinta suprafata de joc. Primul numar reprezinta partea superioara a suprafetei, pe cand al doilea numar reprezinta partea inferioara.`


