# frozen_string_literal: true

feature 'Deleting a bookmark' do
  scenario 'user adds three bookmarks and deletes the second' do
    add_bookmark_feature(BBC_NEWS_URL, BBC_NEWS_TITLE)
    click_button('Delete Bookmark')
    # Got to get ID for this to work.
    expect(page).not_to have_link(BBC_NEWS_TITLE, href: BBC_NEWS_URL)
  end
end
