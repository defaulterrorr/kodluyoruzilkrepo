# Proje 1

[22,27,16,2,18,6]

## Yukarı verilen dizinin Insertion sort türüne göre aşamaları;

Adım 1: [22, 27, 16, 2, 18, 6] Dizinin ilk hali
Adım 2: [22, 27, 16, 2, 18, 6] 27, 22'den büyük olduğu için yer değiştirmez
Adım 3: [16, 22, 27, 2, 18, 6] 16, 27'den küçük olduğu için 27'yi bir sağa kaydırır, sonra 16'yı 22'nin yanına yerleştirir)
Adım 4: [2, 16, 22, 27, 18, 6] 2, 27'den küçük, 27'yi bir sağa kaydırsak, sonra 2'yi 16'nın yanına, ardından 22'nin yanına yerleştiririz
Adım 5: [2, 16, 18, 22, 27, 6] 18, 27'den küçük olduğu için 27'yi bir sağa kaydırırız, sonra 18'i 22'nin yanına, ardından 16'nın yanına kaydırırız.
Adım 6: [2, 6, 16, 18, 22, 27] 6, 27'den küçük olduğu için 27'yi bir sağa kaydırır, sonra 6'yı 22'nin yanına, ardından 18'in yanına, 16'nın yanına, ve 2'nin yanına yerleştiririz. Altı adımda tamamlanmış olur.

## Big-O gösterimini yazınız.

Big-O gösterimi; n*(n+1)/2 den dolayı, üst kuvvet dikkate alınırsa O(n^2)'dir.


## Time Complexity: Dizi sıralandıktan sonra 18 sayısı aşağıdaki case'lerden hangisinin kapsamına girer? Yazınız 
Dizi sıralandıktan sonra [2, 6, 16, 18, 22, 27] şeklinde olacaktır. 18 sayısı, altı elemanlı dizinin dördüncü sırasında olduğu için Average case olarak değerlendirilir.


## [7,3,5,8,2,9,4,15,6] dizisinin Selection Sort'a göre ilk 4 adımını yazınız.
Selection Sort'a göre ilk dört adımı;
Başlangıçta dizi: [7, 3, 5, 8, 2, 9, 4, 15, 6]
En küçük elemanı seçer ve ilk elemanla (0. index) yer değiştirir: [2, 3, 5, 8, 7, 9, 4, 15, 6]
İkinci elemandan başlayarak en küçük elemanı seçer ve ikinci elemanla(1. index) yer değiştirir: [2, 3, 5, 8, 7, 9, 4, 15, 6]
Üçüncü elemandan başlayarak en küçük elemanı seçer ve üçüncü elemanla(2. index) yer değiştirir: [2, 3, 4, 8, 7, 9, 5, 15, 6]
Dördüncü elemandan başlayarak en küçük elemanı seçer ve dördüncü elemanla(3. index) yer değiştirir: [2, 3, 4, 5, 7, 9, 8, 15, 6]
Dizinin ilk dört elemanı sıralanmış olur.

# Proje 2

[16,21,11,8,12,22] -> Merge Sort

## Yukarıdaki dizinin sort türüne göre aşamalarını yazınız.

Dizi sürekli bölünerek daha ufak diziler elde edilir ve bunlar kendi içlerinde sıralanarak birleştirilir.

                   [16, 21, 11, 8, 12, 22

         [16, 21, 11]                    [8, 12, 22]

    [16]         [21, 11]           [8]        [12, 22]

               [21]   [11]                [12]   [22]
Bu şekilde tek tek bölündükten sonra kendi aralarında birleştirilerek dizinin tamamı sıralanmış olur.

              [21]   [11]                [12]   [22]
      
             [16]    [11, 21]           [8]    [12, 22]
         
             [16, 11, 21]                [8, 12, 22]
        
                     [8, 11, 12, 16, 21, 22]


## Big-O gösterimini yazınız.
Merge sort, O(nlogn) yani Lineer logaritmik zamanı olan bir algoritmadır.

# Proje 3 

## [7, 5, 1, 8, 3, 6, 0, 9, 4, 2] dizisinin Binary-Search-Tree aşamalarını yazınız.

Root 7 olarak alırsak;
5, 7'den küçük olduğu için 7'nin soluna yerleştirilir.
1, 7'den ve 5'ten küçük olduğu için 5'in soluna yerleştirilir.
8, 7'den büyük olduğu için 7'nin sağına yerleştirilir.
3, 7'den küçük ve 5'ten büyük olduğu için 1'in sağına yerleştirilir.
6, 7'den küçük ve 5'ten büyük olduğu için 5'in sağına yerleştirilir.
0, 7'den, 5'ten ve 1'den küçük olduğu için 1'in soluna yerleştirilir.
9, 7'den ve 8'den büyük olduğu için 8'in sağına yerleştirilir.
4, 7'den ve 5'ten küçük, 1'den ve 3'ten büyük olduğu için 3'ün sağına yerleştirilir.
2, 7'den ve 5'ten küçük, 1'den büyük ve 3'ten küçük olduğu için 3'ün soluna yerleştirilir.
Ağaç yapısı oluşmuş olur.

        7
       / \
      5   8
     / \   \
    1   6   9
   / \
  0  3
    / \
   2  4

