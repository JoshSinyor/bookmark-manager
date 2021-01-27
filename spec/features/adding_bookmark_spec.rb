# frozen_string_literal: true

feature 'Adding a bookmark' do
  scenario 'user clicks add link button' do
    visit('/')
    click_button('Add link')
    expect(page).to have_content 'Add link'
  end

  scenario 'adds new link' do
    add_bookmark(SITE_HACKER_TYPER_URL, SITE_HACKER_TYPER_TITLE)
    expect(page).to have_content SITE_HACKER_TYPER_TITLE
    page.has_link?(SITE_HACKER_TYPER_URL)
  end
end
