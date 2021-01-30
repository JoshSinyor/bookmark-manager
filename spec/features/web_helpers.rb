# frozen_string_literal: true

# Constants

BBC_NEWS_URL = 'https://www.bbc.co.uk/news'
BBC_NEWS_TITLE = 'BBC News'

GOOGLE_URL = 'https://www.google.co.uk/'
GOOGLE_TITLE = 'Google'

HACKER_TYPER_URL = 'http://www.hackertyper.com/'
HACKER_TYPER_TITLE = 'Hacker Typer'

MAKERS_URL = 'https://www.makers.tech/'
MAKERS_TITLE = 'Makers Academy'

# Feature Test Web Helpers

def add_bookmark_feature(url, title)
  visit '/'
  click_button 'Add Bookmark'
  fill_in :url, with: url
  fill_in :title, with: title
  click_button 'Save Bookmark'
end
