# frozen_string_literal: true

feature 'Adding a bookmark' do
  scenario 'user clicks add link button' do
    visit('/')
    click_button('Add Bookmark')
    expect(page).to have_content 'Add Bookmark'
  end

  scenario 'adds new link' do
    add_bookmark_feature(HACKER_TYPER_URL, HACKER_TYPER_TITLE)
    expect(page).to have_content HACKER_TYPER_TITLE
    page.has_link?(HACKER_TYPER_URL)
  end
end
