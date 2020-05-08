# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    # User has_many Appointments, Spa has_many Treatments, Spa has_many Technicians, Treatments has_many Appointments, Technicians has_many Appointments
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    # Appointment belongs_to User, Appointment belongs_to Technician, Appointment belongs_to Treatment, Treatment belongs_to Spa, Technician belongs_to Spa
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    # User has_many Treatments through Appointments, User has_many Technicians through Appointments, and vice versa
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    # User has_many Treatments through Appointments, User has_many Technicians through Appointments, and vice versa
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    # Appointment has form to choose foreign objects as well as set Appointment Time
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    # Spa, Technician, Treatment, User (through Devise)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise)
    Devise
- [x] Include login (how e.g. Devise)
    Devise
- [x] Include logout (how e.g. Devise)
    Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    GitHub through Devise/OmniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    spa-technician, spa-treatment, user-appointment nested show pages, user-appointment nested index pages
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    spa-technician, spa-treatment, spa-appointment nested new routes
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
