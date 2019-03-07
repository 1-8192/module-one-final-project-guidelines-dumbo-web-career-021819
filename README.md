# D&D 5e Spell Search

This CLI application allows the user to browse through class and spell information drawn directly from the D&D 5e API. Spell searches can be refined by class, level, and school of magic. It also allows the user to save spells to slots for a specific class to help build their character.

# Install Guide
1. Clone directory from github
2. Bundle install gems
3. rake db:migrate to populate the database.
4. Run using the bin/run.rb file.

# Built With
RestClient - for seeding the database
TTY-Prompt - for streamlining user input
ActiveRecord - for handling database changes

# Authors
Antoinette Lee (Nyette)
Alessandro Allegranzi (1-8192)

# Acknowledgments
Shout-out to Wizards of the Coast for making a wonderful game
API used: http://www.dnd5eapi.co/
