# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  let(:con) { PG.connect dbname: 'bookmark_manager_test' }

  describe '.all' do
    it 'returns all bookmarks' do
      con.exec "INSERT INTO bookmarks (url, title) VALUES('#{BBC_NEWS_URL}', '#{BBC_NEWS_TITLE}')"
      con.exec "INSERT INTO bookmarks (url, title) VALUES('#{GOOGLE_URL}', '#{GOOGLE_TITLE}')"
      con.exec "INSERT INTO bookmarks (url, title) VALUES('#{MAKERS_URL}', '#{MAKERS_TITLE}')"

      expect(Bookmark.all[0].title).to include(BBC_NEWS_TITLE)
      expect(Bookmark.all[1].title).to include(GOOGLE_TITLE)
      expect(Bookmark.all[2].title).to include(MAKERS_TITLE)
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
      rs = Bookmark.add(HACKER_TYPER_URL, HACKER_TYPER_TITLE)[0]

      expect(rs['title']).to eq HACKER_TYPER_TITLE
      expect(rs['url']).to eq HACKER_TYPER_URL
    end
  end

  describe '.delete' do
    it 'deletes a specific bookmark from the database' do
      con.exec "INSERT INTO bookmarks (url, title) VALUES('#{BBC_NEWS_URL}', '#{BBC_NEWS_TITLE}')"
      rs = con.exec("INSERT INTO bookmarks (url, title) VALUES('#{GOOGLE_URL}', '#{GOOGLE_TITLE}') RETURNING *")[0]
      con.exec "INSERT INTO bookmarks (url, title) VALUES('#{MAKERS_URL}', '#{MAKERS_TITLE}')"

      Bookmark.delete(rs['id'])

      rs = con.query("SELECT EXISTS (SELECT title FROM bookmarks WHERE id='#{rs['id']}')")[0]
      expect(rs['exists']).to eq 'f'
    end
  end

  describe '.update' do
    it 'updates a bookmark from the database' do
      con.exec "INSERT INTO bookmarks (url, title) VALUES('#{BBC_NEWS_URL}', '#{BBC_NEWS_TITLE}')"
      rs = con.exec("INSERT INTO bookmarks (url, title) VALUES('#{GOOGLE_URL}', '#{GOOGLE_TITLE}') RETURNING *")[0]
      con.exec "INSERT INTO bookmarks (url, title) VALUES('#{MAKERS_URL}', '#{MAKERS_TITLE}')"

      Bookmark.update(rs[0]['id'], HACKER_TYPER_URL, HACKER_TYPER_TITLE)

      rs = con.query("SELECT * FROM bookmarks WHERE id='#{rs['id']}')")[0]
      expect(rs['url']).to eq HACKER_TYPER_URL
      expect(rs['title']).to eq HACKER_TYPER_TITLE
    end
  end
end
