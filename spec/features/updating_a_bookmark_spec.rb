# frozen_string_literal: true

# feature 'Updating a bookmark' do
#   scenario 'updates a bookmark' do
#     add_bookmark_feature(BBC_NEWS_URL, BBC_NEWS_TITLE)
#     click_button 'Edit Bookmark'
#
#     fill_in :url, with: HACKER_TYPER_URL
#     fill_in :title, with: HACKER_TYPER_TITLE
#     click_button 'Save Bookmark'
#
#     visit '/'
#     expect(page).to have_link(GOOGLE_TITLE, href: GOOGLE_URL)
#     expect(page).not_to have_link(HACKER_TYPER_TITLE, href: HACKER_TYPER_URL)
#   end
# end
