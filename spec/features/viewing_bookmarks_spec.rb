# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'shows all bookmarks' do
    add_bookmark_feature(BBC_NEWS_URL, BBC_NEWS_TITLE)
    add_bookmark_feature(GOOGLE_URL, GOOGLE_TITLE)
    add_bookmark_feature(MAKERS_URL, MAKERS_TITLE)

    visit '/'
    expect(page).to have_link(BBC_NEWS_TITLE, href: BBC_NEWS_URL)
    expect(page).to have_link(GOOGLE_TITLE, href: GOOGLE_URL)
    expect(page).to have_link(MAKERS_TITLE, href: MAKERS_URL)
  end
end
