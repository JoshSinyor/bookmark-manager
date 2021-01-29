feature 'Updating a bookmark' do
  scenario 'a user can update a bookmark' do
    add_bookmark_feature(SITE_BBC_NEWS_URL, SITE_BBC_NEWS_TITLE)
    page.has_link?(SITE_BBC_NEWS_URL)
    click_button('Edit')

    fill_in("url", with: SITE_GOOGLE_URL)
    fill_in("title", with: SITE_GOOGLE_TITLE)
    click_button("Save")

    expect(page).to have_link(SITE_GOOGLE_TITLE, href: SITE_GOOGLE_URL)
    expect(page).not_to have_link(SITE_BBC_NEWS_TITLE, href: SITE_BBC_NEWS_URL)
  end
end
