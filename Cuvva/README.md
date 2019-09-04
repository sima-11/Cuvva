# Description
* The codebase has been split into multiple targets. To compile, please follow this order: 1. DateConverter 2. Networking 3. API 4. Cuvva, the main app
* This test took me roughly 2 days + 3 nights
* I had to make a few compromises considering time, which are listed under Improvements section
* Some of places have hardcoded values, but all should come with comments to explain why hardcoded values are used.

# Improvements
* Add unit tests and have about 70% test coverage
* Make UI align with screenshots including timer for policy expiracy
* Get real *end_date* of a policy using original and extended policies
* Take *voided* policies into consideration
* Avoid hardcoded values

# Questions
* I'm not sure if I understand *PoicyEndTime* based on the description. As a user, can I extend a policy after it expired? If I can, is it still correct using *maxmium "end_date"* as the policy end time?

# Suggestions
* Better mock APIs?
* Font section doesn't provide size or weight
* Most colours don't have values provided. And colour value for `Action Green` seems incorrect?
* Not 100% sure if UI needs to align with the provided screenshots. Perhaps add specific UI requirements?
