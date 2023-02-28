# SQL labor

## Felkészülés
A laborra felkészüléshez olvassa el a segédletet és próbáljon meg válaszolni az ellenőrző kérdésekre.

## Útmutató
Ebbe a könyvtárba készítse el az SQL labor megoldásait. A megoldásokat pull request formájában adja be a határidőre úgy, hogy reviewerként hozzárendeli a laborvezetőjét.
Figyeljen rá a labor elején, hogy hozzon létre egy új git branchet, mert a pull request létrehozásánal azt tudja majd a master ággal összehasonlítani.

Amennyiben a labor szöveges válaszokat kér kérdésekre, azokat a válaszokat ide írja be!
Mivel sok SQL lekérdezést kell készíteni, a megoldásba a feladatok elé írja be kommentárként, hogy mi a feladat. Így később könnyebben vissza tudja majd nézni, hogy mire milyen megoldásokat írt.

## 1. Tranzakciók vizsgálata

Ezeket a feladatokat közösen végezzék el, amennyiben járulékos magyarázat szükséges, azt a gyakorlatvezető ismerteti.

1. Futassa le a `konyvtar.sql` scriptet, ezáltal egy egyszerű könyvtári mintaadatbázis jött létre az adatbázisában! Tekintse át táblaszerkezetet, valamint a táblákban található adatokat!
2. MySQL Workbench segítségével nyisson két kapcsolatot. Ez a két kapcsolat fogja demonstrálni a két párhuzamos felhasználói adatmanipulációt.

**Elveszett módosítás vizsgálata** : Két párhuzamos tranzakció módosítja az 1-es felhasználó által kivihető darabszámot. Az egyik csökkenti hárommal, a másik növeli eggyel. Hajtsa végre meg az alábbi ütemezést! Mit tapasztalt és miért?

| **Felhasználó 1** | **Felhasználó 2** |
| --- | --- |
| `start transaction;` | |
| --- | --- |
| | `start transaction;` |
| `select * from tag where id=1;` | |
| | `select * from tag where id=1;` |
| `update tag set MaxKolcsonzes=2 where id=1;` | |
| | `update tag set MaxKolcsonzes=6 where id=1;` |
| `commit;` | |
| | `commit;` |
| `select * from tag where id=1;` | |

1. Adjunk megoldást az előző problémára! Megoldás lehet, hogy a rekordokat már kiolvasáskor zárolni kell, hogy más ne férhessen hozzá! Erre mutat példát az alábbi ütemezés.

| **Felhasználó 1** | **Felhasználó 2** |
| --- | --- |
| `start transaction;` | |
| --- | --- |
| | `start transaction;` |
| `select * from tag where id=2 for update;` | |
| | `select * from tag where id=2 for update;` |
| `update tag set MaxKolcsonzes=2 where id=2;` | **Várakozik** |
| `commit;` | **Várakozik** |
| | `update tag set MaxKolcsonzes=3 where id=2;` |
| | `commit;` |
| `select * from tag where id=1;` | |

## 2.Lekérdezések készítése

### 2.1. Közösen megoldandó feladatok

1. Listázzuk ki a könyvtár tagjait!

2. Listázza ki, hogy az egyes tagok eddig milyen könyveket kölcsönöztek ki!

3. Listázza ki, hogy az egyes tagok milyen szerzők könyveit kölcsönözték ki!

4. Az egyes tagok hányszor kölcsönöztek eddig!

5. Akik eddig legalább 3-szor kölcsönöztek

6. Hagyjuk meg csak azokat, akiknek a tagságija érvényes!

7. Az egyes tagok mikor kölcsönöztek utoljára!

8. Szerzőkként, hogy összesen hány kölcsönzésük van?

9. Listázza ki azon tagok adatait akiknek a tagsága lejárt!

10. Listázza ki azon tagokat akiknek már lejárt a kölcsönzése, de még nem hozta vissza a kikölcsönzött könyvet!

11. Listázza ki azokat a szerzőket, akiknek még egyetlen könyvét sem kölcsönözték ki, de van könyvük a könyvtárban!

12. Kik írták a legdrágább könyvet?

13. Listázza ki azokat a könyveket, melyek átlagban legalább 30 napig voltak kikölcsönözve!

    a. Az átlagszámítás során csak a visszahozott kölcsönzéseket vegye figyelembe!

    b. Az átlagszámítás során a vissza nem hozott könyveket az aktuális dátummal vegye figyelembe!

14. Listázza ki azokat a tagokat akiknek a tagsága 100 napon belül lejár és van náluk kikölcsönzött könyv!

15. Listázza ki a kikölcsönözhető könyveket (azaz épp bent vannak a könyvtárban)!

## 2.2. Önálló feladatok

1. Listázza ki azokat könyveket, melyeket még nem kölcsönöztek ki soha!

2. Melyik a legrégebbi könyv?

3. Összesen hány napig volt kikölcsönözve a legrégebbi könyv?

4. Melyik tag a leglustább, azaz ő késett a legtöbbet egy könyv visszahozatalával?

5. Listázza ki azokat a könyveket, melyek összesen legalább 40 napig ki voltak kölcsönözve!

6. Listázza ki, hogy az egyes könyveknek hány szerzője van!

7. Listázza ki az könyvek szerzőinek a számát nemzetiségek szerint!