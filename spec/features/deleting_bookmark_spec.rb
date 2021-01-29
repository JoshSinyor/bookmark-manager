# frozen_string_literal: true

feature 'Deleting a bookmark' do
  scenario 'user adds three bookmarks and deletes the second' do
    add_bookmark_feature(SITE_BBC_NEWS_URL, SITE_BBC_NEWS_TITLE)
    click_button('Delete Bookmark')
# Got to get ID for this to work.
    expect(page).not_to have_content(SITE_BBC_NEWS_TITLE)
# Expect it not to have link as well.
  end
end
