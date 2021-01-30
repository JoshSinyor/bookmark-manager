# frozen_string_literal: true

feature 'Deleting a bookmark' do
  scenario 'deletes a bookmark' do
    add_bookmark_feature(HACKER_TYPER_URL, HACKER_TYPER_TITLE)
    click_button 'Delete Bookmark'

    visit '/'
    expect(page).not_to have_link(GOOGLE_URL, href: GOOGLE_TITLE)
  end
end
