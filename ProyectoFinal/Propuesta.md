# Shelter Animal Outcomes

# Miembros del proyecto

Alejandro Alcalde Barros.

## Descripción del problema

En este problema se trata de predecir el destino de un animal en un centro de animales en función de sus caracteristicas (raza, color, sexo, edad, nombre etc.). Las posibles salidas son:

- Se da en adopción
- Muere
- Se sacrifica
- Se devuelve a su dueño
- Se transfiere

## Los datos

A continuación se muestra un ejemplo de los datos (10 variables):

```python
AnimalID    Name            DateTime     OutcomeType OutcomeSubtype AnimalType
   (chr)   (chr)               (chr)           (chr)          (chr)      (chr)
1   A671945 Hambone 2014-02-12 18:22:00 Return_to_owner                       Dog
2   A656520   Emily 2013-10-13 12:44:00      Euthanasia      Suffering        Cat
3   A686464  Pearce 2015-01-31 12:28:00        Adoption         Foster        Dog
4   A683430         2014-07-11 19:09:00        Transfer        Partner        Cat
5   A667013         2013-11-15 12:52:00        Transfer        Partner        Dog
SexuponOutcome AgeuponOutcome                             Breed       Color
      (chr)          (chr)                             (chr)       (chr)
 Neutered Male         1 year             Shetland Sheepdog Mix Brown/White
 Spayed Female         1 year            Domestic Shorthair Mix Cream Tabby
 Neutered Male        2 years                      Pit Bull Mix  Blue/White
   Intact Male        3 weeks            Domestic Shorthair Mix  Blue Cream
 Neutered Male        2 years       Lhasa Apso/Miniature Poodle         Tan
```

## Propuesta

Los datos están desbalanceados, por lo que sería necesario aplicar técnicas de _oversampling_ o _undersampling_ para nivelar la cantidad de datos en cada clase. Otra opción es considerar como una sola clase las clases en las que el animal muere (Muere o se sacrifica).

Por la naturaleza del problema, casi todas las variables son categóricas, salvo la edad el animal. Por tanto sería interesante usar árboles de clasificación (_Random forest_). Otra opción sería aplicar _Boosting_, en este caso se usaría la librería _XGBoost_ (_eXtreme Gradient Boosting_).

### Preprocesamiento de los datos

Como se aprecia en los datos de ejemplo, es necesario tratar los datos antes de aplicar los modelos. Se propone lo siguiente:

- La edad del animal viene dada en un formato poco riguroso, algunos en años, otros en meses o días. Será necesario pasarlo todo a una unidad, a días por ejemplo.
- En total la base de datos tiene 18 valores perdidos de un total de 26729 instancias, como primera aproximación podríamos prescindir de estos valores.
- La variable _SexuponOutcome_ contiene demasiada información (Si el animal está esterilizado y es hembra, castrado y es macho, o si está intacto y es hembra o macho). Lo ideal sería separar esta información en nuevas variables. Se propone dividirla en dos variables:
  - _Sex_: Conteniendo si es hembra o macho
  - _Neutered_: Que contiene si el animal ha sido esterilizado o no.
