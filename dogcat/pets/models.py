from enum import Enum
from typing import List, Tuple

from django.db import models
from django.urls import reverse


class PetKindChoices(Enum):
    DOG = "Dog"
    CAT = 'Cat'
    BIRD = 'Bird'
    SNAKE = 'Snake'
    SPIDER = 'Spider'
    TURTLE = 'Turtle'

    def __str__(self) -> str:
        return self.name

    @classmethod
    def choices(cls) -> List[Tuple[str, str]]:
        return [(tag.name, tag.value) for tag in cls]


class Pet(models.Model):
    short_description = models.CharField(max_length=100, blank=True)
    image = models.ImageField()
    kind = models.CharField(max_length=20, choices=PetKindChoices.choices())

    def get_absolute_url(self):
        return reverse('pet_detail', kwargs={'pk': self.id})
