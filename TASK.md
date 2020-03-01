Task
====

Chcielibysmy, abys poprzez terraforma i terragrunat stworzyl serwer na aws (we free tier) i dwa  buckety s3.

Na tym serwerze aby ansiblem skonfigurowac nginx, let's encrypt, gunicorn, postgres, redis (jak najprostsza konfiguracja, najlepiej rola per dana usluge).

Domene mozesz swoja uzyc lub mozemy jakas subdomene przygotowac.

Na tak skonfigurowanym serwerze trzeba wdrozyc prosta aplikacje django, ktora miala by realizowac upload plikow na s3 (poprzez s3 boto storage). Aplkacja lokalnie by mozna developowac uzywajac dockera.

Drugi bucket by sluzyl do trzymania plikow statycznych (manage.py collectstatic by tam pliki uploadowal).

Apka ma sluzyc do uploadowania przez userow zdjec swoich zwierzakow. Uprosil bym ja do maximum, nawet nie trzeba by sie logowac, ale oczywiscie jak masz ochote i czas, to mozesz cos tam bardziej zaawansowanego dorobic.

Idea jest taka, ze terraformem to sie tworzy, uruchamasz potem skrypty ansibla i strona dziala.

Po demo mozesz zrobic terragrunt destroy i wszystkie zasoby awsa zostaja zwolnione. Powinno sie to obejsc bezkosztowo (o ile wybierzesz oczywiscie najtansza mozliwa maszynke aws :))


Wszystko by trzeba bylo trzymac w tym repozytorium.


Workflow
=========

* branch per etap
* stworzenie pull requestu
* review z naszej strony
* ew. poprawki
* merge


Inne wymagania
==============

* stworzenie README.md z informacja jak uruchomic projekt
* kod, commity, dokumentacja - po angielsku
* dyskusja przy review - moze byc po polsku


Technologie
===========

* python3
* Django 3.0.3
* terraform + terragrunt
* ansible
* postgresql 12
* docker
