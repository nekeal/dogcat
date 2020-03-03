from django import forms

from dogcat.pets.models import Pet


class PetForm(forms.ModelForm):

    class Meta:
        model = Pet
        fields = ('short_description', 'image', 'kind')
