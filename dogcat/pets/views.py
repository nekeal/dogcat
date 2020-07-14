from django.views.generic import CreateView, DetailView

from dogcat.pets.forms import PetForm
from dogcat.pets.models import Pet


class PetCreateView(CreateView):
    form_class = PetForm
    template_name = 'pets/pet_create_form.html'


class PetDetailView(DetailView):
    queryset = Pet.objects.all()
