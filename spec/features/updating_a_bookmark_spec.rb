# frozen_string_literal: true

# feature 'Updating a bookmark' do
#   scenario 'a user can update a bookmark' do
#     add_bookmark_feature(BBC_NEWS_URL, BBC_NEWS_TITLE)
#     click_button('Edit')
#
#     fill_in('url', with: GOOGLE_URL)
#     fill_in('title', with: GOOGLE_TITLE)
#     click_button('Save')
#
#     visit '/'
#     expect(page).to have_link(GOOGLE_TITLE, href: GOOGLE_URL)
#     expect(page).not_to have_link(BBC_NEWS_TITLE, href: BBC_NEWS_URL)
#   end
# end
